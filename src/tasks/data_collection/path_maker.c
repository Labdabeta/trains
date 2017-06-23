#include "path_finder.h"
#include "tasks.h"

void path_maker(void){
	Service();

	int caller;
	struct path_sw_pos route;
	int clock_tid = WhoIs("CLOCK");

	while(1){
		Receive(&caller, (char *) &route, sizeof(struct path_positions));
		Reply(caller, 0, 0);

		for(int i = 0; i < route.length){
			tput2(route.positions[i], route.stations[i]);
			Delay(clock_tid, 5);
		}
		tputc(32);
	}
}
