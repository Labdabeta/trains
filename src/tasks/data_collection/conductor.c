#include "conductor.h"
#include "percise_stop.h"
#include "path_finder.h"
#include "tasks.h"

#define pointA 0
#define pointB 0

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
	int caller;
	struct test_message msg;
	struct precise_msg p_stop;
	struct route_request points;

	char sensors[10];
	for(int i = 0; i < 10; ++i)
		sensors[i] = 0;

	points.source = pointA;
	points.dest = pointB;

	int finder_tid = CreateSize(0, path_tiny, TASK_SIZE_TINY);
	caller = CreateSize(0, precise_stop, TASK_SIZE_TINY);

	Send(caller, (char *) finder_tid, sizeof(int), 0, 0);
	Send(caller, (char *) &points, sizeof(route_request), 0, 0);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct precise_msg));
		switch(msg.type){
			case CODE_SensorBytes:
				Reply(caller, 0, 0);
				for (int i = 0; i < 10; ++i) {
					if (msg.bytes[i] != sensors[i]) {
						temp = msg.bytes[i] & ~sensors[i];
						if(temp){
							for(int j = 0; j <= 7; j++){
								if(temp & (1 << (7-j)) ){
									group = 'A' + (i / 2);
									number = 1 + j + (i % 2)*8;
									dprintf("Sensor %c%d at time %d\n\r", group, number, Time(clock_tid));
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
