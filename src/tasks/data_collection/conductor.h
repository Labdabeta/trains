#ifndef COND_H
#define COND_H

void conductor(void);

void delay_controller(void);

typedef enum test_message_code {
	CODE_SensorBytes,
	CODE_Timeout
} test_message_code;

struct test_message{
	test_message_code type;
	char bytes[10];
};

struct delay_args{
	int clock_tid;
	int length;
};

#endif
