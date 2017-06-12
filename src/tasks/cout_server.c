#include <server.h>
#include "kernel/task.h"
#include "cout_server.h"

/* These should both be multiples of 2 for decent performance. */
#define OUTPUT_BUFSIZE 0x10000

struct Data {
	/* Circular buffer of output blocked tasks. */
	char outputs[OUTPUT_BUFSIZE];
	int output_idx;
	int output_size;
	int ready;
	int courier;
};

struct Message {
	char *data; /* NULL = ready, otherwise = null-terminated string to send. */
};

ENTRY initialize(struct Data *data)
{
	data->output_idx = 0;
	data->output_size = 0;
	data->ready = 0;

	RegisterAs("COUT");
	/* cutting out the middle man here. */
	data->courier = CreateSize(0, cout_notifier, TASK_SIZE_TINY);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	if (size) {
		if (data->ready) {
			char *ch;
			data->ready = 0;
			Reply(data->courier, m->data, sizeof(char));

			/* Copy remaining string */
			for (ch = &m->data[1]; *ch; ++ch) {
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = *ch;
			}
		} else {
			char *ch;

			/* Copy string */
			for (ch = m->data; *ch; ++ch) {
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = *ch;
			}
		}
		Reply(tid, 0, 0);
	} else {
		if (data->output_size) {
			char ch = data->outputs[data->output_idx];
			data->output_idx = (data->output_idx + 1) % OUTPUT_BUFSIZE;
			data->output_size--;
			Reply(tid, &ch, sizeof(ch));
		} else {
			data->ready = 1;
		}
	}
}

char sendCoutReady(int tid)
{
	char reply;
	Send(tid, 0, 0, &reply, sizeof(reply));
	return reply;
}

void sendCoutPutstr(int tid, char *str)
{
	struct Message msg;
	msg.data = str;
	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

MAKE_SERVER(cout_server)
