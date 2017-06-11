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

	data->com2->lcrh |= UART_FIFOEN_MASK;
	EnableEvent(EVENT_TYPE_UART2_TX);
}

ENTRY work(struct Data *data)
{
	char ch;
	AwaitEvent(EVENT_TYPE_UART2_TX);

	/* A bit of hack to allow users to run while waiting on output. */
	DisableEvent(EVENT_TYPE_UART2_TX);
	Send(data->parent, 0, 0, &ch, sizeof(ch));
	while(1); /* See if we even get here. */

	data->com2->data = ch;
	EnableEvent(EVENT_TYPE_UART2_TX);
}

MAKE_SERVICE(cout_notifier)
