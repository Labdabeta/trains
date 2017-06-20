#include <service.h>

#include "tin_server.h"

struct Data {
	int notifier;
	int parent;
};

ENTRY initialize(struct Data *data)
{
	data->notifier = CreateSize(0, tin_notifier, TASK_SIZE_TINY);
	data->parent = MyParentTid();
	RegisterAs("TIN_C");
}

ENTRY work(struct Data *data)
{
	int tid;
    char c;

	/* Receive from the tin notifier. */
	Receive(&tid, (char*)&c, sizeof(c));
	Reply(tid, 0, 0);

	/* Send to the tin server. */
	sendTinData(data->parent, (int)c);
}

MAKE_SERVICE(tin_courier)
