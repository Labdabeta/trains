#ifndef MODEL_H
#define MODEL_H

#include "tasks.h"

void model();

typedef enum A0_model_message_code {
	CODE_COM2byte = 0,
	CODE_MarklinBytes,
	CODE_Command
} A0_model_message_code;

typedef enum A0_Command_type {
	A0TYPE_SetSpeed = 0,
	A0TYPE_Reverse,
	A0TYPE_Headlights,
	A0TYPE_SwitchFlip,
	A0TYPE_Quit
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
		struct A0Command{
			A0_Command_type type;
			union{
				struct A0SetSpeed{
					int train;
					int speed;
				} speed;
				struct A0Reverse{
					int train;
				} reverse;
				struct A0Headlights{
					int train;
				} lights;
				struct A0SwitchFlip{
					int number;
					char state;
				} flip;
				struct A0Quit{
					EMPTY;
				} quit;
			} args;
		} command;
  };
};

#endif
