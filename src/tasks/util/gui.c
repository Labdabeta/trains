#include <server.h>
#include "sensors.h"

struct Data {
    char msg[4];
};

struct Message {
    int data;
};

void quitter(void)
{
    while (cgetc() != 'Q');
    Exit();
}

ENTRY initialize(struct Data *data)
{
    registerForSensorFlips(WhoIs("SENSOR"));
    Create(5, quitter);

    data->msg[3] = 0;

    cputc(2);
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int size)
{
    int grn;
    Reply(tid, 0, 0);
    dprintf("Got: %d\n\r", tid);
    if (msg->data < 0) {
        data->msg[0] = 'S';
        toGroupNumber(-msg->data, &data->msg[1], &grn);
        if (grn < 10)
            data->msg[2] = '0' + grn;
        else
            data->msg[2] = 'a' + grn - 10;
    } else if (msg->data > 0) {
        data->msg[0] = 's';
        toGroupNumber(msg->data, &data->msg[1], &grn);
        if (grn < 10)
            data->msg[2] = '0' + grn;
        else
            data->msg[2] = 'a' + grn - 10;
    }

    cputstr(data->msg);
}

MAKE_SERVER(gui)
