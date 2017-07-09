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
			dprintf("Flipping %d\n\r", route.stations[i]);
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

static inline void setstop(struct TrackPath *path, int stopping_dist, int *important,
	int* dist_after, int * delay, int* times){
	backdist(path, path->distances[path->length - 1] - stopping_dist, important, dist_after);
	dprintf("After index: %d, Dist after: %d\n\r", *important, *dist_after);
	*delay = 100 * *dist_after / vel(path, times, *important, 1);
	*important = path->stations[*important];
}

static inline void setstopconst(struct TrackPath *path, int starting_dist, int *important,
	int* dist_before, int * delay, int velocity){
	backdist(path, path->distances[path->length - 1] - starting_dist, important, dist_before);
	dprintf("Before index: %d, Dist after: %d\n\r", *important, *dist_before);
	*delay = 100 * *dist_before / velocity;
	*important = path->stations[*important];
}

static inline int opposite(int sensor){
	return sensor + (sensor % 2 ? -1 : 1);
}

static inline void reverse(struct TrackPath *pathAB, struct TrackPath *pathBA,
		struct PathSwitchPositions *switchesAB, struct PathSwitchPositions *switchesBA,
		struct route_request *points, int maker_tid){
	int temp = opposite(points->dest);
	points->dest = opposite(points->source);
	points->dest = temp;
	findPath(points->source, points->dest, pathAB, switchesAB);
	dprintf("PathAB len: %d\n\r", pathAB->length);
	for(int i=0; i < pathAB->length; i++){
		dprintf("Sensor[%d]: %c%d\n\r", i, SID_PRINT(pathAB->stations[i]));
	}
	for(int i=0; i < switchesAB->length; i++){
		dprintf("Switch[%d]: %d\n\r", i, switchesAB->stations[i]);
	}
	findPath(points->dest, points->source, pathBA, switchesBA);
	Send(maker_tid, (char *) &switchesAB, sizeof(struct PathSwitchPositions), 0, 0);
}

typedef enum{
	p_STATE_neither,
	p_STATE_stop,
	p_STATE_inspection,
	p_STATE_reverse,
	p_STATE_done
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
				index = 0;
			}

			if(index >= 0){
				times[index] = Time(clock_tid);
				int v = (index > 0 && index < pathAB.length) ? vel(&pathAB, times, index, 1)
					: (index >= pathAB.length) ? vel(&pathBA, times+pathAB.length-1, index-pathAB.length+1, 1): 0;
				dprintf("GARBAGE: Index: %d, Velocity %d, Dist: %d\n\r", index, v, v * (times[index]-times[index-1]) / 100);
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
				state = (state == p_STATE_neither) ? p_STATE_stop : p_STATE_done;
			}

			printf("Sensor Activation: %c%d\n\r",  S_PRINT(activ.data.sensor));
		} else{
			switch(state){
				case p_STATE_stop:
					tput2(16, p_TRAIN);
					state = p_STATE_inspection;
					async_delay(clock_tid, 400, (char *) &timeout, sizeof(struct TrackServerMessage));
				break;

				case p_STATE_done:
					tput2(16, p_TRAIN);
					goto _Exit;
				break;

				case p_STATE_inspection:
					if(querySensor(track_tid, S_MID(points.dest))){
						dprintf("DATA: %d %d %d %d \n\r", future_vel, stopping_dist, p_SPEED, points.dest);
						reverse(&pathAB, &pathBA, &switchesAB, &switchesBA, &points, maker_tid);
						starting_dist = 400;
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
		int index = 0;
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
