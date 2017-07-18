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

void path_maker(void){
	Service();

	int caller;
	struct flip_request req;
	int clock_tid = WhoIs("CLOCK");

	while(1){
		Receive(&caller, (char *) &req, sizeof(struct flip_request));
		Reply(caller, 0, 0);
		tput2(req.position, req.switch_id);
		Delay(clock_tid, 7);
		tputc(32);
	}
}

void conductor(void)
{
    int maker_tid = CreateSize(1, path_maker, TASK_SIZE_TINY);
		int child_tid;
		track_calibration cal_70, cal_69;
		track_calibration *ptr_cal_70 = &cal_70;
		track_calibration *ptr_cal_69 = &cal_69;

#if !is_calibration
#include "data/tr69s10a.h"
#include "data/tr70s10a.h"
#endif

		struct route_request points_70;
		struct route_request points_69;
		char group;
		int num;

		points_70.source = index_sensor('B', 5);
		points_69.source = index_sensor('C', 13);

		while(1){
			child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			Send(child_tid, (char *) &ptr_cal_70, sizeof(int*), 0, 0);
			group = cgetc();
			num = cgetc();
			num = (num >= '0' && num <= '9') ? num - '0' : num - 'a' + 10;
			points_70.dest = index_sensor(group, num);
			printf("Route: %c%d to %c%d\n\r", SID_PRINT(points_70.source), SID_PRINT(points_70.dest));
			Send(child_tid, (char *) &points_70, sizeof(struct route_request), 0, 0);
			points_70.source = points_70.dest;

			/*child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			Send(child_tid, (char *) &ptr_cal_69, sizeof(int*), 0, 0);
			group = cgetc();
			num = cgetc();
			num = (num >= '0' && num <= '9') ? num - '0' : num - 'a' + 10;
			points_69.dest = index_sensor(group, num);
			printf("Route: %c%d to %c%d\n\r", SID_PRINT(points_69.source), SID_PRINT(points_69.dest));
			Send(child_tid, (char *) &points_69, sizeof(struct route_request), 0, 0);
			points_69.source = points_69.dest;*/
		}
}
