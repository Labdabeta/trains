#include "tasks.h"
#include "trains/path_finder.h"
#include "trains/sensors.h"
#include "util/async_delay.h"
#include "trains/track_server.h"
#include "trains/calibration_master.h"
#include "conductor.h"
#include "service.h"

#define SIV static inline void
#define SII static inline int

#define p_SPEED 10
#define p_TRAIN 70

#if p_TRAIN == 70
#define reg_a 149
#define reg_b 10224
#endif

#if p_TRAIN == 69
#define reg_a 140
#define reg_b 5577
#endif

// old 69 (145,7852)

struct Data {
	int caller, client, maker_tid;
	struct RestrictedPath pathAB, pathBA;
	struct Restrictions restrictions;
	struct flip_request flip_req;
	struct route_request points;
	int track_tid, clock_tid;
	int sensor_index[80];
	track_calibration* cal;
	//int times[2 * MAX_PATH_LENGTH];
	struct TrackServerMessage activ, timeout;
	int prev_sensor, prev_time, delay, important, circle_len;
	int stopping_dist, dist_after, future_vel;
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

SIV findCircle(struct Data *d)
{
	findRestrictedPath(d->points.source, d->points.dest, &d->restrictions, &d->pathAB);
	findRestrictedPath(d->points.dest, d->points.source, &d->restrictions, &d->pathBA);
	int i, j;
	for(i = 0; i < 80; i++)
		d->sensor_index[i] = -1;
	for(i = 0; i < d->pathAB.length; i++)
		d->sensor_index[S_ID(d->pathAB.sensors[i])] = i;
	for(j = 1; j < d->pathBA.length; j++)
		d->sensor_index[S_ID(d->pathBA.sensors[j])] = i+j-1;
	d->circle_len = i+j-2;
}

int is_circ_known(struct Data *d, track_calibration* known)
{
	int ind = 0;
	int src, dest;
	do{
		ind = ind_plus(d, ind, -1);
		src = ind_to_id(d, ind);
	} while(is_dead(known, src));

	for(ind = 0; ind < d->circle_len; ind++){
		dest = ind_to_id(d, ind);
		if(!is_dead(known, dest)){
			printf("Considering %c%d to %c%d\n\r", SID_PRINT(src), SID_PRINT(dest));
			if(find_time(known, src, dest) == -1){
				printf("Failed\n\r");
				return 0;
			} else{
				src = dest;
			}
		}
	}
	return 1;
}

SIV flip(struct Data *d, struct RestrictedPath *path, int ind)
{
	for (int bit = 1; bit <= SWITCH_MAX; ++bit) {
		if (IS_CURVED(path->masks[ind], bit)) {
			printf("Flip index: %d (%d)\n\r", ind, bit);
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

SIV back_dist(struct Data *d, int ind, int dist, int *important, int *b_dist)
{
	int res;
	for(res = ind; dist_circbetween(d, res, ind) < dist || is_dead(d->cal, ind_to_id(d, res));
		res = ind_plus(d, res, -1));
	*important = ind_to_id(d, res);
	*b_dist = dist_circbetween(d, res, ind) - dist;
}

SII vel_from(struct Data *d, int ind, int num)
{
	while(is_dead(d->cal, ind_to_id(d, ind))){
		ind = ind_plus(d, ind, 1);
		num++;
	}
	printf("Initial ind: %d %c%d\n\r", ind, SID_PRINT(ind_to_id(d, ind)));
	int prev_ind = ind_plus(d, ind, -1 * num);
	printf("Prev attempt: %d %c%d\n\r", prev_ind, SID_PRINT(ind_to_id(d, prev_ind)));
	while(is_dead(d->cal, ind_to_id(d, prev_ind))){
		printf("Dead: %c%d\n\r", SID_PRINT(ind_to_id(d, prev_ind)));
		prev_ind = ind_plus(d, prev_ind, -1);
	}
	printf("Prev actual: %d %c%d\n\r", prev_ind, SID_PRINT(ind_to_id(d, prev_ind)));
	int ret = dist_circbetween(d, prev_ind, ind);
	int total_time = 0;
	int cur_ind = prev_ind;
	while(prev_ind != ind){
		do{
			cur_ind = ind_plus(d, cur_ind, 1);
		} while(is_dead(d->cal, ind_to_id(d, cur_ind)));
		int next_time = find_time(d->cal, ind_to_id(d, prev_ind), ind_to_id(d, cur_ind));
		printf("Time between: %c%d and %c%d is %d\n\r",
			SID_PRINT(ind_to_id(d, prev_ind)), SID_PRINT(ind_to_id(d, cur_ind)), next_time);
		total_time += next_time;
		prev_ind = cur_ind;
	}
	ret = 100 * ret / total_time;
	return ret;
}

SIV set_init_stop_dist(struct Data *d, int ind)
{
	printf("Entering stop set.\n\r");
	d->future_vel = vel_from(d, ind, 2);
	printf("Velocity found.\n\r");
	d->stopping_dist = (d->future_vel * reg_a - reg_b) / 100;
	back_dist(d, ind, d->stopping_dist, &d->important, &d->dist_after);
	printf("Predicted stop dist: %d\n\r", d->stopping_dist);
	d->delay = 100 * d->dist_after / vel_from(d, ind, 2);
}

SIV sensor_logic(struct Data *d, int sensor)
{
	if(sensor == d->important){
		if(sensor != d->prev_sensor){
			printf("Critical error - missed important!\n\r");
			async_delay(d->clock_tid, 0, (char *) &d->timeout, sizeof(d->timeout));
		} else{
			async_delay(d->clock_tid, d->delay, (char *) &d->timeout, sizeof(d->timeout));
		}
	}
	if(sensor == d->points.source){
		d->flag++;
		if(d->flag == 1)
			set_init_stop_dist(d, d->sensor_index[d->points.dest]);
	}
}

SIV reg_sens(struct Data *d)
{
	int cur_index = d->sensor_index[S_ID(d->activ.data.sensor.sensor)];
	int cur_time = Time(d->clock_tid);
	if(cur_index == -1){
		printf("Sensor not on my path!\n\r");
		return;
	}
	flip_ind(d, ind_plus(d, cur_index, 1));
	flip_ind(d, ind_plus(d, cur_index, 2));
	if(d->prev_sensor != -1){
		int prev_index = d->sensor_index[d->prev_sensor];
		int diff = ind_plus(d, cur_index, -1 * prev_index);
		if(!d->flag){
			printf("Recording pair %c%d to %c%d at %d\n\r", SID_PRINT(d->prev_sensor), S_PRINT(d->activ.data.sensor.sensor), cur_time - d->prev_time);
			if(diff == 1){
				record_edge(d->cal, d->prev_sensor, ind_to_id(d, cur_index), cur_time - d->prev_time);
			} else{
				record_mult(d->cal, d->prev_sensor, ind_to_id(d, cur_index), cur_time - d->prev_time);
			}
		}
		for(int i = 1; i < diff; i++){
			int missed_id = ind_to_id(d, ind_plus(d, prev_index, i));
			sensor_logic(d, missed_id);
			if(!d->flag){
				set_dead(d->cal, missed_id);
				printf("Setting %c%d as dead\n\r", SID_PRINT(missed_id));
			}
		}
	}
	d->prev_sensor = S_ID(d->activ.data.sensor.sensor);
	d->prev_time = cur_time;
	printf("Hit: %c%d\n\r", S_PRINT(d->activ.data.sensor.sensor));
	sensor_logic(d, d->prev_sensor);
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
	printf("Entering precise stop (tid: %d)\n\r", MyTid());
	struct Data d;
	initialize(&d);
	tput2(p_SPEED, p_TRAIN);
	while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(d.activ));
		Reply(d.caller, 0, 0);
		if(d.activ.type == TSMT_SENSOR_DOWN){
			if(S_ID(d.activ.data.sensor.sensor) != 60)
				reg_sens(&d);
		} else{
			tput2(16, p_TRAIN);
			break;
		}
	}
	Reply(d.client, 0, 0);
	unregisterForSensorDown(d.track_tid, -1);
	Exit();
}
