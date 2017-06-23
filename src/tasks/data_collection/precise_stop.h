#ifndef PRECISE_H
#define PRECISE_H

#include "tasks.h"

typedef enum precise_code {
	CODE_precise_Sensor,
	CODE_precise_Timeout,
	CODE_precise_Queary_Result
} test_message_code;

struct precise_msg {
	precise_code code;
	union {
		struct{
			int number;
		} p_sensor;
		struct{
			EMPTY;
		} p_timeout;
		struct{
			char bytes[10];
		} p_queary;
	} data;
};

#endif
