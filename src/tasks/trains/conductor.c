#include "tasks.h"
#include "trains/path_finder.h"
#include "trains/sensors.h"
#include "util/async_delay.h"
#include "trains/track_server.h"
#include "conductor.h"
#include "service.h"

#define SIV static inline void
#define SII static inline int

static inline int index_sensor(char group, int number){
	return 16 * (group-'A') + number - 1;
}

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

void path_maker(void){
	Service();

	int caller;
	struct PathSwitchPositions route;
	int clock_tid = WhoIs("CLOCK");

	while(1){
		Receive(&caller, (char *) &route, sizeof(struct PathSwitchPositions));
		Reply(caller, 0, 0);

		for(int i = 0; i < route.length; i++){
			tput2(route.positions[i], route.stations[i]);
			Delay(clock_tid, 5);
		}
		tputc(32);
	}
}

static inline int vel(struct TrackPath *path, int *times, int i, int d){
	return 100 * (path->distances[i] - path->distances[i-d]) / (times[i] - times[i-d]);
}

SIV backdist(struct TrackPath *path, int dist, int *index, int* diff){
	int temp = 0;
	while(path->distances[++temp] <= dist);
	temp--;
	*diff = dist - path->distances[temp];
	*index = temp;
}

SIV setstop(struct TrackPath *path, int stopping_dist, int *important,
	int* dist_after, int * delay, int* times){
	backdist(path, path->distances[path->length - 1] - stopping_dist, important, dist_after);
	dprintf("After index: %d, Dist after: %d\n\r", *important, *dist_after);
	*delay = 100 * *dist_after / vel(path, times, *important, 1);
	*important = path->stations[*important];
}

SIV setstopconst(struct TrackPath *path, int starting_dist, int *important,
	int* dist_before, int * delay, int velocity){
	backdist(path, path->distances[path->length - 1] - starting_dist, important, dist_before);
	dprintf("Before index: %d, Dist after: %d\n\r", *important, *dist_before);
	*delay = 100 * *dist_before / velocity;
	*important = path->stations[*important];
}

static inline int opposite(int sensor){
	return sensor + (sensor % 2 ? -1 : 1);
}

SIV reverse(struct TrackPath *pathAB, struct TrackPath *pathBA,
		struct PathSwitchPositions *switchesAB, struct PathSwitchPositions *switchesBA,
		struct route_request *points, int maker_tid){
	int temp = opposite(points->dest);
	points->dest = opposite(points->source);
	points->source = temp;
	findPath(points->source, points->dest, pathAB, switchesAB);
	findPath(points->dest, points->source, pathBA, switchesBA);
	Send(maker_tid, (char *) switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
}

typedef enum{
	p_STATE_neither,
	p_STATE_stop,
	p_STATE_inspection,
	p_STATE_reverse,
	p_STATE_rev_stop,
	p_STATE_forward,
	p_STATE_fwd_stop,
	p_STATE_fwd_inspection
} p_sensor;

typedef enum{
	p_STATE_SZS
} p_timeout;

/*static inline void measure_distance(){
	int initial = Time(clock_tid);

}*/

struct Data {
	int caller, client, maker_tid;
	struct TrackPath pathAB, pathBA;
	struct PathSwitchPositions switchesAB, switchesBA;
	struct route_request points;
	int track_tid, clock_tid;
	int sensor_index[80];
	int times[2 * MAX_PATH_LENGTH];
	struct TrackServerMessage activ, timeout;
	int prev_sensor, delay, important, circle_len; //Current values
	int fwd_delay, fwd_important, stopping_dist, dist_after, future_vel; // For stopping
	int bwd_delay, bwd_important, starting_dist, dist_before, rev_time; // For starting
	p_sensor s_state;
	p_timeout t_state;
};

SIV findCircle(struct Data *d)
{
	findPath(d->points.source, d->points.dest, &d->pathAB, &d->switchesAB);
	findPath(d->points.dest, d->points.source, &d->pathBA, &d->switchesBA);
	int i, j;
	for(i = 0; i < 80; i++)
		d->sensor_index[i] = -1;
	for(i = 0; i < d->pathAB.length; i++)
		d->sensor_index[d->pathAB.stations[i]] = i;
	for(j = 1; j < d->pathBA.length; j++)
		d->sensor_index[d->pathBA.stations[j]] = i+j-1;
	d->circle_len = i+j-1;
	for(i = 0; i < d->circle_len - 1; i++)
		d->times[i] = -1;
}

SIV flip(int maker_tid, struct PathSwitchPositions *sw)
{
	Send(maker_tid, (char *) sw, sizeof(struct PathSwitchPositions), 0, 0);
}

ENTRY initialize(struct Data *d)
{
	Receive(&d->client, (char *) &d->maker_tid, sizeof(int));
	Reply(d->client, 0, 0);
	Receive(&d->client, (char *) &d->points, sizeof(struct route_request));
	findCircle(d);
	flip(d->maker_tid, &d->switchesBA);
	d->track_tid = WhoIs("TRACK");
	registerForSensorDown(d->track_tid, -1);
	d->clock_tid = WhoIs("CLOCK");
	d->timeout.type = TSMT_NONE;
	d->prev_sensor = d->delay = d->important = -1;
	//d->s_state = p_STATE_neither;
}

static inline int dist_circindex(struct Data *d, int ind)
{
	if(ind < d->pathAB.length){
		return d->pathAB.distances[ind];
	} else{
		return d->pathAB.distances[d->pathAB.length - 1] + d->pathBA.distances[ind - d->pathAB.length + 1];
	}
}

static inline int dist_circbetween(struct Data *d, int i1, int i2)
{
	if(i1 <= i2){
		return dist_circindex(d, i2) - dist_circindex(d, i1);
	} else{
		int dist = d->pathAB.distances[d->pathAB.length - 1] + d->pathBA.distances[d->pathBA.length - 1];
		return dist - dist_circindex(d, i1) + dist_circindex(d, i2);
	}
}

SII vel_from(struct Data *d, int ind, int num)
{
	int prev_ind = (ind - num + d->circle_len) % d->circle_len;
	while(d->times[prev_ind] == -1){
		prev_ind = (prev_ind - 1 + d->circle_len) % d->circle_len;
	}
	int ret = dist_circbetween(d, prev_ind, ind);
	ret = 100 * ret / (d->times[ind] - d->times[prev_ind]);
	return ret;
}

SIV reg_sens(struct Data *d)
{
	int cur_index = d->sensor_index[S_ID(d->activ.data.sensor)];
	d->times[cur_index] = Time(d->clock_tid);
	if(cur_index == -1){
		printf("Sensor not on my path!\n\r");
		return;
	}
	if(d->prev_sensor != -1){
		int prev_index = d->sensor_index[d->prev_sensor];
		int diff = cur_index - prev_index;
		diff = (diff + d->circle_len) % d->circle_len;
		for(int i = 1; i < diff; i++)
			d->times[(prev_index + i) % d->circle_len] = -1;
		int dist = dist_circbetween(d, prev_index, cur_index);
		printf("I hit %c%d. Previously I hit %c%d. The dist is: %d. \n \r",
			S_PRINT(d->activ.data.sensor), SID_PRINT(d->prev_sensor), dist);
		printf("Velocity: %d, 2Vel: %d\n\r", vel_from(d, cur_index, diff), vel_from(d, cur_index, diff+1));
	}
	d->prev_sensor = S_ID(d->activ.data.sensor);
}

SIV set_init_stop_dist(struct Data *d, int ind)
{
	d->future_vel = vel_from(d, ind, 2);
	d->stopping_dist = (d->future_vel * reg_a - reg_b) / 100;
	printf("Predicted stop dist: %d\n\r", d->stopping_dist);
	//setstop(&pathAB, stopping_dist, &fwd_important, &dist_after, &fwd_delay, times);
	//important = fwd_important;
	//delay = fwd_delay;
}

void precise_stop(){
	struct Data d;
	initialize(&d);

	//tput2(p_SPEED, p_TRAIN);
	while(1){
		Receive(&d.caller, (char *) &d.activ, sizeof(struct TrackServerMessage));
		Reply(d.caller, 0, 0);
		if(d.activ.type == TSMT_SENSOR_DOWN){
			reg_sens(&d);
		} else{
			//
		}
	}
}
#if 0
void precise_stop(){
	Receive(&client, (char *) &maker_tid, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &points, sizeof(struct route_request));

	findPath(points.source, points.dest, &pathAB, &switchesAB);
	findPath(points.dest, points.source, &pathBA, &switchesBA);
	Send(maker_tid, (char *) &switchesBA, sizeof(struct PathSwitchPositions), 0, 0);

	int times[2 * MAX_PATH_LENGTH];
	int index = -1;

	int track_tid = WhoIs("TRACK");
	registerForSensorDown(track_tid, -1);
	int clock_tid = WhoIs("CLOCK");

	struct TrackServerMessage activ;
	struct TrackServerMessage timeout;
	timeout.type = TSMT_NONE;

	int delay, important; //Current values
	int fwd_delay, fwd_important, stopping_dist, dist_after, future_vel; // For stopping
	int bwd_delay, bwd_important, starting_dist, dist_before; // For starting
	delay = important = -1;
	int rev_time;

	precise_state state = p_STATE_neither;

	tput2(p_SPEED, p_TRAIN);

	dprintf("GARBAGE: Percice stop pair: %c%d to %c%d\n\r", SID_PRINT(points.source), SID_PRINT(points.dest));

	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);

		if(activ.type == TSMT_SENSOR_DOWN){
			int sensor_id = S_ID(activ.data.sensor);

			if(sensor_id == points.source){
				Send(maker_tid, (char *) &switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
				index = 0;
			}

			if(index >= 0){
				times[index] = Time(clock_tid);
				int v = (index > 0 && index < pathAB.length) ? vel(&pathAB, times, index, 1)
					: (index >= pathAB.length) ? vel(&pathBA, times+pathAB.length-1, index-pathAB.length+1, 1): 0;
				//dprintf("GARBAGE: Index: %d, Velocity %d, Dist: %d\n\r", index, v, v * (times[index]-times[index-1]) / 100);
				index++;
			}

			if(sensor_id == points.dest){
				Send(maker_tid, (char *) &switchesBA, sizeof(struct PathSwitchPositions), 0, 0);
				if(index >= 0 && important < 0){
					future_vel = vel(&pathAB, times, index-1, 2);
					stopping_dist = (future_vel * reg_a - reg_b) / 100;
					dprintf("GARBAGE: Predicted stop dist: %d\n\r", stopping_dist);
					setstop(&pathAB, stopping_dist, &fwd_important, &dist_after, &fwd_delay, times);
					important = fwd_important;
					delay = fwd_delay;
				}
			}

			if(sensor_id == important){
				async_delay(clock_tid, delay, (char *) &timeout, sizeof(struct TrackServerMessage));
				switch(state){
					case p_STATE_neither:
					state = p_STATE_stop;
					break;
					case p_STATE_reverse:
					state = p_STATE_rev_stop;
					break;
					case p_STATE_forward:
					state = p_STATE_fwd_stop;
					break;
				}
			}

			printf("Sensor Activation: %c%d\n\r",  S_PRINT(activ.data.sensor));
		} else{
			switch(state){
				case p_STATE_stop:
					tput2(16, p_TRAIN);
					state = p_STATE_inspection;
					async_delay(clock_tid, 400, (char *) &timeout, sizeof(struct TrackServerMessage));
				break;

				case p_STATE_rev_stop:
					tput2(15, p_TRAIN);
					reverse(&pathAB, &pathBA, &switchesAB, &switchesBA, &points, maker_tid);
					Delay(clock_tid, 5);
					tput2(p_SPEED, p_TRAIN);
					rev_time = Time(clock_tid);
					state = p_STATE_forward;
					important = fwd_important;
					delay = fwd_delay;
				break;

				case p_STATE_fwd_stop:
					tput2(16, p_TRAIN);
					state = p_STATE_fwd_inspection;
					rev_time = Time(clock_tid)-rev_time;
					async_delay(clock_tid, 400, (char *) &timeout, sizeof(struct TrackServerMessage));
				break;

				case p_STATE_inspection:
					if(querySensor(track_tid, S_MID(points.dest))){
						dprintf("DATA: %d %d %d %d \n\r", future_vel, stopping_dist, p_SPEED, points.dest);
						reverse(&pathAB, &pathBA, &switchesAB, &switchesBA, &points, maker_tid);
						starting_dist = 30;
						setstopconst(&pathAB, starting_dist + stopping_dist, &bwd_important, &dist_before, &bwd_delay, 77);
						important = bwd_important;
						delay = bwd_delay;
						dprintf("Important: %d, Delay: %d\n\r", important, delay);
						tput2(15, p_TRAIN);
						Delay(clock_tid, 5);
						tput2(2, p_TRAIN);
						state = p_STATE_reverse;
					} else {
						stopping_dist += 20 * (index < pathAB.length ? -1 : 1);
						setstop(&pathAB, stopping_dist, &fwd_important, &dist_after, &fwd_delay, times);
						important = fwd_important;
						delay = fwd_delay;
						state = p_STATE_neither;
						tput2(p_SPEED, p_TRAIN);
					}
				break;

				case p_STATE_fwd_inspection:
					if(querySensor(track_tid, S_MID(points.dest))){
						starting_dist -= 50;
						reverse(&pathAB, &pathBA, &switchesAB, &switchesBA, &points, maker_tid);
						setstopconst(&pathAB, starting_dist + stopping_dist, &bwd_important, &dist_before, &bwd_delay, 77);
						important = bwd_important;
						delay = bwd_delay;
						tput2(15, p_TRAIN);
						Delay(clock_tid, 5);
						tput2(2, p_TRAIN);
						state = p_STATE_reverse;
					} else{
						dprintf("START_DATA: %d, %d\n\r", starting_dist+50, rev_time);
					}
				break;
			}
		}
	}
	_Exit:
	Reply(client, 0, 0);
	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);
	}
	dprintf("At exit\n\r");
	unregisterForSensorDown(track_tid, -1);
	dprintf("Unregistered\n\r");
	Exit();
}
#endif
void conductor(void)
{
    int maker_tid = CreateSize(1, path_maker, TASK_SIZE_TINY);
		int child_tid;

		int As[16];
		As[0] = index_sensor('B', 5);
		As[1] = index_sensor('D', 3);
		As[2] = index_sensor('E', 5);
		As[3] = index_sensor('D', 6);
		As[4] = index_sensor('E', 10);
		As[5] = index_sensor('E', 13);
		As[6] = index_sensor('D', 13);
		As[7] = index_sensor('E', 1);
		As[8] = index_sensor('C', 1);
		As[9] = index_sensor('B', 4);
		As[10] = index_sensor('B', 15);
		As[11] = index_sensor('A', 3);
		As[12] = index_sensor('A', 3);
		As[13] = index_sensor('E', 5);
		As[14] = index_sensor('E', 13);
		int Bs[16];
		Bs[0] = index_sensor('B', 2);
		Bs[1] = index_sensor('C', 9);
		Bs[2] = index_sensor('B', 15);
		Bs[3] = index_sensor('A', 3);
		Bs[4] = index_sensor('C', 11);
		Bs[5] = index_sensor('B', 5);
		Bs[6] = index_sensor('D', 3);
		Bs[7] = index_sensor('B', 15);
		Bs[8] = index_sensor('A', 3);
		Bs[9] = index_sensor('C', 11);
		Bs[10] = index_sensor('C', 13); //Or 14?
		Bs[11] = index_sensor('D', 7); // Or 7?
		Bs[12] = index_sensor('E', 13);
		Bs[13] = index_sensor('D', 15); // Or 15?
		Bs[14] = index_sensor('E', 4); //Or E4?
		int index = 1;
		struct route_request points;

		//while(1){
			child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			points.source = As[index];
			points.dest = Bs[index];
			Send(child_tid, (char *) &points, sizeof(struct route_request), 0, 0);
			index++;
		//}
}
