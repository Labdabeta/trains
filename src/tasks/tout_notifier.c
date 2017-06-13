#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	int tin_c; /* We might accidentally grab a tin, so we need to know the tin courier too. */
	int got_tx;
	int got_cts;
	volatile struct UART *com1;
};

ENTRY initialize(struct Data *data)
{
	data->com1 = (struct UART*)UART1_BASE;
	data->parent = MyParentTid();
	data->tin_c = WhoIs("TIN_C");
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
	data->com1->ctrl |= 0x20;
	dprintf("WAITING\n\r");
	AwaitEvent(EVENT_TYPE_UART1_INT);

	if (data->com1->flag & 0x40) {
		dprintf("Got a receive\n\r");
		// Oops, that's a receive
	} else if (data->com1->flag & 0x1) {
		dprintf("Got a cts\n\r");
		// CTS
		data->got_cts = 1;
		data->com1->cint = 1;
	} else if (data->com1->flag & 0x80) {
		dprintf("Got a transmit\n\r");
		// Transmit empty
		data->got_tx = 1;
		data->com1->ctrl &= ~(0x20); /* disable TXFE */
	} else { dprintf("Got a wtf\n\r"); }

	if (data->got_tx && data->got_cts) {
		// ready to send!
		char ch;
		data->got_tx = 0;
		data->got_cts = 0;
		Send(data->parent, 0, 0, &ch, sizeof(ch));
		data->com1->data = ch;
	}
}

MAKE_SERVICE(tout_notifier)
