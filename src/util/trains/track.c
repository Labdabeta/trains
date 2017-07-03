#include "trains/track.h"

#define TICKS_PER_SEC 100

static void initTrack(struct Track *track)
{
    int i;

    for (i = 0; i < TRAIN_MAX; ++i) {
        track->lastLocation[i] = S_NONE;
        track->nextLocation[i][0] = S_NONE;
        track->nextLocation[i][1] = S_NONE;
        track->lastRegister[i] = -1;
        track->realId[i] = -1;
        track->speed[i] = 0;
        track->isData[i] = 0;
        // TODO: give these sensible defaults
        track->velocity[i][0] = 0;
        track->velocity[i][1] = 0;
        track->velocity[i][2] = 0;
        track->velocity[i][3] = 0;
        track->velocity[i][4] = 0;
        track->velocity[i][5] = 0;
        track->velocity[i][6] = 0;
        track->velocity[i][7] = 0;
        track->velocity[i][8] = 0;
        track->velocity[i][9] = 0;
        track->velocity[i][10] = 0;
        track->velocity[i][11] = 0;
        track->velocity[i][12] = 0;
        track->velocity[i][13] = 0;
        track->velocity[i][14] = 0;
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

    if (track->isData[train]) {
        // TODO: do this more gently
        track->velocity[train][track->speed[train]] = duration / distance;
        track->lastLocation[train] = track->nextLocation[train][0];
        track->nextLocation[train][0] = getNextLocation(track, track->lastLocation[train]);
        track->nextLocation[train][1] = track->nextLocation[train][0];
        track->lastRegister[train] = time;
    } else {
        // TODO: maybe deal with this more gently too?
        track->isData[train] = 1;
    }
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
    int i;

    for (i = 0; i < TRAIN_MAX; ++i) {
        if (S_EQUAL(track->nextLocation[i][0], sensor)) {
            doSensorHit(track, i, time);
            return i;
        } else if (S_EQUAL(track->nextLocation[i][1], sensor)) {
            track->nextLocation[i][0] = track->nextLocation[i][1];
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

void saveSpeedChange(struct Track *track, int train, int speed, int time)
{
    track->speed[train] = speed;
    track->whenSpeed[train] = time;
    track->isData[train] = 0;
}

struct Position getTrainPosition(const struct Track *track, int train, int time)
{
    struct Position ret;

    ret.lastSensor = track->lastLocation[train];
    // TODO: do this more gently
    int dtime = time - track->lastRegister[train];
    ret.distanceFromLast = (track->velocity[train][track->speed[train]] * dtime) / TICKS_PER_SEC;
    ret.nextSensor[0] = track->nextLocation[train][0];
    ret.nextSensor[1] = track->nextLocation[train][1];

    return ret;
}

int getTrainVelocity(const struct Track *track, int train, int time)
{
    (void)time; // unused for now

    return track->velocity[train][track->speed[train]];
}
