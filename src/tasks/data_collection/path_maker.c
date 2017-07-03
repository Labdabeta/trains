#include "trains/path_finder.h"
#include "tasks.h"

void path_maker(void){
	Service();

	int caller;
	struct PathSwitchPositions route;
	int clock_tid = WhoIs("CLOCK");

	RegisterAs("PATH");

	while(1){
		Receive(&caller, (char *) &route, sizeof(struct PathSwitchPositions));
		Reply(caller, 0, 0);

		for(int i = 0; i < route.length; i++){
			tput2(route.positions[i], route.stations[i]);
			Delay(clock_tid, 5);
		}
		tputc(32);
	}
}
