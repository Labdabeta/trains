#include "trains/reservation.h"

#ifdef REMOTE
#include <stdio.h>
#else
#include "tasks.h"
#endif

void initReservation(struct ReservationSystem *r)
{
    int i;
    for (i = 0; i < TRACK_MAX; ++i)
        r->whoOwns[i] = 0;
}

int reserveSpace(struct ReservationSystem *r, struct TrackSpace space, int train)
{
    printf("START %s\n\r", __func__);
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        int owner = r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
        if (owner && owner != train) {
    printf("END %s\n\r", __func__);
            return owner;
        }
        r->whoOwns[80 + (space.space.sw << 1)] = train;
        r->whoOwns[80 + (space.space.sw << 1) + 1] = train;
    printf("END %s\n\r", __func__);
        return 0;
    } else {
        // Claim forward and reverse versions of both sensors
        int owner = r->whoOwns[S_ID(space.space.inter.src)] |
                    r->whoOwns[S_ID(space.space.inter.dst)] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
        if (owner && owner != train) {
    printf("END %s\n\r", __func__);
            return owner;
        }
        r->whoOwns[S_ID(space.space.inter.src)] = train;
        r->whoOwns[S_ID(space.space.inter.dst)] = train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = train;
    printf("END %s\n\r", __func__);
        return 0;
    }
}

void clearSpace(struct ReservationSystem *r, struct TrackSpace space, int train)
{
    printf("START %s\n\r", __func__);
    if (space.isSwitch) {
        if (r->whoOwns[80 + (space.space.sw << 1)] == train) r->whoOwns[80 + (space.space.sw << 1)] = 0;
        if (r->whoOwns[80 + (space.space.sw << 1) + 1] == train) r->whoOwns[80 + (space.space.sw << 1) + 1] = 0;
    } else {
        if (r->whoOwns[S_ID(space.space.inter.src)] == train) r->whoOwns[S_ID(space.space.inter.src)] = 0;
        if (r->whoOwns[S_ID(space.space.inter.dst)] == train) r->whoOwns[S_ID(space.space.inter.dst)] = 0;
        if (r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] == train) r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = 0;
        if (r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] == train) r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = 0;
    }
    printf("END %s\n\r", __func__);
}

int takeSpace(struct ReservationSystem *r, struct TrackSpace space, int train)
{
    printf("START %s\n\r", __func__);
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        int owner = r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
        r->whoOwns[80 + (space.space.sw << 1)] = train;
        r->whoOwns[80 + (space.space.sw << 1) + 1] = train;
    printf("END %s\n\r", __func__);
        return owner;
    } else {
        // Claim forward and reverse versions of both sensors
        int owner = r->whoOwns[S_ID(space.space.inter.src)] |
                    r->whoOwns[S_ID(space.space.inter.dst)] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
                    r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
        r->whoOwns[S_ID(space.space.inter.src)] = train;
        r->whoOwns[S_ID(space.space.inter.dst)] = train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] = train;
        r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))] = train;
    printf("END %s\n\r", __func__);
        return owner;
    }
}

int whoOwnsSpace(struct ReservationSystem *r, struct TrackSpace space)
{
    printf("START %s\n\r", __func__);
    printf("END %s\n\r", __func__);
    if (space.isSwitch) {
        // Claim in and out versions of the switch (80 + 2sw and 80 + 2sw + 1)
        return r->whoOwns[80 + (space.space.sw << 1)] | r->whoOwns[80 + (space.space.sw << 1) + 1];
    } else {
        // Claim forward and reverse versions of both sensors
        return r->whoOwns[S_ID(space.space.inter.src)] |
               r->whoOwns[S_ID(space.space.inter.dst)] |
               r->whoOwns[S_ID(getReverseSensor(space.space.inter.src))] |
               r->whoOwns[S_ID(getReverseSensor(space.space.inter.dst))];
    }
}

void getRestrictions(struct ReservationSystem *r, int train, struct Restrictions *rest)
{
    printf("START %s\n\r", __func__);
    int i;
    if (train >= 0) {
        // Specific train
        int mask = train;
        for (i = 0; i < TRACK_MAX; ++i)
            rest->isEnabled[i] = !(r->whoOwns[i] & ~mask);
    } else {
        // any train
        for (i = 0; i < TRACK_MAX; ++i)
            rest->isEnabled[i] = !r->whoOwns[i];
    }
    printf("END %s\n\r", __func__);
}

static char s2sbuf[100];
char *spaceToString(struct TrackSpace sp)
{
    if (sp.isSwitch) {
        sprintf(s2sbuf, "SWITCH_SPACE(%d)", sp.space.sw);
    } else {
        sprintf(s2sbuf, "SENSOR_SPACE(parseSensor(\"%c%d\"),parseSensor(\"%c%d\"))", S_PRINT(sp.space.inter.src), S_PRINT(sp.space.inter.dst));
    }
    return s2sbuf;
}
