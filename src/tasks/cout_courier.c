#include <service.h>

#include "cout_server.h"

struct Data {
	int notifier;
	int parent;
};

ENTRY initialize(struct Data *data)
{
	data->notifier = CreateSize(0, cout_notifier, TASK_SIZE_TINY);
	data->parent = MyParentTid();
}

ENTRY work(struct Data *data)
{
	int tid;
	char ch;

	/* Receive from the cout notifier. */
	Receive(&tid, 0, 0);

	/* Send to the cout server. */
	ch = sendCoutReady(data->parent);
	Reply(tid, &ch, sizeof(ch));
}

MAKE_SERVICE(cout_courier)
