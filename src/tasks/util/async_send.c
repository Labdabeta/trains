#include "tasks.h"
#include "util/async_send.h"
#include "linker.h"

void courier_task(void)
{
    char *msg;
    int msglen;
    int source;
    int destination;

    Receive(&source, (char*)&msglen, sizeof(msglen));
    Reply(source, 0, 0);

    Receive(&source, (char*)&destination, sizeof(destination));
    Reply(source, 0, 0);

    msg = alloc(msglen);
    Receive(&source, msg, msglen);
    Reply(source, 0, 0);

    Send(destination, msg, msglen, 0, 0);

    Exit();
}

void async_send(int tid, char *msg, int msglen)
{
    int courier = Create(1, courier_task);
    dprintf("Courier created with id %d\n\r", courier);

    Send(courier, (char*)&msglen, sizeof(msglen), 0, 0);
    Send(courier, (char*)&tid, sizeof(tid), 0, 0);
    Send(courier, msg, msglen, 0, 0);
}
