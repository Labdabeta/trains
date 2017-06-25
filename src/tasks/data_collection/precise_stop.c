#include "precise_stop.h"
#include "conductor.h"
#include "path_finder.h"

void delay_percise(void);

typedef enum{
	p_STATE_neither,
	p_STATE_stop,
	p_STATE_inspection
} percise_state;

#define p_SPEED 10
#define p_TRAIN 69

void precise_stop(){
	int caller, client;
	int finder_tid, child_tid;

	Receive(&caller, (char *) &finder_tid, sizeof(int));
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
	int distAB, distBA;
	int delay, overshot;
	int result;
	percise_state state = p_STATE_neither;

	Receive(&client, (char *) &points, sizeof(struct route_request));
	Reply(client, 0, 0);

	args = points;
	distAB = Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathAB, sizeof(struct path));

	args.source = points.dest;
	args.dest = points.source;
	distBA = Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathBA, sizeof(struct path));

	delay = distAB / 5 - 30;

	dprintf("Welcome to the percise stopper!\n\r");
	dprintf("Today, we will use train %d at speed %d.\n\r", p_SPEED, p_TRAIN);
	dprintf("The distance from A to B is: %dmm\n\r", distAB);
	dprintf("The distance from B to A is: %dmm\n\r", distBA);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct precise_msg));
		Reply(caller, 0, 0);
		switch(msg.code){
			case CODE_precise_Sensor:
				if(msg.number == points.source){
					overshot = pathAB.length - 1;
					state = p_STATE_stop;
					child_tid = CreateSize(0, delay_percise, TASK_SIZE_TINY);
					delay_a.length = delay;
					Send(child_tid, (char *) &delay_a, sizeof(struct delay_args), 0, 0);
				}
				overshot++;
				dprintf("Sensor %c%d at time %d\n\r", 'A' + (msg.number / 16), msg.number % 16 + 1, Time(delay_a.clock_tid));
			break;
			case CODE_precise_Timeout:
				switch(state){
					case p_STATE_stop:
						child_tid = CreateSize(0, delay_percise, TASK_SIZE_TINY);
						delay_a.length = 200;
						Send(child_tid, (char *) &delay_a, sizeof(struct delay_args), 0, 0);
						state = p_STATE_inspection;
						tput2(0, p_TRAIN);
						dprintf("Stopping train at time %d\n\r", Time(delay_a.clock_tid));
					break;
					case p_STATE_inspection:
						state = p_STATE_neither;
						cond.data.sensor = points.dest;
						Send(client, (char *) &cond, sizeof(struct test_message), (char *) &result, sizeof(int));
						if(result){
							dprintf("Perfect landing @ delay=%d!\n\r", delay);
						} else{
							dprintf("Overshot val: %d\n\r", overshot);
							delay = delay + (overshot < 0 ? 15 : -15);
						}
						tput2(p_SPEED, p_TRAIN);
						dprintf("Starting train at time %d\n\r", Time(delay_a.clock_tid));
					break;
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
