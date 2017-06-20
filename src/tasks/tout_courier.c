#include <service.h>

#include "tout_server.h"

struct Data {
	int notifier;
	int parent;
};

ENTRY initialize(struct Data *data)
{
	RegisterAs("TOUT_N");
	data->notifier = CreateSize(0, tout_notifier, TASK_SIZE_TINY);
	data->parent = MyParentTid();
}

ENTRY work(struct Data *data)
{
	int tid;
	char ch;

	/* Receive from the train notifier. */
	Receive(&tid, 0, 0);

	/* Send to the tout server. */
	ch = sendToutReady(data->parent);
	Reply(tid, &ch, sizeof(ch));
}

MAKE_SERVICE(tout_courier)
