#include "hotel.h"
#include <server.h>
#include "gui.h"
#include "logging.h"

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
    HSM_FREEALL,
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

void printRestrictions(struct Restrictions *r)
{
    int i;
    printf("Enabled:\t");
    for (i = 0; i < TRACK_MAX; ++i) {
        if (r->isEnabled[i])
            printf("%s ", track_nodes[i].name);
    }
    printf("\nDisabled:\t");
    for (i = 0; i < TRACK_MAX; ++i) {
        if (!r->isEnabled[i])
            printf("%s ", track_nodes[i].name);
    }
    printf("\n");
}

ENTRY initialize(struct Data *data)
{
    initReservation(&data->reservations);
    data->num_waiters = 0;

    RegisterAs(RESERVATION_SERVER_NAME);
}

ENTRY handle(struct Data *data, int tid, struct Message *msg, int msg_size)
{
    int reply;
    int i;

    //LOG(LOG_HOTEL, "%d sends %d", tid, msg->type);

    switch (msg->type) {
        case HSM_QUERY:
            reply = whoOwnsSpace(&data->reservations, msg->data.space);
            LOG(LOG_HOTEL, "%d owns %s", reply, spaceToString(msg->data.space));
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_REQUEST:
            reply = reserveSpace(&data->reservations, msg->data.space, msg->train);
            LOG(LOG_HOTEL, "%d wants %s - %d", msg->train, spaceToString(msg->data.space), reply);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_STEAL:
            reply = takeSpace(&data->reservations, msg->data.space, msg->train);
            LOG(LOG_HOTEL, "%d took %s from %d", msg->train, spaceToString(msg->data.space), reply);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_FREE:
            clearSpace(&data->reservations, msg->data.space, msg->train);
            LOG(LOG_HOTEL, "%s cleared by %d", spaceToString(msg->data.space), msg->train);
            if (!whoOwnsSpace(&data->reservations, msg->data.space)) {
                for (i = 0; i < data->num_waiters; ++i)
                    Reply(data->waiters[i], (char*)&msg->data.space, sizeof(msg->data.space));
                data->num_waiters = 0;
            }
            Reply(tid, 0, 0);
            break;
        case HSM_FREEALL:
            clearAll(&data->reservations, msg->train);
            LOG(LOG_HOTEL, "%d cleared", msg->train);
#error TODO: FINISH IT!
        case HSM_GET_PATH:
            getRestrictions(&data->reservations, msg->train, &data->restrictions);
            printRestrictions(&data->restrictions);
            reply = findRestrictedPath(S_ID(msg->data.pair.src), S_ID(msg->data.pair.dst), &data->restrictions, msg->data.pair.path);
            LOG(LOG_HOTEL, "%d's path from %c%d to %c%d is %dmm long", msg->train, S_PRINT(msg->data.pair.src), S_PRINT(msg->data.pair.dst), reply);
            Reply(tid, (char*)&reply, sizeof(reply));
            break;
        case HSM_WAIT:
            data->waiters[data->num_waiters++] = tid;
            LOG(LOG_HOTEL, "%d is waiting", tid);
            break;
        default:
            ERROR("BAD HOTEL SERVER MESSAGE.");
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
