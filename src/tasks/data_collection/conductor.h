#ifndef COND_H
#define COND_H

void conductor(void);

void delay_controller(void);

typedef enum test_message_code {
	CODE_SensorBytes,
	CODE_Queary
} test_message_code;

struct test_message{
	test_message_code type;
	union{
		char bytes[10];
		int sensor;
	} data;
};

#endif
