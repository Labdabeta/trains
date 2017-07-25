#ifndef TRANSMISSION_H
#define TRANSMISSION_H

#define TRANSMISSION_INTERVAL 20
#define TRANSMISSION_STEP 5

struct speed_combination{
	int speedA, speedB;
	int timeA, timeB;
};

typedef enum transmit_type{
	TRANSMIT_TYPE_SET,
	TRANSMIT_TYPE_ADJUST,
	TRANSMIT_TYPE_REVERSE,
	TRANSMIT_TYPE_TIMEOUT
} transmit_type;

struct transmit_message{
	transmit_type code;
	int arg;
};

void transmission_test();

#endif
