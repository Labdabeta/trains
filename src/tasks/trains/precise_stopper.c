#if 0
#include "tasks.h"
#include "trains/path_finder.h"
#include "trains/sensors.h"
#include "util/async_delay.h"
#include "trains/track_server.h"
#include "calibration_master.h"
#include "precise_stopper.h"
#include "conductor.h"
#include "service.h"

#define SIV static inline void
#define SII static inline int

#define p_SPEED 10

struct Data {
	int caller, client, maker_tid;
	struct RestrictedPath pathAB, pathBA;
	struct Restrictions restrictions;
	struct flip_request flip_req;
	struct route_request points;
	int track_tid, clock_tid;
	track_calibration* cal;
	struct TrackServerMessage activ, timeout;
	int prev_id, prev_ind, prev_time, delay, important, circle_len;
	int stopping_dist, dist_after, future_vel, speed;
	int flag;
};

SII ind_plus(struct Data *d, int ind, int diff)
{
	return (ind + diff + d->circle_len) % d->circle_len;
}

SII ind_to_id(struct Data *d, int ind)
{
	return S_ID((ind < d->pathAB.length-1) ? d->pathAB.sensors[ind]
		: d->pathBA.sensors[ind - d->pathAB.length + 1]);
}

SII id_to_ind(struct Data *d, int id, int prev_ind)
{
	if(prev_ind == -1)
		prev_ind = d->circle_len-1;
	int count;
	for(count = 0; ind_to_id(d, prev_ind) != id && count < d->circle_len;
		prev_ind = ind_plus(d, prev_ind, 1), ++count);
	return (count == d->circle_len) ? -1 : prev_ind;
}

SIV flip(struct Data *d, struct RestrictedPath *path, int ind)
{
	for (int bit = 1; bit <= SWITCH_MAX; ++bit) {
		if (IS_CURVED(path->masks[ind], bit)) {
			//printf("Flip index: %d (%d)\n\r", ind, bit);
			d->flip_req.position = (IS_CURVED(path->states[ind], bit) ? 34 : 33);
			d->flip_req.switch_id = SW_ID_TO_NUM(bit);
			Send(d->maker_tid, (char *) &d->flip_req, sizeof(struct flip_request), 0, 0);
		}
	}
}

SIV flip_ind(struct Data* d, int ind){
	if(ind > 0 && ind < d->pathAB.length){
		flip(d, &d->pathAB, ind);
	} else if (ind == 0) {
		flip(d, &d->pathBA, d->pathBA.length - 1);
	} else {
		flip(d, &d->pathBA, ind - d->pathAB.length + 1);
	}
}

SIV printPath(struct RestrictedPath *p)
{
    int i;
    printf("START\n\r");
    for (i = 0; i < p->length; ++i) {
        printf("\tSegment %d: \n\r"
               "\t\tDistance - %d mm\n\r"
               "\t\tDestination - %c%d\n\r"
               "\t\tSwitch Configuration - %x\n\r"
               "\t\tSwitch Mask - %x\n\r",
               i + 1,
               p->distances[i],
               p->sensors[i].group + 'A',
               p->sensors[i].id + 1,
               p->states[i],
               p->masks[i]);
    }
    printf("END\n\r");
}

SII dist_circindex(struct Data *d, int ind)
{
	if(ind < d->pathAB.length){
		return d->pathAB.distances[ind];
	} else{
		return d->pathAB.distances[d->pathAB.length - 1] + d->pathBA.distances[ind - d->pathAB.length + 1];
	}
}

SII dist_circbetween(struct Data *d, int i1, int i2)
{
	if(i1 <= i2){
		return dist_circindex(d, i2) - dist_circindex(d, i1);
	} else{
		int dist = d->pathAB.distances[d->pathAB.length - 1] + d->pathBA.distances[d->pathBA.length - 1];
		return dist - dist_circindex(d, i1) + dist_circindex(d, i2);
	}
}

SIV findCircle(struct Data *d)
{
	findRestrictedPath(d->points.source, d->points.dest, &d->restrictions, &d->pathAB);
	findRestrictedPath(d->points.dest, d->points.source, &d->restrictions, &d->pathBA);
	d->circle_len = d->pathAB.length + d->pathBA.length - 2;
}

int is_circ_known(struct Data *d, track_calibration* known)
{
	int prev_ind = 0;
	do{
		prev_ind = ind_plus(d, prev_ind, -1);
	} while(is_dead(known, ind_to_id(d, prev_ind)));

	int ind;
	for(ind = 0; ind < d->circle_len; ind++){
		int src = ind_to_id(d, prev_ind);
		int dest = ind_to_id(d, ind);
		if(!is_dead(known, dest)){
			if(find_time(known, src, dest) == -1){
				if(is_calibration)
					return 0;
				int t = dist_circbetween(d, prev_ind, ind) / 5;
				int diff = ind_plus(d, ind, -1 * prev_ind);
				if(diff == 1){
					record_edge(known, src, dest, t);
				} else{
					record_mult(known, src, dest, t);
				}
			}
			prev_ind = ind;
		}
	}
	return 1;
}

SIV back_dist(struct Data *d, int ind, int dist, int *important, int *b_dist)
{
	int res;
	for(res = ind; dist_circbetween(d, res, ind) < dist || is_dead(d->cal, ind_to_id(d, res));
		res = ind_plus(d, res, -1));
	*important = res;
	*b_dist = dist_circbetween(d, res, ind) - dist;
}

// default is 500
SII vel_from(struct Data *d, int ind, int num)
{
	while(is_dead(d->cal, ind_to_id(d, ind))){
		ind = ind_plus(d, ind, 1);
		num++;
	}
	int prev_ind = ind_plus(d, ind, -1 * num);
	while(is_dead(d->cal, ind_to_id(d, prev_ind))){
		prev_ind = ind_plus(d, prev_ind, -1);
	}
	int ret = dist_circbetween(d, prev_ind, ind);
	int total_time = 0;
	int cur_ind = prev_ind;
	while(prev_ind != ind){
		do{
			cur_ind = ind_plus(d, cur_ind, 1);
		} while(is_dead(d->cal, ind_to_id(d, cur_ind)));
		int next_time = find_time(d->cal, ind_to_id(d, prev_ind), ind_to_id(d, cur_ind));
		total_time += next_time;
		prev_ind = cur_ind;
	}
	ret = 100 * ret / total_time;
	printf("Velocity %d\n\r", ret);
	return ret;
}

SIV set_init_stop_dist(struct Data *d, int ind)
{
	d->future_vel = vel_from(d, ind, 2);
	d->stopping_dist = (d->future_vel * d->cal->reg_a - d->cal->reg_b) / 100;
	if(d->pathAB.distances[d->pathAB.length-1] < 850){
		d->speed = 2;
		d->stopping_dist = 30;
	}
	back_dist(d, ind, d->stopping_dist, &d->important, &d->dist_after);
	printf("Predicted stop dist: %d, go after %c%d\n\r", d->stopping_dist, SID_PRINT(ind_to_id(d, d->important)));
	d->delay = (d->speed == 2) ? 77 : vel_from(d, ind_plus(d, d->important, 1), 2);
	d->delay = 100 * d->dist_after / d->delay;
}

SIV sensor_logic(struct Data *d, int ind)
{
	if(ind == d->important){
		if(ind != d->prev_ind){
			printf("Critical error - missed important!\n\r");
			async_delay(d->clock_tid, 0, (char *) &d->timeout, sizeof(d->timeout));
		} else{
			async_delay(d->clock_tid, d->delay, (char *) &d->timeout, sizeof(d->timeout));
		}
	}
	if(ind == 0){
		d->flag++;
		if(d->flag == 1)
			set_init_stop_dist(d, d->pathAB.length-1);
	}
}

SIV reg_sens(struct Data *d)
{
	int cur_id = S_ID(d->activ.data.sensor.sensor);
	int cur_ind = id_to_ind(d, cur_id, d->prev_ind);
	int cur_time = Time(d->clock_tid);

	if(cur_ind == -1){
		printf("Sensor not on my path!\n\r");
		return;
	}
	flip_ind(d, ind_plus(d, cur_ind, 1));
	flip_ind(d, ind_plus(d, cur_ind, 2));
	if(d->prev_ind != -1){
		int diff = ind_plus(d, cur_ind, -1 * d->prev_ind);
		int diff_t = cur_time - d->prev_time;
		if(!d->flag){
			printf("Rec: (%c%d, %c%d), %d\n\r", SID_PRINT(d->prev_id), SID_PRINT(cur_id), diff_t);
			if(diff == 1){
				record_edge(d->cal, d->prev_id, cur_id, diff_t);
			} else{
				record_mult(d->cal, d->prev_id, cur_id, diff_t);
			}
		}
		for(int i = 1; i < diff; i++){
			int missed_ind = ind_plus(d, d->prev_ind, i);
			int missed_id = ind_to_id(d, missed_ind);
			sensor_logic(d, missed_ind);
			if(!d->flag){
				set_dead(d->cal, missed_id);
				printf("Setting %c%d as dead\n\r", SID_PRINT(missed_id));
			}
		}
	}
	d->prev_id = cur_id;
	d->prev_ind = cur_ind;
	d->prev_time = cur_time;
	printf("Hit: %c%d\n\r", S_PRINT(d->activ.data.sensor.sensor));
	sensor_logic(d, d->prev_ind);
}

SIV initialize(struct Data *d)
{
	for (int i = 0; i < TRACK_MAX; ++i) {
		d->restrictions.isEnabled[i] = 1;
	}
	Receive(&d->client, (char *) &d->maker_tid, sizeof(int));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->cal, sizeof(int*));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->points, sizeof(struct route_request));
	findCircle(d);
	printPath(&d->pathAB);
	printPath(&d->pathBA);
	d->track_tid = WhoIs("TRACK");
	registerForSensorDown(d->track_tid, -1);
	d->clock_tid = WhoIs("CLOCK");
	d->timeout.type = TSMT_NONE;
	d->prev_ind = d->prev_id = -1;
	d->delay = d->important = -1337;
	d->flag = is_circ_known(d, d->cal) ? 0 : -1;
	d->speed = p_SPEED;
	tput2(d->speed, d->cal->train);
	Delay(d->clock_tid, 10);
	if(!d->flag){ // This is for far distances
		set_init_stop_dist(d, d->pathAB.length - 1);
		d->flag++;
	}
}

SIV initialize(struct Data *d)
{
	for (int i = 0; i < TRACK_MAX; ++i) {
		d->restrictions.isEnabled[i] = 1;
	}
	Receive(&d->client, (char *) &d->maker_tid, sizeof(int));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->cal, sizeof(int*));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->points, sizeof(struct route_request));
	findCircle(d);
	printPath(&d->pathAB);
	printPath(&d->pathBA);
	d->track_tid = WhoIs("TRACK");
	registerForSensorDown(d->track_tid, -1);
	d->clock_tid = WhoIs("CLOCK");
	d->timeout.type = TSMT_NONE;
	d->prev_sensor = -1;
	d->delay = d->important = -1337;
	d->flag = is_circ_known(d, d->cal) ? 0 : -1;
	if(!d->flag){ // This is for far distances
		set_init_stop_dist(d, d->sensor_index[d->points.dest]);
		d->flag++;
	}
}

void precise_stop(){
	struct Data d;
	initialize(&d);
	printf("Entering precise stop (tid: %d)\n\r", MyTid());
	tput2(d.speed, d.cal->train);
	Reply(d.client, 0, 0);
	while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(d.activ));
		Reply(d.caller, 0, 0);
		if(d.activ.type == TSMT_SENSOR_DOWN){
			reg_sens(&d);
		} else{
			tput2(16, d.cal->train);
			break;
		}
	}
	unregisterForSensorDown(d.track_tid, -1);
	Exit();
}
#endif
