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

	//data->com1->lcrh |= UART_FIFOEN_MASK;
	data->com1->lcrh &= ~(UART_FIFOEN_MASK);
	//data->com1->ctrl |= 5 << 3;

	data->com1->data = 96;
}

ENTRY work(struct Data *data)
{
	char ch;
	AwaitEvent(EVENT_TYPE_UART1_TX);

	/* A bit of hack to allow users to run while waiting on output. */
	Send(data->parent, 0, 0, &ch, sizeof(ch));
	data->com1->data = ch;
}

MAKE_SERVICE(tout_notifier)
