#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	int got_tx;
	int got_cts;
	volatile struct UART *com1;
};

ENTRY initialize(struct Data *data)
{
	data->com1 = (struct UART*)UART1_BASE;
	data->parent = MyParentTid();
	data->got_tx = 0;
	data->got_cts = 0;

	data->com1->lcrl = 191;
	data->com1->lcrm = 0;
	data->com1->lcrh &= ~(UART_FIFOEN_MASK);
	data->com1->ctrl |= 0x28;

	data->com1->data = 96;
}

ENTRY work(struct Data *data)
{
	AwaitEvent(EVENT_TYPE_UART1_INT);

	if (data->com1->cint & 0x2) {
		// Oops, that's a receive
	} else if (data->com1->cint & 0x4 && !data->got_tx) {
		// Its a transmit
		data->got_tx = 1;
		data->com1->ctrl &= ~(0x20);
	} else {
		// Its a modem
		if (data->com1->flag & 1)
			data->got_cts = 1;
		data->com1->cint = 1;
	}
	if (data->got_tx && data->got_cts) {
		// ready to send!
		char ch;
		data->got_tx = 0;
		data->got_cts = 0;
		Send(data->parent, 0, 0, &ch, sizeof(ch));
		data->com1->data = ch;
		data->com1->ctrl |= 0x20;
	}
}

MAKE_SERVICE(tout_notifier)
