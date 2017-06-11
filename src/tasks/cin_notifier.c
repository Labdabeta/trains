#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	volatile struct UART *com2;
};

ENTRY initialize(struct Data *data)
{
	data->com2 = (struct UART*)UART2_BASE;
	data->parent = MyParentTid();

	data->com2->ctrl |= UART_FIFOEN_MASK;
	EnableEvent(EVENT_TYPE_UART2_RX);
}

ENTRY work(struct Data *data)
{
	int send;
	AwaitEvent(EVENT_TYPE_UART2_RX);
	send = data->com2->data;
	Send(data->parent, (char*)&send, sizeof(send), 0, 0);
}

MAKE_SERVICE(cin_notifier)
