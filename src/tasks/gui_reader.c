#include <server.h>
#include "gui.h" // for the messages we pass to our clients
#include "debugio.h"

#define MAX_CLIENTS 0x10

struct Data {
    int clients[MAX_CLIENTS];
    int num_clients;
    int courier;
};

struct Message {
    int new_client;
};

void gui_courier(void)
{
    Service();
    int parent = MyParentTid();
    for (ever) {
        int ch = cgetc();
        Send(parent, (char*)&ch, sizeof(ch), 0, 0);
    }
}

ENTRY initialize(struct Data *data)
{
    data->num_clients = 0;
    data->courier = CreateSize(0, gui_courier, TASK_SIZE_TINY);
}

static inline void handleMessage(struct Data *data, char ch)
{
    int i;
    struct GUIMessage msg;
    if (ch == 'Q') {
        msg.type = GMT_QUIT;
        for (i = 0; i < data->num_clients; ++i)
            Send(data->clients[i], (char*)&msg, sizeof(msg), 0, 0);
    }
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    if (tid == data->courier) {
        char c = (char)msg->new_client;
        Reply(tid, 0, 0);

        handleMessage(data,c);
    } else {
        data->clients[data->num_clients++] = msg->new_client;
        dprintf("Client %d registered for gui.\n\r", msg->new_client);
        Reply(tid, 0, 0);
    }
}

MAKE_SERVER(gui_reader)
