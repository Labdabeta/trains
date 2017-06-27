#include "precise_stop.h"
#include "conductor.h"
#include "path_finder.h"

#define printf_sname(X) 'A' + (X / 16), X % 16 + 1

void delay_percise(void);

typedef enum{
	p_STATE_neither,
	p_STATE_stop,
	p_STATE_inspection
} percise_state;

#define p_SPEED 10
#define p_TRAIN 70

void precise_stop(){
	int caller, client;
	int finder_tid, child_tid;

	Receive(&caller, (char *) &finder_tid, sizeof(int));
	dprintf("Finder tid: %d\n\r", finder_tid);
	Reply(caller, 0, 0);

	struct route_request points;
	struct route_request args;
	struct path pathAB;
	struct path pathBA;
	struct precise_msg msg;
	struct delay_args delay_a;
	struct test_message cond;
	cond.type = CODE_Queary;
	delay_a.clock_tid = WhoIs("CLOCK");
	int delay, overshot;
	int result;
	int Atime;
	int prevtime;
	int timetemp;
	int stopping_index;
	int stopping_dist_after;
	int count = 0;
	percise_state state = p_STATE_neither;

	Receive(&client, (char *) &points, sizeof(struct route_request));
	Reply(client, 0, 0);

	args = points;
	Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathAB, sizeof(struct path));

	args.source = points.dest;
	args.dest = points.source;
	Delay(delay_a.clock_tid, 50);
	Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathBA, sizeof(struct path));
	delay = (pathAB.dist - 650) / 5;

	dprintf("Welcome to the percise stopper!\n\r");
	dprintf("Today, we will use train %d at speed %d.\n\r", p_TRAIN, p_SPEED);
	dprintf("The distance from A to B is: %dmm\n\r", pathAB.dist);
	dprintf("The distance from B to A is: %dmm\n\r", pathBA.dist);
	dprintf("We will try a delay of: %d*10ms\n\r", delay);

	tput2(p_SPEED, p_TRAIN);
	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct test_message));
		Reply(caller, 0, 0);
		switch(msg.code){
			case CODE_precise_Sensor:
				prevtime = Time(delay_a.clock_tid);
				dprintf("Sensor %c%d at time %d\n\r", printf_sname(msg.number), prevtime);
				if(msg.number == points.source){
					overshot = 0 - pathAB.length;
					state = p_STATE_stop;
					child_tid = CreateSize(0, delay_percise, TASK_SIZE_TINY);
					delay_a.length = delay;
					Atime = prevtime;
					Send(child_tid, (char *) &delay_a, sizeof(struct delay_args), 0, 0);
				}
				overshot++;
			break;
			case CODE_precise_Timeout:
				switch(state){
					case p_STATE_stop:
						child_tid = CreateSize(0, delay_percise, TASK_SIZE_TINY);
						delay_a.length = 500;
						Send(child_tid, (char *) &delay_a, sizeof(struct delay_args), 0, 0);
						state = p_STATE_inspection;
						tput2(16, p_TRAIN);
						timetemp = Time(delay_a.clock_tid);
						dprintf("Stopping train at time %d\n\r", timetemp);
						if(overshot <= 0){
							stopping_index = pathAB.length + overshot-1;
							dprintf("Previous sensor was %c%d\n\r", printf_sname(pathAB.stations[stopping_index]));
							dprintf("Speed %d mm/sec\n\r", (100 * pathAB.distances[stopping_index]) / (prevtime - Atime));
							stopping_dist_after = (timetemp-prevtime) * pathAB.distances[stopping_index] / (prevtime - Atime);
							dprintf("So I stopped %dmm after it.\n\r", stopping_dist_after);
						}
					break;
					case p_STATE_inspection:
						state = p_STATE_neither;
						cond.data.sensor = points.dest;
						Send(client, (char *) &cond, sizeof(struct test_message), (char *) &result, sizeof(int));
						if(result){
							dprintf("Perfect landing @ delay=%d!\n\r", delay);
							dprintf("Stopping distance %dmm\n\r", pathAB.distances[pathAB.length-1] - pathAB.distances[stopping_index] - stopping_dist_after);
							count++;
							if(count == 2){
								cond.data.sensor = -1337;
								Send(client, (char *) &cond, sizeof(struct test_message), 0, 0);
								Exit();
							}
						} else{
							dprintf("Overshot val: %d\n\r", overshot);
							delay = delay + (overshot < 0 ? 5 : -5);
						}
						tput2(p_SPEED, p_TRAIN);
						dprintf("Starting train at time %d\n\r", Time(delay_a.clock_tid));
					break;
					default:
						dprintf("HUGE ERROR");
				}
			break;
		}
	}
}

void delay_percise()
{
	int caller;
	struct delay_args args;
	struct precise_msg msg;
	msg.code = CODE_precise_Timeout;

	Receive(&caller, (char *) &args, sizeof(struct delay_args));
	Reply(caller, 0, 0);

	Delay(args.clock_tid, args.length);
	Send(caller, (char *) &msg, sizeof(struct precise_msg), 0, 0);
	Exit();
}
