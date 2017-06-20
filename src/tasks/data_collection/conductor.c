#include "conductor.h"
#include "path_finder.h"
#include "tasks.h"

static inline void get_dest(char *group, int *num){
	*group = cgetc();
	*num = cgetc();
	*num = *num - '0' < 10 ? *num - '0' : *num - 'a';
}

static inline int index_sensor(char group, int number){
	return 16 * (group-'A') + number - 1;
}

void conductor()
{
	int clock_tid = WhoIs("CLOCK");
	int path_tid = CreateSize(1, path_finder, TASK_SIZE_TINY);
	int caller;
	char sensors[10];
	for(int i = 0; i < 10; ++i)
		sensors[i] = 0;
	struct test_message msg;
	struct delay_args args;
	struct route_request route_req;
	args.clock_tid = clock_tid;
	char temp, group, destgroup;
	int number, destnum, child_tid;
	int speed = 0;
	int length = 0;

	//From A10
	route_req.source = 9;
	get_dest(&destgroup, &destnum);
	route_req.dest = index_sensor(destgroup, destnum);
	Send(path_tid, (char *) &route_req, sizeof(struct route_request), 0, 0);
	tput2(10, 76);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct test_message));
		Reply(caller, 0, 0);
		switch(msg.type){
			case CODE_SensorBytes:
				for (int i = 0; i < 10; ++i) {
					if (msg.bytes[i] != sensors[i]) {
						temp = msg.bytes[i] & ~sensors[i];
						if(temp){
							for(int j = 0; j <= 7; j++){
								if(temp & (1 << (7-j)) ){
									group = 'A' + (i / 2);
									number = 1 + j + (i % 2)*8;
									dprintf("Sensor %c%d at time %d\n\r", group, number, Time(clock_tid));
#if 0
									if(group == destgroup && number == destnum){
										args.length = length;
										length += 30;
										child_tid = CreateSize(0, delay_controller, TASK_SIZE_NORMAL);
										Send(child_tid, (char *) &args, sizeof(struct delay_args), 0, 0);
										dprintf("Requesting stop, tid: %d\n\r", child_tid);
									}
#endif
								}
							}
						}
						sensors[i] = msg.bytes[i];
					}
				}
			break;
			case CODE_Timeout:
				tput2(speed, 76);
				if(speed == 0){
					tput2(speed, 76);
					dprintf("Stopping at: %d\n\r", Time(clock_tid));
					args.length = 399;
					child_tid = CreateSize(0, delay_controller, TASK_SIZE_NORMAL);
					Send(child_tid, (char *) &args, sizeof(struct delay_args), 0, 0);
					speed = 10;
				} else{
					route_req.source = route_req.dest;
					get_dest(&destgroup, &destnum);
					route_req.dest = index_sensor(destgroup, destnum);
					Send(path_tid, (char *) &route_req, sizeof(struct route_request), 0, 0);
					dprintf("Restarting at: %d\n\r", Time(clock_tid));
					tput2(speed, 76);
					speed = 0;
				}
			break;
		}
	}
}

void delay_controller()
{
	int caller;
	struct delay_args args;
	struct test_message msg;
	msg.type = CODE_Timeout;

	Receive(&caller, (char *) &args, sizeof(struct delay_args));
	Reply(caller, 0, 0);

	Delay(args.clock_tid, args.length);
	Send(caller, (char *) &msg, sizeof(struct test_message), 0, 0);
	Exit();
}
