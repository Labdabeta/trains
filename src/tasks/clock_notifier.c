#include <service.h>
#include "ts7200.h"

struct Data {
	int parent;
	volatile struct Timer *t1;
};

ENTRY initialize(struct Data *data)
{
	data->t1 = (struct Timer*)TIMER1_BASE;
	data->parent = MyParentTid();

	data->t1->load = 19;
	data->t1->ctrl |= TIMER_ENABLE_MASK | TIMER_PERIODIC_MASK;
	EnableEvent(EVENT_TYPE_TIMER_1);
}

ENTRY work(struct Data *data)
{
	AwaitEvent(EVENT_TYPE_TIMER_1);
	data->t1->clear = 0; /* Clear the interrupt. */
	Send(data->parent, 0, 0, 0, 0);
}

MAKE_SERVICE(clock_notifier)
