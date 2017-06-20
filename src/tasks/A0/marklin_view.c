#include "A0_model.h"
#include "marklin_view.h"
#include "tasks.h"

struct reverse_coordinator_args{
	int train;
	int speed;
	int out_tid;
	int clock_tid;
};

void reverse_coordinator(){
	int caller;
	struct reverse_coordinator_args rev_args;

	Receive(&caller, (char *) &rev_args, sizeof(struct reverse_coordinator_args));
	Reply(caller, 0, 0);

	char msg[3];
	msg[0] = rev_args.speed < 16 ? 0 : 16;
	msg[1] = rev_args.train;
	msg[2] = 0;
	Putstr(rev_args.out_tid, 1, msg);
	Delay(rev_args.clock_tid, 300);
	msg[0] = 15;
	Putstr(rev_args.out_tid, 1, msg);
	Delay(rev_args.clock_tid, 5);
	msg[0] = rev_args.speed;
	Putstr(rev_args.out_tid, 1, msg);
	Exit();
}

void train_state_view(){
	int caller, child_tid;
	struct Train_Command request;

	struct reverse_coordinator_args rev_args;

	int out_tid = WhoIs("TOUT");
	int clock_tid = WhoIs("CLOCK");
	rev_args.out_tid = out_tid;
	rev_args.clock_tid = clock_tid;

	char msg[3];
	msg[0] = 0;
	msg[2] = 0;

	int trainstates[81];
	for(msg[1] = 1; msg[1] < 81; msg[1]++){
		trainstates[(int) msg[1]] = 0; // NB check
        //tput2(0, msg[1]);
	}

	Receive(&caller, 0, 0);
	Reply(caller, 0, 0);

	while(1){
		Receive(&caller, (char *) &request, sizeof(struct Train_Command));
		Reply(caller, 0, 0);
		switch(request.type){
			case TYPE_SetSpeed:
				trainstates[request.args.speed.train] = request.args.speed.speed + (trainstates[request.args.speed.train] & 16);
                tput2(trainstates[request.args.speed.train], request.args.speed.train);
			break;

			case TYPE_Reverse:
				child_tid = CreateSize(0, reverse_coordinator, TASK_SIZE_TINY);
				rev_args.train = request.args.reverse.train;
				rev_args.speed = trainstates[request.args.reverse.train];
				Send(child_tid, (char *) &rev_args, sizeof(struct reverse_coordinator_args), 0, 0);
			break;

			case TYPE_Headlights:
				trainstates[request.args.lights.train] ^= 16;
                tput2(trainstates[request.args.lights.train], request.args.lights.train);
			break;
		}
	}
}

void switch_coordinator(){
	int caller;
	struct switch_coordinator_args flip_args;

	Receive(&caller, (char *) &flip_args, sizeof(struct switch_coordinator_args));
	Reply(caller, 0, 0);

	tput2(flip_args.state, flip_args.number);
	Delay(flip_args.clock_tid, 10);
	tputc(32);

	Exit();
}
