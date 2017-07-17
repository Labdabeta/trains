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
		track_calibration cal;
		track_calibration *ptr_cal = &cal;
		init_cal(&cal);
#include "data/tr70s10.h"
		struct route_request points;
		char group;
		int num;

		points.source = index_sensor('B', 5);

		while(1){
			child_tid = CreateSize(1, precise_stop, TASK_SIZE_NORMAL);
			Send(child_tid, (char *) &maker_tid, sizeof(int), 0, 0);
			Send(child_tid, (char *) &ptr_cal, sizeof(int*), 0, 0);
			group = cgetc();
			num = cgetc();
			num = (num >= '0' && num <= '9') ? num - '0' : num - 'a' + 10;
			points.dest = index_sensor(group, num);
			printf("Route: %c%d to %c%d\n\r", SID_PRINT(points.source), SID_PRINT(points.dest));
			Send(child_tid, (char *) &points, sizeof(struct route_request), 0, 0);
			points.source = points.dest;
		}
}
