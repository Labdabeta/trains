#include <server.h>
#include "kernel/task.h"
#include "name_server.h"
#include "string.h"

struct Data {
	char names[MAX_NAME_LENGTH * NUM_SUPPORTED_TASKS];
	char tids[NUM_SUPPORTED_TASKS];
	int size;
};

void dumpNSData(struct Data *data)
{
    int i;
    dprintf("%d names known:\n\r", data->size);
    for (i = 0; i < data->size; ++i)
        dprintf("\t%s -> %d\n\r", &data->names[i * MAX_NAME_LENGTH], data->tids[i]);
}

struct Message {
	char *name;
	int isRegister;
};

ENTRY initialize(struct Data *data)
{
	data->size = 0;
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	(void)size; /* unused */
	int reply;
	if (m->isRegister) {
		if (data->size == NUM_SUPPORTED_TASKS) {
			reply = -1;
			Reply(tid, (char*)&reply, sizeof(reply));
			return;
		}
		data->tids[data->size] = tid;

		/* Copy the name */
        strcpy(&data->names[(data->size++)*MAX_NAME_LENGTH], m->name);

		reply = 0;
		Reply(tid, (char*)&reply, sizeof(reply));
	} else {
		int i;
		int id = -1; /* not found */
		for (i = data->size - 1; i >= 0; --i) {
            if (!strcmp(m->name, &data->names[i*MAX_NAME_LENGTH])) {
                id = i;
                break;
            }
		}

		if (id == -1) {
			reply = -1;
		} else {
			reply = data->tids[id];
		}
		Reply(tid, (char*)&reply, sizeof(reply));
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
