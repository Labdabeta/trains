#ifndef TRANSMISSION_H
#define TRANSMISSION_H

#define TRANSMISSION_INTERVAL 15
#define TRANSMISSION_STEP 3

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

struct TransmitMessage{
	transmit_type code;
	int arg;
};

void transmission();
void transmission_test();

#endif
