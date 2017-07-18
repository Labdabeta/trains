#include <server.h>
#include "trains/switches.h"

struct Data {
    int clock;
};

struct Message {
    int sw;
    int isCurved;
};

ENTRY initialize(struct Data *data)
{
    data->clock = WhoIs("CLOCK");
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    Reply(tid, 0, 0);
    tput2((msg->isCurved ? 34 : 33), SW_ID_TO_NUM(msg->sw));
    Delay(data->clock, 6);
    tputc(32);
}

MAKE_SERVER(switch_flipper)
