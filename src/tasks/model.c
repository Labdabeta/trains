#include <server.h>
#include "model.h"
#include "marklin_view.h"
#include "terminal_view.h"

struct Data {
	int caller;
	int child_tid;
	struct A0_model_message msg;
	struct Train_Command train_out;
	struct switch_coordinator_args flip_out;
	char sensors[10];
	char switchstates[21];
	char space[8];
	int marklin_tid;
	int echo_tid;
	int flip_tid;
	int sensor_tid;
};

ENTRY initialize(struct Data *data)
{
	int i;
	dprintf("Model TID: %d\n\r", MyTid());
	data->flip_out.out_tid = WhoIs("TOUT");
	data->flip_out.clock_tid = WhoIs("CLOCK");
	for (i = 0; i < 10; ++i)
		data->sensors[i] = 0;

	for (i = 0; i < 21; ++i)
		data->switchstates[i] = '?';

	data->marklin_tid = CreateSize(1, train_state_view, TASK_SIZE_SMALL);
	Send(data->marklin_tid, 0, 0, 0, 0); //Returns after initialization

	i = CreateSize(1, setup_t, TASK_SIZE_SMALL);
	Send(i, 0, 0, 0, 0); //Wait for the initial screen to print

	data->echo_tid = CreateSize(1, echo_view_t, TASK_SIZE_SMALL);
	data->flip_tid = CreateSize(1, flip_view_t, TASK_SIZE_SMALL);
	data->sensor_tid = CreateSize(1, sensor_view_t, TASK_SIZE_SMALL);
	CreateSize(1, time_view_t, TASK_SIZE_SMALL);
}

ENTRY handle(struct Data *data, int tid, struct A0_model_message *msg, int msg_size)
{
	(void)msg_size; // ignored
	int i, child_tid;
	switch (msg->code) {
		case CODE_COM2byte:
			data->space[0] = msg->echo.val;
			Send(data->echo_tid, data->space, 1, 0, 0);
			break;
		case CODE_MarklinBytes:
			for (i = 0; i < 10; ++i) {
				if (msg->marklin.data[i] != data->sensors[i]) {
					if(msg->marklin.data[i] & ~data->sensors[i]){
						data->space[0] = i;
						data->space[1] = msg->marklin.data[i] & ~data->sensors[i];
						Send(data->sensor_tid, data->space, 2, 0, 0);
					}
					data->sensors[i] = msg->marklin.data[i];
				}
			}
			break;
		case CODE_Command:
			switch (msg->command.type) {
				case A0TYPE_SetSpeed:
					data->train_out.type = TYPE_SetSpeed;
					data->train_out.args.speed.train = msg->command.args.speed.train;
					data->train_out.args.speed.speed = msg->command.args.speed.speed;
					goto SendTrain;

				case A0TYPE_Reverse:
					data->train_out.type = TYPE_Reverse;
					data->train_out.args.reverse.train = msg->command.args.reverse.train;
					goto SendTrain;

				case A0TYPE_Headlights:
					data->train_out.type = TYPE_Headlights;
					data->train_out.args.lights.train = msg->command.args.lights.train;
					goto SendTrain;

SendTrain:
				Send(data->marklin_tid, (char *) &data->train_out, sizeof(struct Train_Command), 0, 0);
				break;

				case A0TYPE_SwitchFlip:
					if (data->switchstates[msg->command.args.flip.number] != msg->command.args.flip.state) {
						data->flip_out.number = msg->command.args.flip.number;
						data->flip_out.state = msg->command.args.flip.state == 'S' ? 33 : 34;
						child_tid = CreateSize(0, switch_coordinator, TASK_SIZE_TINY);
						Send(child_tid, (char*)&data->flip_out, sizeof(struct switch_coordinator_args), 0, 0);
						data->space[0] = msg->command.args.flip.number;
						data->space[1] = msg->command.args.flip.state;
						Send(data->flip_tid, data->space, 2, 0, 0);
						data->switchstates[msg->command.args.flip.number] = msg->command.args.flip.state;
					}
					break;

				case A0TYPE_Quit:
					cputstr("\033[2J");
					Delay(data->flip_out.clock_tid, 100);
					KQuit();
					break;
			}
			break;
	}
	Reply(tid, 0, 0);
}

MAKE_SERVER_LONG(model, Data, A0_model_message, initialize, handle)
