#include <server.h>
#include "gui.h"
#include "trains/track_server.h"
#include "debugio.h"

void gui_reader(void);

struct Data {
    int track_id;
    int child_id;
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

    RegisterAs(GUI_SERVER_NAME);
    cputc(2);
}

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
            char m[4];
            m[0] = (msg->msg.type == TSMT_SENSOR_DOWN ? 's' : 'S');
            m[1] = msg->msg.data.sensor.group + 'A';
            m[2] = (msg->msg.data.sensor.id > 8 ? 'a' + msg->msg.data.sensor.id - 9 : '1' + msg->msg.data.sensor.id);
            m[3] = 0;
            cputstr(m);
        }
    } else {
        Send(data->child_id, (char*)&tid, sizeof(tid), 0, 0);
        Reply(tid, 0, 0);
    }
}

void registerForMessages(int tid)
{
    Send(tid, 0, 0, 0, 0);
}

MAKE_SERVER(gui)
