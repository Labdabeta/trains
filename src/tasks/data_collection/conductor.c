#include "conductor.h"
#include "precise_stop.h"
#include "path_finder.h"
#include "tasks.h"
#include "tc1_terminal.h"

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

	int index = -1;
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

	int finder_tid = CreateSize(1, path_finder, TASK_SIZE_TINY);
	int percise_tid;

	CreateSize(1, tc1_view, TASK_SIZE_TINY);

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct test_message));
		switch(msg.type){
			case CODE_SensorBytes:
				Reply(caller, 0, 0);
				for (int i = 0; i < 10; ++i) {
					if (msg.data.bytes[i] != sensors[i]) {
						if(index != -1){
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
					index = -1;
				}
			break;
			case CODE_Index:
				Reply(caller, 0, 0);
				index = msg.data.index;
				goto common;
			case CODE_Pair:
				Reply(caller, 0, 0);
				index = 15;
				As[15] = msg.data.pair.pointA;
				Bs[15] = msg.data.pair.pointB;
			common:
			points.source = As[index];
			points.dest = Bs[index];
			percise_tid = CreateSize(0, precise_stop, TASK_SIZE_TINY);
			Send(percise_tid, (char *) &finder_tid, sizeof(int), 0, 0);
			Send(percise_tid, (char *) &points, sizeof(struct route_request), 0, 0);
			dprintf("Created with index %d\n\r", index);
		}
	}
}
