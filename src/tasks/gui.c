#include <server.h>
#include "gui.h"
#include "trains/track_server.h"
#include "debugio.h"

#define MAX_CLIENTS 0x10

char _display_buffer[GUI_CMD_LEN_MAX];
void gui_reader(void);

struct Data {
    int track_id;
    int child_id;
    int clients[MAX_CLIENTS];
    int num_clients;
};

struct Message {
    union {
        struct TrackServerMessage track;
        struct GUIMessage gui;
    } data;
};

ENTRY initialize(struct Data *data)
{
    data->track_id = WhoIs(TRACK_SERVER_NAME);

    while (cgetc() != '?');
    cputc(2);

    registerForSensorDown(data->track_id, -1);
    registerForSensorUp(data->track_id, -1);
    registerForSwitch(data->track_id);

    data->child_id = CreateSize(1, gui_reader, TASK_SIZE_TINY);
    data->num_clients = 0;

    RegisterAs(GUI_SERVER_NAME);
}

#define TO_HEX_CHAR(X) ("0123456789ABCDEF"[(X)])
ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    char m[4] = {0};
    if (msg->data.track.msgid == TRACK_MESSAGE_ID) {
        Reply(tid, 0, 0);
        if (msg->data.track.type == TSMT_SWITCH_FLIP) {
            m[0] = (msg->data.track.data.sw.isCurved ? 'c' : '|');
            m[1] = TO_HEX_CHAR(msg->data.track.data.sw.change_id >> 4);
            m[2] = TO_HEX_CHAR(msg->data.track.data.sw.change_id & 0xF);
            cputstr(m);
        } else {
            m[0] = (msg->data.track.type == TSMT_SENSOR_DOWN ? 's' : 'S');
            m[1] = msg->data.track.data.sensor.sensor.group + 'A'; // when did we start using C#?
            m[2] = TO_HEX_CHAR(msg->data.track.data.sensor.sensor.id);
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
