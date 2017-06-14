#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	volatile struct UART *com2;
};

ENTRY initialize(struct Data *data)
{
	char ch;
	data->com2 = (struct UART*)UART2_BASE;
	data->parent = MyParentTid();
	data->com2->ctrl |= 0x30;

	//data->com2->lcrh |= UART_FIFOEN_MASK;
	data->com2->lcrh &= ~(UART_FIFOEN_MASK);
	Send(data->parent, 0, 0, &ch, sizeof(ch));
	data->com2->data = ch;
}

ENTRY work(struct Data *data)
{
	char ch;
	AwaitEvent(EVENT_TYPE_UART2_TX);
	Send(data->parent, 0, 0, &ch, sizeof(ch));
	data->com2->data = ch;
}

MAKE_SERVICE(cout_notifier)
