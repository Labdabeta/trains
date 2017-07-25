#include "tasks.h"
#include "util/async_delay.h"
#include "transmission.h"
#include "logging.h"

#define SIV static inline void

void set_speed(struct speed_combination *speed, int value){
	if(value == 14) {
		speed->speedA = 13;
		speed->speedB = 14;
		speed->timeA = 0;
		speed->timeB = TRANSMISSION_INTERVAL;
	} else if(value == 0) {
		speed->speedA = 0;
		speed->speedB = 1;
		speed->timeA = TRANSMISSION_INTERVAL;
		speed->timeB = 0;
		return;
	} else {
		speed->speedA = value;
		speed->speedB = value + 1;
		speed->timeA = TRANSMISSION_INTERVAL;
		speed->timeB = 0;
	}
}

void adjust_speed(struct speed_combination *speed, int steps){
	speed->timeA -= steps * TRANSMISSION_STEP;
	speed->timeB += steps * TRANSMISSION_STEP;

	while(speed->timeA > TRANSMISSION_INTERVAL){
		speed->timeA -= TRANSMISSION_INTERVAL;
		speed->timeB += TRANSMISSION_INTERVAL;
		speed->speedA--;
		speed->speedB = speed->speedA + 1;
	}

	while(speed->timeB > TRANSMISSION_INTERVAL){
		speed->timeA += TRANSMISSION_INTERVAL;
		speed->timeB -= TRANSMISSION_INTERVAL;
		speed->speedA++;
		speed->speedB = speed->speedA + 1;
	}

	if(speed->speedA >= 14)
		set_speed(speed, 14);

	if(speed->speedB <= 0)
		set_speed(speed, 0);
}

struct Data{
	int caller, clock_tid, train, parity;
	struct speed_combination speed;
	struct transmit_message request, timeout;
};

SIV initialize(struct Data *d){
	d->clock_tid = WhoIs("CLOCK");
	d->timeout.code = TRANSMIT_TYPE_TIMEOUT;
	d->parity = 0;
	Receive(&d->caller, (char *) &d->train, sizeof(d->train));
	Reply(d->caller, 0, 0);
	int init_speed;
	Receive(&d->caller, (char *) &init_speed, sizeof(init_speed));
	Reply(d->caller, 0, 0);
	set_speed(&d->speed, init_speed);
}

void transmission(){
	struct Data d;
	initialize(&d);
	async_delay(d.clock_tid, 0, (char *) &d.timeout, sizeof(d.timeout));
	while(1){
		Receive(&d.caller, (char *) &d.request, sizeof(d.request));
		Reply(d.caller, 0, 0);
		switch(d.request.code){
			case TRANSMIT_TYPE_SET:
				set_speed(&d.speed, d.request.arg);
			break;
			case TRANSMIT_TYPE_ADJUST:
				adjust_speed(&d.speed, d.request.arg);
			break;
			case TRANSMIT_TYPE_REVERSE:
				if(d.speed.speedA == 0 && d.speed.timeA == TRANSMISSION_INTERVAL){
					tput2(15, d.train);
				} else{
					ERROR("PANIC: TRIED TO REVERSE AT SPEED NOT 0!");
				}
			break;
			case TRANSMIT_TYPE_TIMEOUT:
				d.parity = !d.parity;
				if(d.parity){
					tput2(d.speed.speedB, d.train);
					async_delay(d.clock_tid, d.speed.timeB, (char *) &d.timeout, sizeof(d.timeout));
				} else{
					tput2(d.speed.speedA, d.train);
					async_delay(d.clock_tid, d.speed.timeA, (char *) &d.timeout, sizeof(d.timeout));
				}
			break;
		}
	}
}

void transmission_test(){
	int child_tid = CreateSize(2, transmission, TASK_SIZE_TINY);
	int train = 24;
	int init_speed = 0;
	int clock_tid = WhoIs("CLOCK");
	struct transmit_message request;
	request.code = TRANSMIT_TYPE_ADJUST;
	request.arg = 1;
	Send(child_tid, (char *) &train, sizeof(train), 0, 0);
	Send(child_tid, (char *) &init_speed, sizeof(init_speed), 0, 0);
	for(int i = 0; i < 60; i++) {
		Send(child_tid, (char *) &request, sizeof(request), 0, 0);
		Delay(clock_tid, 60);
	}
	request.arg = -1;
	for(int i = 0; i < 60; i++) {
		Send(child_tid, (char *) &request, sizeof(request), 0, 0);
		Delay(clock_tid, 60);
	}
	request.code = TRANSMIT_TYPE_REVERSE;
	Delay(clock_tid, 100);
	Send(child_tid, (char *) &request, sizeof(request), 0, 0);
	Delay(clock_tid, 60);
	request.code = TRANSMIT_TYPE_SET;
	request.arg = 10;
	Send(child_tid, (char *) &request, sizeof(request), 0, 0);
	request.code = TRANSMIT_TYPE_REVERSE;
	Delay(clock_tid, 200);
	Send(child_tid, (char *) &request, sizeof(request), 0, 0);
}
