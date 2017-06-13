#include "model.h"
#include "tasks.h"
#include "marklin_view.h"

void model()
{
	int caller;
	struct A0_model_message msg;
	struct Train_Command train_out;

	char sensors[10];
	for(int i = 0; i < 10; i++)
		switches[i] = 0;

	char switchstates[21];
	for(int i = 0; i < 21; i++)
		switches[i] = '?';

	char space[8];

	int marklin_tid = CreateSize(1, train_state_view, TASK_SIZE_TINY);
	Send(marklin_tid, 0, 0, 0, 0); //Returns after initialization

	while(1){
		Receive(&caller, &msg, sizeof(struct A0_model_message), 0, 0);
		switch(msg.code){
			case CODE_COM2byte:
				space[0] = msg.echo.val;
				Send(echo_tid, space, 1); //DOES NOT EXIST
			break;

			case CODE_MarklinBytes:
				for(int i = 0; i < 10; i++){
					if(msg.marklin.data[i] != sensors[i]){
						space[0] = i;
						space[1] = msg.marklin.data[i] ^ sensors[i];
						Send(sensor_tid, space, 2); //DOES NOT EXIST
						sensors[i] = msg.marklin.data[i];
					}
				}
			break;

			case CODE_Command:
				switch(msg.command.type){
					case TYPE_SetSpeed:
						train_out.type = TYPE_SetSpeed;
						train_out.speed.train = msg.command.speed.train;
						train_out.speed.speed = msg.command.speed.speed;
						goto SendTrain;

					case TYPE_Reverse:
						train_out.type = TYPE_Reverse;
						train_out.reverse.train = msg.command.reverse.train;
						goto SendTrain;

					case TYPE_Headlights:
						train_out.type = TYPE_Headlights;
						train_out.lights.train = msg.command.lights.train;
						goto SendTrain;

					label SendTrain:
					Send(marklin_tid, &train_out, sizeof(struct Train_Command));
					break;

					case TYPE_SwitchFlip:
						if(switchstates[msg.command.flip.number] != msg.command.flip.state){
							space[0] = msg.command.flip.number;
							space[1] = msg.command.flip.state;
							Send(flip_tid, space, 2); //DOES NOT EXIST
							switchstates[msg.command.flip.number] = msg.command.flip.state;
						}
					break;

					case TYPE_Quit:
						KQuit();
					break;
				}
			break;
		}
		Reply(caller, 0, 0);
	}

	//Flow should never reach the end
}
