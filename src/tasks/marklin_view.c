#include "model.h"
#include "tasks.h"

static struct reverse_coordinator_args{
	int train;
	int speed;
	int out_tid;
	int clock_tid;
}

void train_state_view(){
	int caller;
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
		trainstates[msg[1]] = 0;
		Putstr(out_tid, 1, msg);
	}

	Recieve(&caller, 0, 0);
	Reply(caller, 0, 0);

	while(1){
		Recieve(&caller, (char *) &request, sizeof(struct Train_Command));
		switch(request.type){
			case TYPE_SetSpeed:
				trainstates[msg.command.speed.train] = msg.command.speed.speed] + (trainstates[msg.command.speed.train] & 16);
				msg[0] = trainstates[msg.command.speed.train];
				msg[1] = msg.command.speed.train;
				Putstr(out_tid, 1, msg);
			break;

			case TYPE_Reverse:
				child_tid = CreateSize(0, reverse_coordinator, TASK_SIZE_TINY);
				rev_args.train = msg.command.reverse.train;
				rev_args.speed = trainstates[msg.command.reverse.train];
				Send(child_tid, (char *) &rev_args, sizeof(struct reverse_coordinator_args), 0, 0);
			break;

			case TYPE_Headlights:
				trainstates[msg.command.lights.train] ^= 16;
				msg[0] = trainstates[msg.command.lights.train];
				msg[1] = msg.command.lights.train;
				Putstr(out_tid, 1, msg);
			break;
		}
		Reply(caller, 0, 0);
	}
}

void reverse_coordinator(){
	int caller;
	struct reverse_coordinator_args rev_args;

	Recieve(&caller, (char *) &rev_args, sizeof(struct reverse_coordinator_args));
	Reply(caller, 0, 0);

	char msg[3];
	msg[0] = rev_args.speed < 16 ? 0 : 16;
	msg[1] = rev_args.train;
	msg[3] = 0;
	Putstr(rev_args.out_tid, 1, msg);
	Delay(rev_args.clock_tid, 300);
	Putc(rev_args.out_tid, 1, 15);
	Delay(rev_args.clock_tid, 5);
	Putc(rev_args.out_tid, 1, rev_args.speed);
	Exit();
}
