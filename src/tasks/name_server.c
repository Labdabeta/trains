#include <server.h>
#include "kernel/task.h"
#include "name_server.h"

struct Data {
	char names[MAX_NAME_LENGTH * NUM_SUPPORTED_TASKS];
	char tids[NUM_SUPPORTED_TASKS];
	int size;
};

struct Message {
	char *name;
	int isRegister;
};

ENTRY initialize(struct Data *data)
{
	data->size = 0;
}

ENTRY handle(struct Data *data, int tid, struct Message *m)
{
	int reply;
	if (m->isRegister) {
		char *c,*n;
		if (data->size == NUM_SUPPORTED_TASKS) {
			reply = -1;
			Reply(tid, (char*)&reply, sizeof(reply));
			return;
		}
		data->tids[data->size] = tid;

		/* Copy the name */
		n = &data->names[(data->size++)*NUM_SUPPORTED_TASKS];
		for (c = m->name; *c; ++c, ++n) *n = *c;

		reply = 0;
		Reply(tid, (char*)&reply, sizeof(reply));
	} else {
		int i;
		int id = -1; /* not found */
		for (i = data->size - 1; i >= 0; --i) {
			char *c,*n;
			int same = 1;
			n = &data->names[i*NUM_SUPPORTED_TASKS];
			for (c = m->name; *c; ++c, ++n) {
				if (*c != *n) {
					same = 0;
					break;
				}
			}
			if (same) {
				id = i;
				break;
			}
		}

		if (id == -1)
			reply = -1;
		else
			reply = data->tids[id];
		Reply(tid, (char*)&reply, 1);
	}
}

int sendRegisterAs(int tid, char *name)
{
	struct Message msg;
	int reply;
	msg.name = name;
	msg.isRegister = 1;

	Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));

	return reply;
}

int sendWhoIs(int tid, char *name)
{
	struct Message msg;
	int reply;

	msg.name = name;
	msg.isRegister = 0;

	Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));

	return reply;
}

MAKE_SERVER(name_server)
