#include "hotel.h"
#include <server.h>

#define MAX_WAITING_CLIENTS 0x10

struct Data {
    int waiters[MAX_WAITING_CLIENTS];
    int num_waiters;

    struct ReservationSystem reservations;
    struct Restrictions restrictions;
};

enum HotelServerMessage {
    HSM_QUERY,
    HSM_REQUEST,
    HSM_STEAL,
    HSM_FREE,
    HSM_GET_PATH,
    HSM_WAIT
};

struct Message {
    enum HotelServerMessage type;
    int train;
    union {
        struct TrackSpace space;
        struct {
            struct Sensor src;
            struct Sensor dst;
            struct RestrictedPath *path;
        } pair;
    } data;
};

ENTRY initialize(struct Data *data)
{
    initReservation(&data->reservations);
    data->num_waiters = 0;
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    int reply;
    int i;
    switch (msg->type) {
        case HSM_QUERY:
            reply = whoOwnsSpace(&data->reservations, msg->data.space);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_REQUEST:
            reply = reserveSpace(&data->reservations, msg->data.space, msg->train);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_STEAL:
            reply = takeSpace(&data->reservations, msg->data.space, msg->train);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_FREE:
            clearSpace(&data->reservations, msg->data.space, msg->train);
            if (!whoOwnsSpace(&data->reservations, msg->data.space)) {
                for (i = 0; i < data->num_waiters; ++i)
                    Reply(data->waiters[i], (char*)&msg->data.space, sizeof(msg->data.space));
                data->num_waiters = 0;
            }
            Reply(tid, 0, 0);
            break;
        case HSM_GET_PATH:
            getRestrictions(&data->reservations, msg->train, &data->restrictions);
            reply = findRestrictedPath(S_ID(msg->data.pair.src), S_ID(msg->data.pair.dst), &data->restrictions, msg->data.pair.path);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_WAIT:
            data->waiters[data->num_waiters++] = tid;
            break;
    }
}

int queryOwner(int tid, struct TrackSpace space)
{
    struct Message msg;
    int reply;
    msg.type = HSM_QUERY;
    msg.data.space = space;

    Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
    return reply;
}

int requestSpace(int tid, struct TrackSpace space, int train)
{
    struct Message msg;
    int reply;
    msg.type = HSM_REQUEST;
    msg.train = train;
    msg.data.space = space;

    Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
    return reply;
}

int stealSpace(int tid, struct TrackSpace space, int train)
{
    struct Message msg;
    int reply;
    msg.type = HSM_STEAL;
    msg.train = train;
    msg.data.space = space;

    Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
    return reply;
}

void freeSpace(int tid, struct TrackSpace space, int train)
{
    struct Message msg;
    msg.type = HSM_FREE;
    msg.train = train;
    msg.data.space = space;

    Send(tid, (char*)&msg, sizeof(msg), 0, 0);
}

int getFreePath(int tid, int train, struct Sensor src, struct Sensor dst, struct RestrictedPath *path)
{
    struct Message msg;
    int reply;
    msg.type = HSM_GET_PATH;
    msg.train = train;
    msg.data.pair.src = src;
    msg.data.pair.dst = dst;
    msg.data.pair.path = path;

    Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
    return reply;
}

struct TrackSpace waitForAvailability(int tid)
{
    struct Message msg;
    struct TrackSpace reply;
    msg.type = HSM_WAIT;

    Send(tid, (char*)&msg, sizeof(msg), (char*)&reply, sizeof(reply));
    return reply;
}

MAKE_SERVER(hotel)
