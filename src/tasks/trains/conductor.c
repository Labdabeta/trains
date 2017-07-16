#include "tasks.h"
#include "trains/path_finder.h"
#include "trains/sensors.h"
#include "util/async_delay.h"
#include "trains/track_server.h"
#include "conductor.h"
#include "precise_stopper.h"
#include "calibration_master.h"
#include "service.h"

#define SIV static inline void
#define SII static inline int

static inline int index_sensor(char group, int number){
	return 16 * (group-'A') + number - 1;
}

void path_maker(void){
	Service();

	int caller;
	struct flip_request req;
	int clock_tid = WhoIs("CLOCK");

	while(1){
		Receive(&caller, (char *) &req, sizeof(struct flip_request));
		Reply(caller, 0, 0);
		dprintf("Flipping %d to %d\n\r", req.switch_id, req.position);
		tput2(req.position, req.switch_id);
		Delay(clock_tid, 7);
		tputc(32);
	}
}

void conductor(void)
{
    int maker_tid = CreateSize(1, path_maker, TASK_SIZE_TINY);
		int child_tid;
		track_calibration cal;
		track_calibration *ptr_cal = &cal;
		init_cal(&cal);

		int As[16];
		As[0] = index_sensor('B', 5);
		As[1] = index_sensor('D', 3);
		As[2] = index_sensor('E', 5);
		As[3] = index_sensor('D', 6);
		As[4] = index_sensor('E', 10);
		As[5] = index_sensor('B', 2);
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

		while(1){
			child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			Send(child_tid, (char *) &ptr_cal, sizeof(int*), 0, 0);
			points.source = As[index];
			points.dest = Bs[index];
			Send(child_tid, (char *) &points, sizeof(struct route_request), 0, 0);
			Delay(WhoIs("CLOCK"), 500);
			index++;
		}
}
