#include "trains/track.h"
#include "parse_command.h"
#include <stdio.h>
#include <stdlib.h>

#if 0
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
#endif

int main(int argc, char *argv[])
{
    struct Track tr;
    struct Command cmds[MAX_COMMAND_COUNT];
    int num_cmds;
    int time = 0;

    initTrackA(&tr);

    addTrain(&tr, 70, S_MAKE(A, 10));
    addTrain(&tr, 69, S_MAKE(C, 7));

    for (int i = 0; i < 100000; ++i) {
        int id = rand() % 80;
        struct Sensor sen = S_MID(id);
        printf("%d\n", saveSensorFlip(&tr, sen, i));
        saveSensorUnflip(&tr, sen, i);

        if (rand() % 3 == 0) {
            int sw = rand() % SWITCH_MAX;
            int c = rand() % 2;
            printf("%d %d", sw, c);
            saveSwitchFlip(&tr, sw, c);
        }
    }

    return 0;
}
