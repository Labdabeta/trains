#include <server.h>
#include "tin_server.h"

#define BLOCK_BUFSIZE 0x8
#define INPUT_BUFSIZE 0x100

struct Data {
	/* Circular buffer of input blocked tasks. */
	int blocked_tids[BLOCK_BUFSIZE];
	int block_idx;
	int block_size;

	/* Circular buffer of inputs. */
	char inputs[INPUT_BUFSIZE];
	int input_idx;
	int input_size;
};

struct Message {
	int data; /* -1 = getc, otherwise = last byte read */
};

ENTRY initialize(struct Data *data)
{
	data->block_idx = 0;
	data->block_size = 0;
	data->input_idx = 0;
	data->input_size = 0;

	RegisterAs("TIN");
	(void)CreateSize(1, tin_courier, TASK_SIZE_TINY);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
	(void)size; /* unused */
	if (m->data < 0) {
		if (data->input_size) {
			int reply = data->inputs[data->input_idx];
			data->input_idx = (data->input_idx + 1) % INPUT_BUFSIZE;
			data->input_size--;
			Reply(tid, (char*)&reply, sizeof(reply));
		} else {
			if (data->block_size == BLOCK_BUFSIZE) {
				int reply = -1;
				Reply(tid, (char*)&reply, sizeof(reply));
			} else {
				int idx = data->block_idx + data->block_size++;
				data->blocked_tids[idx % BLOCK_BUFSIZE] = tid;
			}
		}
	} else {
        dprintf("Got: %c\n\r", (char)m->data);
		if (data->block_size) {
			int task = data->blocked_tids[data->block_idx];
			data->block_idx = (data->block_idx + 1) % BLOCK_BUFSIZE;
			data->block_size--;
			Reply(task, (char*)&m->data, sizeof(m->data));
			Reply(tid, 0, 0);
		} else {
			if (data->input_size == INPUT_BUFSIZE) {
				Reply(tid, 0, 0);
			} else {
				int idx = data->input_idx + data->input_size++;
				data->inputs[idx % INPUT_BUFSIZE] = m->data;
			}
		}
	}
}

void sendTinData(int tid, int ch)
{
	struct Message msg;
	msg.data = ch;
	Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

int sendTinGetc(int tid)
{
	struct Message msg;
	int reply;
	msg.data = -1;
	Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
	return reply;
}

MAKE_SERVER(tin_server)
