#include "precise_stop.h"
#include "path_finder.h"

void precise_stop(){
	int caller, client;
	int finder_tid;

	Receive(&caller, (char *) &finder_tid, sizeof(int));
	Reply(caller, 0, 0);

	struct route_request points;
	struct route_request args;
	struct path pathAB;
	struct path pathBA;
	struct precise_msg msg;
	int distAB, distBA;
	int position;

	Receive(&client, (char *) &points, sizeof(struct route_request));
	Reply(client, 0, 0);

	args = points;
	distAB = Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathAB, sizeof(struct path));

	args.source = points.dest;
	args.dest = points.source;
	distBA = Send(finder_tid, (char *) &args, sizeof(struct route_request),
		(char *) &pathBA, sizeof(struct path));

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct precise_msg));
		Reply(client, 0, 0);
		switch(msg.code){
			case CODE_precise_Sensor:
				//code
			break;
			case CODE_precise_Timeout:
				//code
			break;
			case CODE_precise_Queary_Result:
				//code
			break;
		}
	}
}
