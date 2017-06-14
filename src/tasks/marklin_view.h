#ifndef MARKLIN_VIEW_H
#define MARKLIN_VIEW_H

typedef enum Train_Command_Type {
	TYPE_SetSpeed = 0,
	TYPE_Reverse,
	TYPE_Headlights
} Train_Command_Type;

struct Train_Command {
	Train_Command_Type type;
	union{
		struct SetSpeed{
			int train;
			int speed;
		} speed;
		struct Reverse{
			int train;
		} reverse;
		struct Headlights{
			int train;
		} lights;
	} args;
};

struct switch_coordinator_args{
	int number;
	int state;
	int out_tid;
	int clock_tid;
};

void train_state_view(void);
void switch_coordinator(void);

#endif
