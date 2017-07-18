#include "movement.h"
#include "track_server.h"
#include "tasks.h"
#include "trains/hotel.h"
#include "gui.h"
#include "util/async_delay.h"

static void setupSwitches(switch_state state, switch_state mask, int track)
{
    int i;
    for (i = 0; i < SWITCH_MAX; ++i) {
        if (IS_CURVED(mask, i))
            notifySwitch(track, i, IS_CURVED(state, i));
    }
}

static inline void printPath(struct RestrictedPath *p)
{
    int i;
    printf("START\n\r");
    for (i = 0; i < p->length; ++i) {
        printf("\tSegment %d: \n\r"
               "\t\tDistance - %d mm\n\r"
               "\t\tDestination - %c%d\n\r"
               "\t\tSwitch Configuration - %x\n\r"
               "\t\tSwitch Mask - %x\n\r",
               i + 1,
               p->distances[i],
               p->sensors[i].group + 'A',
               p->sensors[i].id + 1,
               p->states[i],
               p->masks[i]);
    }
    printf("END\n\r");
}

void movement_task(void)
{
    struct Movement move;
    struct TrackServerMessage tsm;
    int caller;
    int idx;
    int track_tid;
    int reservation_tid;
    int clock_tid;
    int train;

    dprintf("Making a movement...\n\r");

    int failure = 1;
    int success = 0;

    Receive(&caller, (char*)&move, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&reservation_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&track_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&clock_tid, sizeof(move));
    Reply(caller, 0, 0);

    Receive(&caller, (char*)&train, sizeof(move));
    // Replies with 0 = success or X = failure

    dprintf("Reserving a path for %d:\n\r", train);

    printPath(&move.path);

    // Reserve spaces
    for (idx = 1; idx < move.path.length; ++idx) {
        int i;
        if (requestSpace(reservation_tid,
            SENSOR_SPACE(move.path.sensors[idx-1],
                move.path.sensors[idx]), train)) {
            dprintf("Could not reserve: %c%d to %c%d.\n\r", S_PRINT(move.path.sensors[idx-1]), S_PRINT(move.path.sensors[idx]));
            Reply(caller, (char*)&failure, sizeof(failure));
            Exit();
        }
        for (i = 0; i < SWITCH_MAX; ++i) {
            if (IS_CURVED(move.path.masks[idx], i)) {
                if (requestSpace(reservation_tid, SWITCH_SPACE(i), train)) {
                    dprintf("Could not reserve switch %d\n\r", SW_ID_TO_NUM(i));
                    Reply(caller, (char*)&failure, sizeof(failure));
                    Exit();
                }
            }
        }
    }

    dprintf("Reservations made.\n\r");

    registerForSensorDown(track_tid, train);
    registerForSensorUp(track_tid, train);

    dprintf("Registered for train %d activity.\n\r", train);

    idx = 0;
    setupSwitches(move.path.states[0], move.path.masks[0], track_tid);
    setupSwitches(move.path.states[1], move.path.masks[1], track_tid);

    int speed = 2;
    dprintf("Setting train %d to speed %d.\n\r", train, speed);
    tput2(speed, train);
    while (idx < move.path.length) {
        int sender;
        int size = Receive(&sender, (char*)&tsm, sizeof(tsm));
        Reply(sender, 0, 0);

        if (size == 0) {
            // A message from the async delay
            dprintf("Stopping train %d.\n\r", train);
            tput2(16, train);
        } else if (tsm.type == TSMT_SENSOR_DOWN) {
            int old_idx = idx;
            int i;
            for (i = idx; i < move.path.length; ++i) {
                if (S_EQUAL(tsm.data.sensor.sensor, move.path.sensors[i])) {
                    idx = i;
                    break;
                }
            }

            if (idx == old_idx) {
                // Not on path, this is bad, abort
                unregisterForSensorDown(track_tid, train);
                unregisterForSensorUp(track_tid, train);
                display("Spurrious attribution of %c%s to train %d", S_PRINT(tsm.data.sensor.sensor), train);
                Reply(caller, (char*)&failure, sizeof(failure));
                Exit();
            } else {
                // Update to next segment of path
                setupSwitches(move.path.states[idx], move.path.masks[idx], track_tid);
                setupSwitches(move.path.states[idx+1], move.path.masks[idx+1], track_tid);

                // get ready to stop
                if (idx >= (move.path.length - move.stopIndex - 1))
                    async_delay(clock_tid, move.stopTime, 0, 0);
            }
        } else {
            if (move.isCaboose) {
                // idx is already set by the sen_down
                int index;
                for (index = 1; index < idx; ++index) {
                    int i;
                    freeSpace(reservation_tid,
                        SENSOR_SPACE(move.path.sensors[index-1],
                            move.path.sensors[index]), train);
                    for (i = 0; i < SWITCH_MAX; ++i) {
                        if (IS_CURVED(move.path.masks[index], i))
                            freeSpace(reservation_tid, SWITCH_SPACE(i), train);
                    }
                }
            }
        }
    }

    Reply(caller, (char*)success, sizeof(success));
    unregisterForSensorDown(track_tid, train);
    unregisterForSensorUp(track_tid, train);
    Exit();
}

int moveTrain(int train, struct Movement movement, int reservation_tid, int track_tid, int clock_tid)
{
    int reply;
    int mover = CreateSize(1, movement_task, TASK_SIZE_TINY);

    Send(mover, (char*)&movement, sizeof(movement), 0, 0);
    Send(mover, (char*)&reservation_tid, sizeof(reservation_tid), 0, 0);
    Send(mover, (char*)&track_tid, sizeof(track_tid), 0, 0);
    Send(mover, (char*)&clock_tid, sizeof(clock_tid), 0, 0);
    Send(mover, (char*)&train, sizeof(train), (char*)&reply, sizeof(reply));

    return reply;
}
