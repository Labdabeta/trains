#include "switches.h"
#include <server.h>

#define MAX_CLIENTS 0x10

struct Data {
    int client_tids[MAX_CLIENTS];
    int num_clients;
    char switches[NUM_SWITCHES];
};

struct Message {
    /* The size matters here, 0 bytes is a registration, 1 byte is a poll, 4
     * bytes is a set -> positive is curved, negative is straight. */
    int query;
};

ENTRY initialize(struct Data *data)
{
    int i;
    int cid = WhoIs("CLOCK");
    data->num_clients = 0;

    RegisterAs("SWITCH");

    for (i = 0; i < NUM_SWITCHES; ++i) {
        tput2(33, i+1);
        data->switches[i] = 0;
        Delay(cid, 5);
    }
    tputc(32);
}

ENTRY handle(struct Data *data, int tid, struct Message *m, int size)
{
    int tmp;
    int client;
    switch (size) {
        case 0: /* Register */
            data->client_tids[data->num_clients++] = tid;
            Reply(tid, 0, 0);
            break;
        case 1: /* Query */
            tmp = data->switches[m->query - 1];
            Reply(tid, (char*)&tmp, sizeof(tmp));
        default: /* Update */
            if (m->query < 0)
                tmp = -m->query;
            else
                tmp = m->query;
            data->switches[tmp - 1] = (m->query >= 0);

            for (client = 0; client < data->num_clients; ++client) {
                char rpl[2] = { data->switches[tmp-1], tmp };
                Send(data->client_tids[client], (char*)&rpl, 2, 0, 0);
            }

            Reply(tid, 0, 0);
    }
}

void flipSwitch(int tid, int sw, int curved)
{
    if (curved) sw = -sw;
    Send(tid, (char*)&sw, sizeof(sw), 0, 0);
}

void registerForSwitchFlips(int tid)
{
    Send(tid, 0, 0, 0, 0);
}

int getSwitchState(int tid, int sw)
{
    int ret;
    Send(tid, 0, 0, (char*)&ret, sizeof(ret));
    return ret;
}

MAKE_SERVER(switches)
