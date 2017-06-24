#ifndef PRECISE_H
#define PRECISE_H

#include "tasks.h"

void precise_stop(void);

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
			int result;
		} p_queary;
	} data;
};

struct delay_args{
	int clock_tid;
	int length;
};

#endif
