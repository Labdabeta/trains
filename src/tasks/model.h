#ifndef MODEL_H
#define MODEL_H

void model();

typedef enum A0_model_message_code {
	CODE_COM2byte = 0,
	CODE_MarklinBytes,
	CODE_Command
} A0_model_message_code;

typedef enum A0_Command_type {
	TYPE_SetSpeed = 0,
	TYPE_Reverse,
	TYPE_Headlights,
	TYPE_SwitchFlip,
	TYPE_Quit
} A0_Command_type;

struct A0_model_message {
  A0_model_message_code code;
  union{
		struct COM2byte{
			char val;
		} echo;
    struct MarklinBytes{
      char data[10];
    } marklin;
		struct Command{
			A0_Command_type type;
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
				struct SwitchFlip{
					int number;
					char state;
				} flip;
				struct Quit{
					EMPTY;
				} quit;
			} args;
		} command;
  }
};

#endif
