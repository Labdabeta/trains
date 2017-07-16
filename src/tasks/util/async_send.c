#include "tasks.h"
#include "util/async_send.h"
#include "linker.h"

void courier_task(void)
{
    struct AsyncSendMessage *msg;
    int destination;
    int size;
    int source;
    Receive(&source, (char*)&size, sizeof(size));
    Reply(source, 0, 0);

    msg = alloc(sizeof(*msg) + size);
    msg->data_len = size;
    msg->asyncCode = ASYNC_CODE;

    Receive(&msg->source_tid, msg->data, msg->data_len);
    Reply(msg->source_tid, 0, 0);

    Receive(&msg->source_tid, (char*)&destination, sizeof(destination));
    Reply(msg->source_tid, 0, 0);

    Send(destination, (char*)msg, sizeof(*msg)+size, 0, 0);

    Exit();
}

int async_send(int tid, char *msg, int msglen)
{
    int courier = Create(1, courier_task);
    dprintf("Created a courier with id %d\n\r", courier);

    Send(courier, (char*)&msglen, sizeof(msglen), 0, 0);
    Send(courier, msg, msglen, 0, 0);
    return Send(courier, (char*)&tid, sizeof(tid), 0, 0);
}
