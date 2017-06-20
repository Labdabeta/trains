#include <server.h>
#include "cout_server.h"

#define OUTPUT_BUFSIZE 0x100

struct Data {
	/* Circular buffer of output blocked tasks. */
	char outputs[OUTPUT_BUFSIZE];
	int output_idx;
	int output_size;
	int ready;
	int courier;
};

struct Message {
	char b1;
	char b2;
	int type; /* 0 = ready, 1 = 1 byte, 2 = 2 bytes. */
};

ENTRY initialize(struct Data *data)
{
	data->output_idx = 0;
	data->output_size = 0;
	data->ready = 0;

	RegisterAs("TOUT");
	data->courier = CreateSize(1, tout_courier, TASK_SIZE_TINY);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	(void)size; /* unused */
	switch (m->type) {
		case 0:
			if (data->output_size) {
				char ch = data->outputs[data->output_idx];
				data->output_idx = (data->output_idx + 1) % OUTPUT_BUFSIZE;
				data->output_size--;
				Reply(tid, &ch, sizeof(ch));
			} else {
				data->ready = 1;
			}
			break;
		case 1:
			if (data->ready) {
				data->ready = 0;
				Reply(data->courier, &m->b1, sizeof(m->b1));
			} else {
				/* Copy data. */
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = m->b1;
			}
			Reply(tid, 0, 0);
			break;
		case 2:
			if (data->ready) {
				data->ready = 0;
				Reply(data->courier, &m->b1, sizeof(m->b1));

				/* Copy remaining data. */
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = m->b2;
			} else {
				/* Copy data. */
				int idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = m->b1;
				idx = data->output_idx + data->output_size++;
				data->outputs[idx % OUTPUT_BUFSIZE] = m->b2;
			}
			Reply(tid, 0, 0);
			break;
		default:
			DEBUG_PRINT("ERROR Invalid message in tout server %d", m->type);
	}
}

char sendToutReady(int tid)
{
	struct Message msg;
	char reply;
	msg.type = 0;
	Send(tid, (char*)&msg, sizeof(msg), &reply, sizeof(reply));
	return reply;
}

void sendToutByte(int tid, char b1)
{
	struct Message msg;
	msg.type = 1;
	msg.b1 = b1;
	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void sendToutBytePair(int tid, char b1, char b2)
{
	struct Message msg;
	msg.type = 2;
	msg.b1 = b1;
	msg.b2 = b2;
	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

MAKE_SERVER(tout_server)
