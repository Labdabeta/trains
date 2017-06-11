#include <service.h>

#include "cin_server.h"
#include "debugio.h"

struct Data {
	int notifier;
	int parent;
};

ENTRY initialize(struct Data *data)
{
	data->notifier = CreateSize(0, cin_notifier, TASK_SIZE_TINY);
	data->parent = MyParentTid();
}

ENTRY work(struct Data *data)
{
	int tid;
	int ch;

	/* Receive from the cin notifier. */
	Receive(&tid, (char*)&ch, sizeof(ch));
	Reply(tid, 0, 0);

	/* Send to the cin server. */
	sendCinData(data->parent, ch);
}

MAKE_SERVICE(cin_courier)
