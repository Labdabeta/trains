#ifndef PRECISE_H
#define PRECISE_H

#include "tasks.h"

void precise_stop(void);

typedef enum precise_code {
	CODE_precise_Sensor,
	CODE_precise_Timeout
} precise_code;

struct precise_msg {
	precise_code code;
	int number;
};

struct delay_args{
	int clock_tid;
	int length;
};

#endif
