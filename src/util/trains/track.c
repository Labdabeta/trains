#include "trains/track.h"

#define TICKS_PER_SEC 100
#define MAX_NUM_DEAD 5

static void initTrack(struct Track *track)
{
    int i;

    for (i = 0; i < TRAIN_MAX; ++i) {
        track->lastLocation[i] = S_NONE;
        track->nextLocation[i][0] = S_NONE;
        track->nextLocation[i][1] = S_NONE;
        track->lastRegister[i] = -1;
        track->realId[i] = -1;
    }

    track->switches = SWITCH_STATE_CURVED;
}

// Assumes the desired train's next location has not yet been set any existing
// copy causes a S_NONE return
static struct Sensor getNextLocation(struct Track *track, struct Sensor location)
{
    int i;
    struct Sensor ret = getNextSensor(location, track->switches);

    // Search to see if there is already a train heading to that sensor.
    for (i = 0; i < TRAIN_MAX; ++i) {
        if (S_EQUAL(track->nextLocation[i][0], ret) ||
            S_EQUAL(track->nextLocation[i][1], ret))
            return S_NONE;
    }

    return ret;
}

static void doSensorHit(struct Track *track, int train, int time)
{
    int distance = getDistanceToNext(track->lastLocation[train], track->switches);
    int duration = time - track->lastRegister[train];

    track->lastLocation[train] = track->nextLocation[train][0];
    track->nextLocation[train][0] = getNextLocation(track, track->lastLocation[train]);
    track->nextLocation[train][1] = track->nextLocation[train][0];
    track->lastRegister[train] = time;
}

void initTrackA(struct Track *track)
{
    init_tracka();
    setSensorTrack(1);
    initTrack(track);
}

void initTrackB(struct Track *track)
{
    init_trackb();
    setSensorTrack(0);
    initTrack(track);
}

int addTrain(struct Track *track, int id, struct Sensor location)
{
    int i = 0;

    while (track->realId[i] < 0) ++i;

    track->realId[i] = id;
    track->lastLocation[i] = location;
    track->nextLocation[i][0] = getNextLocation(track, location);
    track->nextLocation[i][1] = track->nextLocation[i][0];

    return i;
}

int saveSensorFlip(struct Track *track, struct Sensor sensor, int time)
{
    int num_dead;
    int i;

    for (num_dead = 0; num_dead < MAX_NUM_DEAD; ++num_dead) {
        for (i = 0; i < TRAIN_MAX; ++i) {
            struct Sensor checks[2];
            int x;
            checks[0] = track->nextLocation[i][0];
            checks[1] = track->nextLocation[i][1];

            for (x = 0; x < num_dead; ++x) {
                checks[0] = getNextSensor(checks[0], track->switches);
                checks[1] = getNextSensor(checks[1], track->switches);
            }

            if (S_EQUAL(track->nextLocation[i][0], sensor)) {
                doSensorHit(track, i, time);
                return i;
            } else if (S_EQUAL(track->nextLocation[i][1], sensor)) {
                track->nextLocation[i][0] = track->nextLocation[i][1];
                doSensorHit(track, i, time);
                return i;
            }
        }
    }

    return -1;
}

int saveSensorUnflip(struct Track *track, struct Sensor sensor, int time)
{
    int i;

    for (i = 0; i < TRAIN_MAX; ++i) {
        if (S_EQUAL(track->lastLocation[i], sensor)) {
            track->lastRegister[i] = time;
            return i;
        }
    }

    return -1;
}

void saveSwitchFlip(struct Track *track, int sw, int isCurved)
{
    int i;
    if (isCurved)
        SET_CURVED(track->switches, sw);
    else
        SET_STRAIGHT(track->switches, sw);

    for (i = 0; i < TRAIN_MAX; ++i) {
        track->nextLocation[i][0] = getNextSensor(track->nextLocation[i][0], track->switches);
        track->nextLocation[i][1] = getNextSensor(track->nextLocation[i][1], track->switches);
    }
}
