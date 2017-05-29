#include "tasks.h"
#include "debugio.h"

static int index(char pl){
	switch(pl){
		case 'r':
			return 0;
		case 'p':
			return 1;
		case 's':
			return 2;
	}
}

static void resolve(int tid1, int tid2, char play1, char play2, char* res){
	char r1, r2;
	switch(res[3*index(play1) + index(play2)]){
		case '1':
			r1 = 'w';
			r2 = 'l';
			break;
		case '2':
			r2 = 'w';
			r1 = 'l';
			break;
		case 't':
			r2 = 't';
			r1 = 't';
			break;
	}
	Reply(tid1, &r1, 1);
	Reply(tid2, &r2, 1);
}

void rps_server()
{
	int tid1, tid2, tid, err;
	char play1 = 0;
	char play2 = 0;
	char msg[10];
	char reply;

    tid1 = 0;
    tid2 = 0;

	char results[9];
	// 0 -r ; 1 -p; 2 -s;
	results[0] = 't';
	results[1] = '2';
	results[2] = '1';
	results[3] = '1';
	results[4] = 't';
	results[5] = '2';
	results[6] = '2';
	results[7] = '1';
	results[8] = 't';

    RegisterAs("RPS");

	while(1){
		err = Receive(&tid, msg, 2);
		switch(msg[0]){
			case 's':
				if(!tid1){
					tid1 = tid;
				} else{
					tid2 = tid;
				}
				if(tid1 && tid2){
					reply = 'r';
					Reply(tid1, &reply, 1);
					Reply(tid2, &reply, 1);
				}
			break;

			case 'p':
				if(tid == tid1){
					play1 = msg[1];
				} else{
					play2 = msg[1];
				}
				if(play1 && play2 || tid1 == 0 || tid2 == 0){
					if(!tid1 || !tid2){
						reply = 'q';
						Reply(tid, &reply, 1);
					} else{
						resolve(tid1, tid2, play1, play2, &results);
					}
					play1 = play2 = 0;
				}
			break;

			case 'q':
                DEBUG_PRINT("QUIT");
				if(tid == tid1){
					tid1 = 0;
				} else{
					tid2 = 0;
				}
                Reply(tid, 0, 0);
			break;
		}
	}
}
