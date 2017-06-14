#include "model.h"
#include "marklin_view.h"

void model()
{
	int caller, child_tid;
	struct A0_model_message msg;
	struct Train_Command train_out;
	struct switch_coordinator_args flip_out;
	flip_out.out_tid = WhoIs("TOUT");
	flip_out.clock_tid = WhoIs("CLOCK");

	char sensors[10];
	for(int i = 0; i < 10; i++)
		sensors[i] = 0;

	char switchstates[21];
	for(int i = 0; i < 21; i++)
		switchstates[i] = '?';

	char space[8];

	int marklin_tid = CreateSize(1, train_state_view, TASK_SIZE_TINY);
	Send(marklin_tid, 0, 0, 0, 0); //Returns after initialization

	int echo_tid, flip_tid, sensor_tid;

	while(1){
		Receive(&caller, (char *) &msg, sizeof(struct A0_model_message));
		switch(msg.code){
			case CODE_COM2byte:
				space[0] = msg.echo.val;
				Send(echo_tid, space, 1, 0, 0); //DOES NOT EXIST
			break;

			case CODE_MarklinBytes:
				for(int i = 0; i < 10; i++){
					if(msg.marklin.data[i] != sensors[i]){
						space[0] = i;
						space[1] = msg.marklin.data[i] ^ sensors[i];
						Send(sensor_tid, space, 2, 0, 0); //DOES NOT EXIST
						sensors[i] = msg.marklin.data[i];
					}
				}
			break;

			case CODE_Command:
				switch(msg.command.type){
					case A0TYPE_SetSpeed:
						train_out.type = TYPE_SetSpeed;
						train_out.args.speed.train = msg.command.args.speed.train;
						train_out.args.speed.speed = msg.command.args.speed.speed;
					goto SendTrain;

					case A0TYPE_Reverse:
						train_out.type = TYPE_Reverse;
						train_out.args.reverse.train = msg.command.args.reverse.train;
					goto SendTrain;

					case A0TYPE_Headlights:
						train_out.type = TYPE_Headlights;
						train_out.args.lights.train = msg.command.args.lights.train;
					goto SendTrain;

					SendTrain:
					Send(marklin_tid, (char *) &train_out, sizeof(struct Train_Command), 0, 0);
					break;

					case A0TYPE_SwitchFlip:
						if(switchstates[msg.command.args.flip.number] != msg.command.args.flip.state){
							flip_out.number = msg.command.args.flip.number; // NB TRANSLATE!!!!
							flip_out.state = msg.command.args.flip.state == 'S' ? 33 : 34;
							child_tid = CreateSize(0, switch_coordinator, TASK_SIZE_TINY);
							Send(child_tid, (char *) &flip_out, sizeof(struct switch_coordinator_args), 0, 0);
							space[0] = msg.command.args.flip.number;
							space[1] = msg.command.args.flip.state;
							Send(flip_tid, space, 2, 0, 0); //DOES NOT EXIST
							switchstates[msg.command.args.flip.number] = msg.command.args.flip.state;
						}
					break;

					case A0TYPE_Quit:
						KQuit();
					break;
				}
			break;
		}
		Reply(caller, 0, 0);
	}

	//Flow should never reach the end
}
