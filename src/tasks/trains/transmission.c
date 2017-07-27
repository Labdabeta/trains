#include "tasks.h"
#include "util/async_delay.h"
#include "transmission.h"
#include "logging.h"
#include <server.h>

void set_speed(struct speed_combination *speed, int value){
	if(value >= 14) {
		speed->speedA = 13;
		speed->speedB = 14;
		speed->timeA = 0;
		speed->timeB = TRANSMISSION_INTERVAL;
	} else if(value <= 0) {
		speed->speedA = 0;
		speed->speedB = 1;
		speed->timeA = TRANSMISSION_INTERVAL;
		speed->timeB = 0;
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
};

struct Message {
    struct TransmitMessage data;
};

ENTRY initialize(struct Data *d)
{
	int init_speed;
	d->clock_tid = WhoIs("CLOCK");
	d->parity = 0;

	Receive(&d->caller, (char *) &d->train, sizeof(d->train));
	Reply(d->caller, 0, 0);

	Receive(&d->caller, (char *) &init_speed, sizeof(init_speed));
	Reply(d->caller, 0, 0);

	set_speed(&d->speed, init_speed);

    async_delay(d->clock_tid, 0, 0, 0);
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    Reply(tid, 0, 0);
    if (msg_size) { // actual message
        switch (msg->data.code) {
            case TRANSMIT_TYPE_SET:
                set_speed(&data->speed, msg->data.arg);
                LOG(LOG_TRANSMISSION, "SET. A: %d, B: %d, At %d, Bt %d",
                        data->speed.speedA, data->speed.speedB,
                        data->speed.timeA, data->speed.timeB);
                break;
            case TRANSMIT_TYPE_ADJUST:
				adjust_speed(&data->speed, msg->data.arg);
				LOG(LOG_TRANSMISSION, "ADJUST. A: %d, B: %d, At %d, Bt %d",
                        data->speed.speedA, data->speed.speedB,
                        data->speed.timeA, data->speed.timeB);
                break;
            case TRANSMIT_TYPE_REVERSE:
				if(data->speed.speedA == 0 && data->speed.timeA == TRANSMISSION_INTERVAL){
					tput2(15, data->train);
				} else{
					ERROR("PANIC: TRIED TO REVERSE AT SPEED NOT 0!");
				}
                break;
        }
    } else { // timeout
        data->parity = !data->parity;
        if (data->parity) {
            tput2(data->speed.speedB, data->train);
            async_delay(data->clock_tid, data->speed.timeB, 0, 0);
        } else {
            tput2(data->speed.speedA, data->train);
            async_delay(data->clock_tid, data->speed.timeA, 0, 0);
        }
    }
}

MAKE_SERVER(transmission)

void transmission_test(){
	int child_tid = CreateSize(2, transmission, TASK_SIZE_TINY);
	int train = 24;
	int init_speed = 0;
	int clock_tid = WhoIs("CLOCK");
	struct TransmitMessage request;
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
