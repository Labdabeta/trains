#include <service.h>

#include "clock_server.h"

struct Data {
	int notifier;
	int parent;
};

ENTRY initialize(struct Data *data)
{
	data->notifier = CreateSize(0, clock_notifier, TASK_SIZE_TINY);
	data->parent = MyParentTid();
}

ENTRY work(struct Data *data)
{
	int tid;

	/* Receive from the clock notifier. */
	Receive(&tid,0,0);
	Reply(tid,0,0);

	/* Send to the clock server. */
	sendTick(data->parent);
}

MAKE_SERVICE(clock_courier)
