#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	volatile struct UART *com1;
};

ENTRY initialize(struct Data *data)
{
	data->com1 = (struct UART*)UART1_BASE;
	data->parent = MyParentTid();

	data->com1->lcrl = 191;
	data->com1->lcrm = 0;
	data->com1->lcrh &= ~(UART_FIFOEN_MASK);
	data->com1->ctrl |= 0x10;
}

ENTRY work(struct Data *data)
{
	int send;
	AwaitEvent(EVENT_TYPE_UART1_RX);
	send = data->com1->data;
	Send(data->parent, (char*)&send, sizeof(send), 0, 0);
}

MAKE_SERVICE(tin_notifier)
