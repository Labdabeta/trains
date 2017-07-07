#include "tasks.h"
#include "trains/path_finder.h"
#include "trains/sensors.h"
#include "util/async_delay.h"
#include "trains/track_server.h"
#include "conductor.h"

static inline int index_sensor(char group, int number){
	return 16 * (group-'A') + number - 1;
}

#define p_SPEED 10
#define p_TRAIN 70

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

static inline void backdist(struct TrackPath *path, int dist, int *index, int* diff){
	int temp = 0;
	while(path->distances[++temp] <= dist);
	temp--;
	*diff = dist - path->distances[temp];
	*index = temp;
}

typedef enum{
	p_STATE_neither,
	p_STATE_stop,
	p_STATE_inspection
} percise_state;

void precise_stop(){
	int caller, client, maker_tid;

	struct TrackPath pathAB, pathBA;
	struct PathSwitchPositions switchesAB, switchesBA;
	struct route_request points;
	Receive(&client, (char *) &maker_tid, sizeof(int));
	Reply(client, 0, 0);
	Receive(&client, (char *) &points, sizeof(struct route_request));

	findPath(points.source, points.dest, &pathAB, &switchesAB);
	Send(maker_tid, (char *) &switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
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

	int delay = -1;
	int stopping_dist = -1;
	int important = -1;
	int dist_after, future_vel;
	int speed = p_SPEED;
	percise_state state = p_STATE_neither;

	tput2(p_SPEED, p_TRAIN);

	dprintf("GARBAGE: Percice stop pair: %c%d to %c%d\n\r", SID_PRINT(points.source), SID_PRINT(points.dest));

	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);
		if(activ.type == TSMT_SENSOR_DOWN){
			int sensor_id = S_ID(activ.data.sensor);

			if(sensor_id == points.source){
				Send(maker_tid, (char *) &switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
				if(index >= 0){
					async_delay(clock_tid, delay, (char *) &timeout, sizeof(struct TrackServerMessage));
					state = p_STATE_stop;
				}
				index = 0;
			}

			if(index >= 0){
				times[index] = Time(clock_tid);
				int v = (index > 0 && index < pathAB.length) ? vel(&pathAB, times, index, 1)
					: (index >= pathAB.length) ? vel(&pathBA, times+pathAB.length-1, index-pathAB.length+1, 1): 0;
				dprintf("Velocity %d\n\r", v);
				index++;
			}

			if(sensor_id == points.dest){
				Send(maker_tid, (char *) &switchesBA, sizeof(struct PathSwitchPositions), 0, 0);
				if(index >= 0 && delay < 0){
					delay = vel(&pathAB, times, index-1, 2);
					future_vel = delay;
					delay = delay * 149 - 10224; // 70
					//delay = delay * 145 - 7852; // 69old
					//delay = delay * 140 - 5577; // 69old
					dprintf("GARBAGE: Predicted stop dist: %d\n\r", delay / 100);
					delay = (100 * pathAB.distances[index-1] - delay) / vel(&pathAB, times, index-1, index-1);
					dprintf("GARBAGE: Delay: %d\n\r", delay);
				}
			}

			printf("Sensor Activation: %c%d\n\r",  S_PRINT(activ.data.sensor));
		} else{
			if(state == p_STATE_stop){
				tput2(16, p_TRAIN);
				dist_after = vel(&pathAB, times, index-1, 2);
				dist_after = (Time(clock_tid) - times[index-1]) * dist_after / 100;
				dprintf("GARBAGE: Dist after: %d\n\r", dist_after);
				dprintf("GARBAGE: Sanity check: %d\n\r", pathAB.distances[index] - pathAB.distances[index-1]);
				stopping_dist = pathAB.distances[pathAB.length - 1] - pathAB.distances[index-1] - dist_after;
				state = p_STATE_inspection;
				async_delay(clock_tid, 350, (char *) &timeout, sizeof(struct TrackServerMessage));
			} else{
				state = p_STATE_neither;
				if(index < pathAB.length){
					delay += 5;
					dprintf("GARBAGE: Undershot\n\r");
				} else{
					if(querySensor(track_tid, S_MID(points.dest))) {
						dprintf("GARBAGE: Perfect landing @ delay %d\n\r", delay);
						dprintf("GARBAGE: Stopping distance %d\n\r", stopping_dist);
						dprintf("DATA: %d %d %d %d \n\r", future_vel, stopping_dist, speed, points.dest);
						index = delay = -1;
						speed--;
						if(speed == 5)
							break;
					} else{
						delay -= 5;
						dprintf("GARBAGE: Overshot\n\r");
					}
				}
				tput2(speed, p_TRAIN);
			}
		}
	}

	Reply(client, 0, 0);
	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);
	}
	Exit();
}

typedef enum{
	ps_STATE_neither,
	ps_STATE_stop,
	ps_STATE_inspection,
	ps_STATE_solved,
	ps_STATE_sol_stop,
	ps_STATE_sol_inspection,
} percise_starter_state;

void precise_starter(){
	int caller, client, maker_tid;

	struct TrackPath pathAB, pathBA;
	struct PathSwitchPositions switchesAB, switchesBA;
	struct route_request points;
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

	int delay = -1;
	int dist_after, stopping_dist, future_vel;
	int speed = p_SPEED;
	int count = 0;
	percise_state state = p_STATE_neither;

	tput2(p_SPEED, p_TRAIN);

	dprintf("GARBAGE: Percice start pair: %c%d to %c%d\n\r", SID_PRINT(points.source), SID_PRINT(points.dest));

	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);
		if(activ.type == TSMT_SENSOR_DOWN){
			int sensor_id = S_ID(activ.data.sensor);

			if(sensor_id == points.source){
				Send(maker_tid, (char *) &switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
				if(index >= 0){
					async_delay(clock_tid, delay, (char *) &timeout, sizeof(struct TrackServerMessage));
					state = p_STATE_stop;
				}
				index = 0;
			}

			if(index >= 0){
				times[index] = Time(clock_tid);
				int v = (index > 0 && index < pathAB.length) ? pathAB.distances[index] - pathAB.distances[index-1]
					: (index >= pathAB.length) ? pathBA.distances[index-pathAB.length+1] - pathBA.distances[index-pathAB.length]: 0;
				dprintf("GARBAGE: Index %d, Dist: %d, ", index, v);
				if(index > 0)
					v = 100 * v / (times[index] - times[index-1]);
				dprintf("Velocity %d\n\r", v);
				index++;
			}

			if(sensor_id == points.dest){
				Send(maker_tid, (char *) &switchesBA, sizeof(struct PathSwitchPositions), 0, 0);
				if(index >= 0 && delay < 0){
					delay = 100 * (pathAB.distances[index-1] - pathAB.distances[index-3]);
					delay /= times[index-1] - times[index-3];
					future_vel = delay;
					//delay = delay * 149 - 10224; // 70
					//delay = delay * 145 - 7852; // 69old
					delay = delay * 140 - 5577; // 69old
					dprintf("GARBAGE: Predicted stop dist: %d\n\r", delay / 100);
					int speedAB = 100 * pathAB.distances[index-1] / (times[index-1] - times[0]);
					delay = (100 * pathAB.distances[index-1] - delay) / speedAB;
					dprintf("GARBAGE: Delay: %d\n\r", delay);
				}
			}

			printf("Sensor Activation: %c%d\n\r",  S_PRINT(activ.data.sensor));
		} else{
			if(state == p_STATE_stop){
				tput2(16, p_TRAIN);
				dist_after = 100 * (pathAB.distances[index-1] - pathAB.distances[index-3]);
				dist_after /= times[index-1] - times[index-3];
				dist_after = (Time(clock_tid) - times[index-1]) * dist_after / 100;
				dprintf("GARBAGE: Dist after: %d\n\r", dist_after);
				dprintf("GARBAGE: Sanity check: %d\n\r", pathAB.distances[index] - pathAB.distances[index-1]);
				stopping_dist = pathAB.distances[pathAB.length - 1] - pathAB.distances[index-1] - dist_after;
				state = p_STATE_inspection;
				async_delay(clock_tid, 350, (char *) &timeout, sizeof(struct TrackServerMessage));
			} else{
				state = p_STATE_neither;
				if(index < pathAB.length){
					delay += 5;
					dprintf("GARBAGE: Undershot\n\r");
				} else{
					if(querySensor(track_tid, S_MID(points.dest))) {
						dprintf("GARBAGE: Perfect landing @ delay %d\n\r", delay);
						dprintf("GARBAGE: Stopping distance %d\n\r", stopping_dist);
						dprintf("DATA: %d %d %d %d \n\r", future_vel, stopping_dist, speed, points.dest);
						index = delay = -1;
						if(count){
							count = 0;
							speed--;
							if(speed == 5)
								break;
						} else{
							count++;
						}
					} else{
						delay -= 5;
						dprintf("GARBAGE: Overshot\n\r");
					}
				}
				tput2(speed, p_TRAIN);
			}
		}
	}

	Reply(client, 0, 0);
	while(1){
		Receive(&caller, (char *) &activ, sizeof(struct TrackServerMessage));
		Reply(caller, 0, 0);
	}
	Exit();
}

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
		int index = 5;
		struct route_request points;

		while(1){
			child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			points.source = As[index];
			points.dest = Bs[index];
			Send(child_tid, (char *) &points, sizeof(struct route_request), 0, 0);
			index++;
		}
}
