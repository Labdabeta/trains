#include <server.h>
#include "gui.h"
#include "trains/track_server.h"
#include "debugio.h"

#define MAX_CLIENTS 0x10

void gui_reader(void);

struct Data {
    int track_id;
    int child_id;
    int clients[MAX_CLIENTS];
    int num_clients;
};

struct Message {
    struct TrackServerMessage msg;
};

ENTRY initialize(struct Data *data)
{
    data->track_id = WhoIs(TRACK_SERVER_NAME);

    registerForSensorDown(data->track_id, -1);
    registerForSensorUp(data->track_id, -1);
    registerForSwitch(data->track_id);

    data->child_id = CreateSize(1, gui_reader, TASK_SIZE_TINY);
    data->num_clients = 0;

    RegisterAs(GUI_SERVER_NAME);
    cputc(2);
}

#define TO_HEX_CHAR(X) ("0123456789ABCDEF"[(X)])
ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    if (tid == data->track_id) {
        Reply(tid, 0, 0);
        if (msg->msg.type == TSMT_SWITCH_FLIP) {
            char m[24];
            int i;
            m[0] = 'w';
            for (i = 1; i < 23; ++i)
                m[i] = (IS_CURVED(msg->msg.data.switches, i) ? 'c' : 's');
            m[23] = 0;
            cputstr(m);
        } else {
            char m[6];
            m[0] = (msg->msg.type == TSMT_SENSOR_DOWN ? 's' : 'S');
            m[1] = msg->msg.data.sensor.sensor.group + 'A'; // when did we start using C#?
            m[2] = TO_HEX_CHAR(msg->msg.data.sensor.sensor.id);
            if (msg->msg.data.sensor.train < 0) {
                m[3] = '?';
                m[4] = '?';
            } else {
                m[3] = TO_HEX_CHAR(msg->msg.data.sensor.train >> 4);
                m[4] = TO_HEX_CHAR(msg->msg.data.sensor.train & 0xF);
            }
            m[5] = 0;
            cputstr(m);
        }
    } else if (tid == data->child_id) {
        // Directly forward all input messages to clients
        int i;
        for (i = 0; i < data->num_clients; ++i)
            Send(data->clients[i], (char*)msg, msg_size, 0, 0);
        Reply(tid, 0, 0);
    } else {
        data->clients[data->num_clients++] = tid;
        Reply(tid, 0, 0);
    }
}

void registerForMessages(int tid)
{
    Send(tid, 0, 0, 0, 0);
}

MAKE_SERVER(gui)
