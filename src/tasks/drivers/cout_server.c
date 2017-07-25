#include <server.h>
#include "kernel/task.h"
#include "cout_server.h"
#include "string.h"

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
	char *data; /* NULL = ready, otherwise = string to send. */
    int size;
};

ENTRY initialize(struct Data *data)
{
	data->output_idx = 0;
	data->output_size = 0;
	data->ready = 0;

	RegisterAs("COUT");
	data->courier = CreateSize(0, cout_courier, TASK_SIZE_TINY);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	if (size) {
		if (data->ready) {
			char *ch;
            int i;
			data->ready = 0;
			Reply(data->courier, m->data, sizeof(char));

			/* Copy remaining string */
            ch = &m->data[1];
			for (i = 1; i < m->size; ++i, ++ch) {
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = *ch;
			}
		} else {
			char *ch;
            int i;

			/* Copy string */
            ch = m->data;
			for (i = 0; i < m->size; ++i, ++ch) {
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

void sendCoutPutstr(int tid, char *str, int strlen)
{
	struct Message msg;
	msg.data = str;
    msg.size = strlen;
	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

MAKE_SERVER(cout_server)
