#include <server.h>
#include "gui.h"
#include "trains/track_server.h"
#include "trains/hotel.h"
#include "debugio.h"

#define MAX_CLIENTS 0x10

char _display_buffer[GUI_CMD_LEN_MAX];
void gui_reader(void);

struct Data {
    int track_id;
    int hotel_id;
    int child_id;
    int clients[MAX_CLIENTS];
    int num_clients;
    struct Restrictions last;
};

struct Message {
    union {
        struct TrackServerMessage track;
        struct HotelMessage hotel;
        struct GUIMessage gui;
    } data;
};

ENTRY initialize(struct Data *data)
{
    data->track_id = WhoIs(TRACK_SERVER_NAME);
    data->hotel_id = WhoIs(RESERVATION_SERVER_NAME);

    for (int i = 0; i < TRACK_MAX; ++i)
        data->last.isEnabled[i] = 1;

    while (cgetc() != '?');
    cputc(2);

    /*
    registerForSensorDown(data->track_id, -1);
    registerForSensorUp(data->track_id, -1);
    registerForSwitch(data->track_id);
    dprintf("REGISTERING FOR HOTEL MESSAGES\n");
    registerForChanges(data->hotel_id);
    dprintf("REGISTERED FOR HOTEL MESSAGES\n");
    */

    data->child_id = CreateSize(1, gui_reader, TASK_SIZE_TINY);
    data->num_clients = 0;

    RegisterAs(GUI_SERVER_NAME);
}

#define TO_HEX_CHAR(X) (((X) >= 0 && (X) <= 15) ? ("0123456789ABCDEF"[(X)]) : '?')
ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    char m[4] = {0};
    Reply(tid, 0, 0);
    if (msg->data.track.msgid == TRACK_MESSAGE_ID) {
        if (msg->data.track.type == TSMT_SWITCH_FLIP) {
            m[0] = (msg->data.track.data.sw.isCurved ? 'c' : '|');
            m[1] = TO_HEX_CHAR(msg->data.track.data.sw.change_id >> 4);
            m[2] = TO_HEX_CHAR(msg->data.track.data.sw.change_id & 0xF);
            m[3] = 0;
            cputstr(m);
        } else {
            m[0] = (msg->data.track.type == TSMT_SENSOR_DOWN ? 's' : 'S');
            m[1] = msg->data.track.data.sensor.sensor.group + 'A'; // when did we start using C#?
            m[2] = TO_HEX_CHAR(msg->data.track.data.sensor.sensor.id);
            m[3] = 0;
            cputstr(m);
        }
    } else if (msg->data.hotel.identifier == HOTEL_MESSAGE_ID) {
        dprintf("GOT HOTEL MESSAGE\n");
        // Check for changes in restrictions
        for (int i = 0; i < TRACK_MAX; ++i) {
            if (data->last.isEnabled[i] && !msg->data.hotel.restrictions.isEnabled[i]) {
                data->last.isEnabled[i] = 0;
                if (track_nodes[i].type == NODE_SENSOR) {
                    struct Sensor sen = S_MID(i);
                    m[0] = '_';
                    m[1] = sen.group + 'A';
                    m[2] = TO_HEX_CHAR(sen.id);
                    m[3] = 0;
                } else if (track_nodes[i].type == NODE_BRANCH || track_nodes[i].type == NODE_MERGE) {
                    m[0] = 'v';
                    m[1] = TO_HEX_CHAR(track_nodes[i].num >> 4);
                    m[2] = TO_HEX_CHAR(track_nodes[i].num & 0xF);
                    m[3] = 0;
                }
                cputstr(m);
            }
            if (!data->last.isEnabled[i] && msg->data.hotel.restrictions.isEnabled[i]) {
                data->last.isEnabled[i] = 1;
                if (track_nodes[i].type == NODE_SENSOR) {
                    struct Sensor sen = S_MID(i);
                    m[0] = '-';
                    m[1] = sen.group + 'A';
                    m[2] = TO_HEX_CHAR(sen.id);
                    m[3] = 0;
                } else if (track_nodes[i].type == NODE_BRANCH || track_nodes[i].type == NODE_MERGE) {
                    m[0] = 'V';
                    m[1] = TO_HEX_CHAR(track_nodes[i].num >> 4);
                    m[2] = TO_HEX_CHAR(track_nodes[i].num & 0xF);
                    m[3] = 0;
                }
                cputstr(m);
            }
        }
    } else if (tid == data->child_id) {
        // Directly forward all input messages to clients
        int i;
        for (i = 0; i < data->num_clients; ++i)
            Send(data->clients[i], (char*)msg, msg_size, 0, 0);
    } else {
        data->clients[data->num_clients++] = tid;
    }
}

void registerForMessages(int tid)
{
    Send(tid, 0, 0, 0, 0);
}

MAKE_SERVER(gui)
