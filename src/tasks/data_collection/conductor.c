#include "conductor.h"
#include "precise_stop.h"
#include "path_finder.h"
#include "tasks.h"

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

	int index = 0;
	int As[10];
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
	int Bs[10];
	Bs[0] = index_sensor('B', 2);
	Bs[1] = index_sensor('C', 9);
	Bs[2] = index_sensor('B', 15);
	Bs[3] = index_sensor('A', 3);
	Bs[4] = index_sensor('C', 11);
	Bs[5] = index_sensor('B', 5);
	Bs[6] = index_sensor('D', 3);
	Bs[7] = index_sensor('C', 9);
	Bs[8] = index_sensor('B', 15);
	Bs[9] = index_sensor('A', 3);

	points.source = As[index];
	points.dest = Bs[index];

	int finder_tid = CreateSize(1, path_finder, TASK_SIZE_TINY);
	int percise_tid = CreateSize(0, precise_stop, TASK_SIZE_TINY);

	Send(percise_tid, (char *) &finder_tid, sizeof(int), 0, 0);
	Send(percise_tid, (char *) &points, sizeof(struct route_request), 0, 0);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct test_message));
		switch(msg.type){
			case CODE_SensorBytes:
				Reply(caller, 0, 0);
				for (int i = 0; i < 10; ++i) {
					if (msg.data.bytes[i] != sensors[i]) {

						temp = msg.data.bytes[i] & ~sensors[i];

						if(temp){
							for(int j = 0; j <= 7; j++){
								if(temp & (1 << (7-j)) ){
									group = 'A' + (i / 2);
									number = 1 + j + (i % 2)*8;
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
				if(msg.data.sensor != -1337){
					result = sensors[msg.data.sensor / 8] & (1 << (7 - msg.data.sensor % 8));
					Reply(caller, (char *) &result, sizeof(int));
				} else{
					Reply(caller, 0, 0);
					percise_tid = CreateSize(0, precise_stop, TASK_SIZE_TINY);
					index++;
					points.source = As[index];
					points.dest = Bs[index];
					Send(percise_tid, (char *) &finder_tid, sizeof(int), 0, 0);
					Send(percise_tid, (char *) &points, sizeof(struct route_request), 0, 0);
				}
			break;
		}
	}
}
