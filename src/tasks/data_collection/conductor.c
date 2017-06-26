#include "conductor.h"
#include "precise_stop.h"
#include "path_finder.h"
#include "tasks.h"

#define pointA 20
#define pointB 40

static inline int index_sensor(char group, int number){
	return 16 * (group-'A') + number - 1;
}

void conductor()
{
	int caller;
	struct test_message msg;
	struct precise_msg p_stop;
	p_stop.code = CODE_precise_Sensor;
	struct route_request points;
	int result;
	int number;
	int temp;
	char group;

	char sensors[10];
	for(int i = 0; i < 10; ++i)
		sensors[i] = 0;

	points.source = pointA;
	points.dest = pointB;

	int finder_tid = CreateSize(1, path_finder, TASK_SIZE_TINY);
	int percise_tid = CreateSize(0, precise_stop, TASK_SIZE_TINY);

	Send(percise_tid, (char *) &finder_tid, sizeof(int), 0, 0);
	Send(percise_tid, (char *) &points, sizeof(struct route_request), 0, 0);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct precise_msg));
		switch(msg.type){
			case CODE_SensorBytes:
				Reply(caller, 0, 0);
				for (int i = 0; i < 10; ++i) {
					//dprintf("msg.data.bytes[i]: %x\tsensors[i]: %x\n\r", msg.data.bytes[i], sensors[i]);
					if (msg.data.bytes[i] != sensors[i]) {

						temp = msg.data.bytes[i] & ~sensors[i];

						if(temp){
							for(int j = 0; j <= 7; j++){
								if(temp & (1 << (7-j)) ){
									group = 'A' + (i / 2);
									number = 1 + j + (i % 2)*8;
									dprintf("Sensor %c%d\n\r", group, number);
									p_stop.number = index_sensor(group, number);
									Send(percise_tid, (char *) &p_stop, sizeof(struct precise_msg), 0, 0);
								}
							}
						}
						sensors[i] = msg.data.bytes[i];
					}
				}
			break;
			case CODE_Queary:
				result = sensors[msg.data.sensor / 8] & (1 << (7 - msg.data.sensor % 8));
				Reply(caller, (char *) &result, sizeof(int));
			break;
		}
	}
}
