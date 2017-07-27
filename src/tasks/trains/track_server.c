#include "trains/track_server.h"
#include <server.h>
#include "util/async_send.h"
#include "gui.h"
#include "trains/stop_distance.h"

#define MAX_CLIENTS 0x10

void sensor_courier(void);

struct SwitchMessage {
    int sw;
    int isCurved;
};

void switch_flipper(void);

// tid[TRAIN_MAX] means ANY
struct Data {
    int cid;
    int sensorTid;
    char sensors[10];
    int last_sensor;
    int flipper;
    struct Track track;

    // wait data
    int sendown_tids[TRAIN_MAX + 1][MAX_CLIENTS]; int num_sendown_tids[TRAIN_MAX + 1];
    int senup_tids[TRAIN_MAX + 1][MAX_CLIENTS]; int num_senup_tids[TRAIN_MAX + 1];
    int switch_tids[MAX_CLIENTS]; int num_switch_tids;

    // register data
    int sendown_clients[TRAIN_MAX + 1][MAX_CLIENTS]; int num_sendown_clients[TRAIN_MAX + 1];
    int senup_clients[TRAIN_MAX + 1][MAX_CLIENTS]; int num_senup_clients[TRAIN_MAX + 1];
    int switch_clients[MAX_CLIENTS]; int num_switch_clients;
};

enum TrackMessage {
    TM_REGISTER_DOWN,
    TM_REGISTER_UP,
    TM_REGISTER_SWITCH,
    TM_UNREGISTER_DOWN,
    TM_UNREGISTER_UP,
    TM_UNREGISTER_SWITCH,
    TM_WAIT_DOWN,
    TM_WAIT_UP,
    TM_WAIT_SWITCH,
    TM_QUERY_SWITCH,
    TM_NOTIFY_SWITCH,
	TM_QUERY_SENSOR,
    TM_QUERY_LAST_LOCATION,
    TM_ADD_TRAIN
};

struct Message {
    // add train is sensorid << 8 | train#
    int datum; // usually train id or switch. For notify -ve means curved.
    enum TrackMessage type;
};


ENTRY initialize(struct Data *data)
{
    int i;
    initStopDistance();
    data->sensorTid = CreateSize(1, sensor_courier, TASK_SIZE_TINY);
    data->flipper = CreateSize(0, switch_flipper, TASK_SIZE_TINY);

    RegisterAs(TRACK_SERVER_NAME);

    data->cid = WhoIs("CLOCK");

    for (i = 0; i < 10; ++i)
        data->sensors[i] = 0;

    data->last_sensor = -1;

    for (i = 0; i < TRAIN_MAX + 1; ++i) {
        data->num_sendown_tids[i] = 0;
        data->num_senup_tids[i] = 0;
        data->num_sendown_clients[i] = 0;
        data->num_senup_clients[i] = 0;
    }

    data->num_switch_tids = 0;
    data->num_switch_clients = 0;

#ifdef TRACK_A
    initTrackA(&data->track);
#else
    initTrackB(&data->track);
#endif
}

/****************************** Message handlers ******************************/
static inline void handleRegisterDown(struct Data *data, int tid, int train)
{
    Reply(tid, 0, 0);
    LOG(LOG_TRACK_CLIENTS, "Adding client %d", data->num_sendown_clients[train >= 0 ? train : TRAIN_MAX]);
    if (train >= 0)
        data->sendown_clients[train][data->num_sendown_clients[train]++] = tid;
    else
        data->sendown_clients[TRAIN_MAX][data->num_sendown_clients[TRAIN_MAX]++] = tid;
}

static inline void handleUnregisterDown(struct Data *data, int tid, int train)
{
    int i;
    Reply(tid, 0, 0);
    // Find the index
    for (i = 0; i < MAX_CLIENTS; ++i) {
        if (train >= 0 && data->sendown_clients[train][i] == tid) {
            int x;
            for (x = i; x < data->num_sendown_clients[train] - 1; ++x)
               data->sendown_clients[train][x] = data->sendown_clients[train][x + 1];
            data->num_sendown_clients[train]--;
						return;
        } else if (train < 0 && data->sendown_clients[TRAIN_MAX][i] == tid) {
            int x;
            for (x = i; x < data->num_sendown_clients[TRAIN_MAX] - 1; ++x)
                data->sendown_clients[TRAIN_MAX][x] = data->sendown_clients[TRAIN_MAX][x + 1];
            data->num_sendown_clients[TRAIN_MAX]--;
						return;
        }
    }
}

static inline void handleRegisterUp(struct Data *data, int tid, int train)
{
    Reply(tid, 0, 0);
    if (train >= 0)
        data->senup_clients[train][data->num_senup_clients[train]++] = tid;
    else
        data->senup_clients[TRAIN_MAX][data->num_senup_clients[TRAIN_MAX]++] = tid;
}

static inline void handleUnregisterUp(struct Data *data, int tid, int train)
{
    int i;
    Reply(tid, 0, 0);
    // Find the index
    for (i = 0; i < MAX_CLIENTS; ++i) {
        if (train >= 0 && data->senup_clients[train][i] == tid) {
            int x;
            for (x = i; x < data->num_senup_clients[train] - 1; ++x)
               data->senup_clients[train][x] = data->senup_clients[train][x + 1];
            data->num_senup_clients[train]--;
						return;
        } else if (train < 0 && data->senup_clients[TRAIN_MAX][i] == tid) {
            int x;
            for (x = i; x < data->num_senup_clients[TRAIN_MAX] - 1; ++x)
                data->senup_clients[TRAIN_MAX][x] = data->senup_clients[TRAIN_MAX][x + 1];
            data->num_senup_clients[TRAIN_MAX]--;
						return;
        }
    }
}

static inline void handleRegisterSwitch(struct Data *data, int tid)
{
    Reply(tid, 0, 0);
    data->switch_clients[data->num_switch_clients++] = tid;
}


static inline void handleUnregisterSwitch(struct Data *data, int tid)
{
    int i;
    Reply(tid, 0, 0);
    // Find the index
    for (i = 0; i < MAX_CLIENTS; ++i) {
        if (data->switch_clients[i] == tid) {
            int x;
            for (x = i; x < data->num_switch_clients; ++x)
                data->switch_clients[x] = data->switch_clients[x + 1];
            data->num_switch_clients--;
						return;
        }
    }
}

static inline void handleWaitDown(struct Data *data, int tid, int train)
{
    if (train >= 0)
        data->sendown_tids[train][data->num_sendown_tids[train]++] = tid;
    else
        data->sendown_tids[TRAIN_MAX][data->num_sendown_tids[TRAIN_MAX]++] = tid;
}

static inline void handleWaitUp(struct Data *data, int tid, int train)
{
    if (train >= 0)
        data->senup_tids[train][data->num_senup_tids[train]++] = tid;
    else
        data->senup_tids[TRAIN_MAX][data->num_senup_tids[TRAIN_MAX]++] = tid;
}

static inline void handleWaitSwitch(struct Data *data, int tid)
{
    data->switch_tids[data->num_switch_tids++] = tid;
}

static inline void handleQuerySwitch(struct Data *data, int tid, int sw)
{
    char reply;

    reply = !!IS_CURVED(data->track.switches, sw);
    Reply(tid, &reply, sizeof(reply));
}

static inline void handleNotifySwitch(struct Data *data, int tid, int sw, int isCurved)
{
    int client;
    struct TrackServerMessage reply;
    Reply(tid, 0, 0);

    struct SwitchMessage sm = {sw, isCurved};
    async_send(data->flipper, (char*)&sm, sizeof(sm));
    saveSwitchFlip(&data->track, sw, isCurved);

    reply.type = TSMT_SWITCH_FLIP;
    reply.data.sw.switches = data->track.switches;
    reply.data.sw.change_id = sw;
    reply.data.sw.isCurved = isCurved;

    for (client = 0; client < data->num_switch_tids; ++client)
        Reply(data->switch_tids[client], (char*)&data->track.switches, sizeof(data->track.switches));
    data->num_switch_tids = 0;

    for (client = 0; client < data->num_switch_clients; ++client)
        async_send(data->switch_clients[client], (char*)&reply, sizeof(reply));
}

static inline void handleQuerySensor(struct Data *data, int tid, int sen)
{
	char reply;

	int block = sen >> 3;
	int bit = sen & 0x7;
	reply = !!(data->sensors[block] & (1 << (7 - bit)));

	Reply(tid, &reply, sizeof(reply));
}

static inline void handleAddTrain(struct Data *data, int tid, int train, int sen)
{
    (void)addTrain(&data->track, train, S_MID(sen));
    Reply(tid, 0, 0);
}

static inline void handleQueryLocation(struct Data *data, int tid, int train)
{
    int train_id;
    for (train_id = 0; train_id < TRAIN_MAX; ++train_id)
        if (data->track.realId[train_id] == train)
            break;

    if (train_id == TRAIN_MAX) {
        struct Sensor reply = S_NONE;
        Reply(tid, (char*)&reply, sizeof(reply));
    } else {
        struct Sensor reply = data->track.lastLocation[train_id];
        Reply(tid, (char*)&reply, sizeof(reply));
    }
}

/************************* Actual recieve/reply cycle *************************/

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    (void)msg_size; // unused

    if (tid == data->sensorTid) {
        int delta, sensor;
        data->last_sensor = (data->last_sensor + 1) % 10;
        Reply(tid, 0, 0);
        sensor = msg->datum & 0xFF;

        // Downs
        delta = ~data->sensors[data->last_sensor] & sensor;
        if (delta) {
            int bit;
            int mask = 1 << 7;
            for (bit = 0; bit < 8; ++bit) {
                if (delta & mask) {
                    struct Sensor reply;
                    struct TrackServerMessage message;
                    int client, train;

                    reply.group = data->last_sensor / 2;
                    reply.id = bit;

                    if (data->last_sensor & 1)
                        reply.id += 8;

                    LOG(LOG_SENSOR_DOWN, "%c%d", S_PRINT(reply));

                    message.msgid = TRACK_MESSAGE_ID;
                    message.type = TSMT_SENSOR_DOWN;
                    message.data.sensor.sensor = reply;

                    train = saveSensorFlip(&data->track, reply, Time(data->cid));

                    if (train >= 0)
                        train = data->track.realId[train];

                    LOG(LOG_ATTRIBUTION, "%c%d - %d", S_PRINT(reply), train);
                    message.data.sensor.train = train;

                    if (train >= 0) {
                        LOG(LOG_TRACK_CLIENTS, "%d", data->num_sendown_tids[train]);
                        for (client = 0; client < data->num_sendown_tids[train]; ++client)
                            Reply(data->sendown_tids[train][client], (char*)&reply, sizeof(reply));
                        data->num_sendown_tids[train] = 0;

                        LOG(LOG_TRACK_CLIENTS, "%d", data->num_sendown_clients[train]);
                        for (client = 0; client < data->num_sendown_clients[train]; ++client)
                            async_send(data->sendown_clients[train][client], (char*)&message, sizeof(message));
                    }

                    // Deal with the any train registrations
                    LOG(LOG_TRACK_CLIENTS, "%d", data->num_sendown_tids[TRAIN_MAX]);
                    for (client = 0; client < data->num_sendown_tids[TRAIN_MAX]; ++client)
                        Reply(data->num_sendown_tids[client], (char*)&reply, sizeof(reply));
                    data->num_sendown_tids[TRAIN_MAX] = 0;

                    LOG(LOG_TRACK_CLIENTS, "%d", data->num_sendown_clients[TRAIN_MAX]);
                    for (client = 0; client < data->num_sendown_clients[TRAIN_MAX]; ++client)
                        async_send(data->sendown_clients[TRAIN_MAX][client], (char*)&message, sizeof(message));
                }
                mask >>= 1;
            }
        }

        // Ups
        delta = data->sensors[data->last_sensor] & ~sensor;
        if (delta) {
            int bit;
            int mask = 1 << 7;
            for (bit = 0; bit < 8; ++bit) {
                if (delta & mask) {
                    struct Sensor reply;
                    struct TrackServerMessage message;
                    int client, train;
                    reply.group = data->last_sensor / 2;
                    reply.id = bit;

                    if (data->last_sensor & 1)
                        reply.id += 8;

                    LOG(LOG_SENSOR_UP, "%c%d", S_PRINT(reply));

                    message.msgid = TRACK_MESSAGE_ID;
                    message.type = TSMT_SENSOR_UP;
                    message.data.sensor.sensor = reply;

                    train = saveSensorUnflip(&data->track, reply, Time(data->cid));
                    if (train >= 0)
                        train = data->track.realId[train];

                    message.data.sensor.train = train;

                    if (train >= 0) {
                        for (client = 0; client < data->num_senup_tids[train]; ++client)
                            Reply(data->senup_tids[train][client], (char*)&reply, sizeof(reply));
                        data->num_senup_tids[train] = 0;

                        for (client = 0; client < data->num_senup_clients[train]; ++client)
                            async_send(data->senup_clients[train][client], (char*)&message, sizeof(message));
                    }

                    // Deal with the any train registrations
                    for (client = 0; client < data->num_senup_tids[TRAIN_MAX]; ++client)
                        Reply(data->num_senup_tids[client], (char*)&reply, sizeof(reply));
                    data->num_senup_tids[TRAIN_MAX] = 0;

                    for (client = 0; client < data->num_senup_clients[TRAIN_MAX]; ++client)
                        async_send(data->senup_clients[TRAIN_MAX][client], (char*)&message, sizeof(message));
                }
                mask >>= 1;
            }
        }

        data->sensors[data->last_sensor] = sensor;
        return;
    }

    LOG(LOG_TRAIN_MSG, "%d sends %d", tid, msg->type);

    switch (msg->type) {
        case TM_REGISTER_DOWN: handleRegisterDown(data, tid, msg->datum); break;
        case TM_REGISTER_UP: handleRegisterUp(data, tid, msg->datum); break;
        case TM_REGISTER_SWITCH: handleRegisterSwitch(data, tid); break;
        case TM_UNREGISTER_DOWN: handleUnregisterDown(data, tid, msg->datum); break;
        case TM_UNREGISTER_UP: handleUnregisterUp(data, tid, msg->datum); break;
        case TM_UNREGISTER_SWITCH: handleUnregisterSwitch(data, tid); break;
        case TM_WAIT_DOWN: handleWaitDown(data, tid, msg->datum); break;
        case TM_WAIT_UP: handleWaitUp(data, tid, msg->datum); break;
        case TM_WAIT_SWITCH: handleWaitSwitch(data, tid); break;
        case TM_QUERY_SWITCH: handleQuerySwitch(data, tid, msg->datum); break;
        case TM_QUERY_SENSOR: handleQuerySensor(data, tid, msg->datum); break;
        case TM_QUERY_LAST_LOCATION: handleQueryLocation(data, tid, msg->datum); break;
        case TM_ADD_TRAIN: handleAddTrain(data, tid, msg->datum & 0xFF, msg->datum >> 8); break;
        case TM_NOTIFY_SWITCH:
            if (msg->datum < 0)
                handleNotifySwitch(data, tid, -msg->datum, 1);
            else
                handleNotifySwitch(data, tid, msg->datum, 0);
            break;
        default:
            ERROR("BAD TRACK SERVER MESSAGE.");
    }

    LOG(LOG_TRAIN_MSG, "%d's %d handled", tid, msg->type);
}

/*********************** Public space message wrappers: ***********************/
void registerForSensorDown(int tid, int train)
{
    struct Message msg;
    msg.datum = train;
    msg.type = TM_REGISTER_DOWN;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void registerForSensorUp(int tid, int train)
{
    struct Message msg;
    msg.datum = train;
    msg.type = TM_REGISTER_UP;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void registerForSwitch(int tid)
{
    struct Message msg;
    msg.datum = 0;
    msg.type = TM_REGISTER_SWITCH;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void unregisterForSensorDown(int tid, int train)
{
    struct Message msg;
    msg.datum = train;
    msg.type = TM_UNREGISTER_DOWN;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void unregisterForSensorUp(int tid, int train)
{
    struct Message msg;
    msg.datum = train;
    msg.type = TM_UNREGISTER_UP;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

void unregisterForSwitch(int tid)
{
    struct Message msg;
    msg.datum = 0;
    msg.type = TM_UNREGISTER_SWITCH;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

struct Sensor waitForSensorDown(int tid, int train)
{
    struct Message msg;
    struct Sensor rpl;
    msg.datum = train;
    msg.type = TM_WAIT_DOWN;
    Send(tid, (char*)&msg, sizeof(msg), (char*)&rpl, sizeof(rpl));
    return rpl;
}

struct Sensor waitForSensorUp(int tid, int train)
{
    struct Message msg;
    struct Sensor rpl;
    msg.datum = train;
    msg.type = TM_WAIT_UP;
    Send(tid, (char*)&msg, sizeof(msg), (char*)&rpl, sizeof(rpl));
    return rpl;
}

switch_state waitForSwitch(int tid)
{
    struct Message msg;
    switch_state rpl;
    msg.datum = 0;
    msg.type = TM_WAIT_SWITCH;
    Send(tid, (char*)&msg, sizeof(msg), (char*)&rpl, sizeof(rpl));
    return rpl;
}

int querySwitch(int tid, int sw)
{
    struct Message msg;
    char rpl;
    msg.datum = sw;
    msg.type = TM_QUERY_SWITCH;
    Send(tid, (char*)&msg, sizeof(msg), (char*)&rpl, sizeof(rpl));
    return (int)rpl;
}

void notifySwitch(int tid, int sw, int isCurved)
{
    struct Message msg;
    msg.datum = (isCurved ? -sw : sw);
    msg.type = TM_NOTIFY_SWITCH;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

int querySensor(int tid, struct Sensor sen)
{
	struct Message msg;
	char rpl;
	msg.datum = S_ID(sen);
	msg.type = TM_QUERY_SENSOR;
	Send(tid, (char*)&msg, sizeof(msg), (char*)&rpl, sizeof(rpl));
	return (int)rpl;
}

void insertTrain(int tid, int train, struct Sensor sensor)
{
    struct Message msg;
    msg.datum = S_ID(sensor) << 8 | train;
    msg.type = TM_ADD_TRAIN;
    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

struct Sensor lastKnownLocation(int tid, int train)
{
    struct Message msg;
    struct Sensor ret;
    msg.datum = train;
    msg.type = TM_QUERY_LAST_LOCATION;
    Send(tid, (char*)&msg, sizeof(msg), (char*)&ret, sizeof(ret));
    return ret;
}

MAKE_SERVER(track_server)
