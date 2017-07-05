#include "trains/path_finder.h"
#include <stdio.h>

void printPath(struct RestrictedPath *p)
{
    int i;
    printf("START\n");
    for (i = 0; i < p->length; ++i) {
        printf("\tSegment %d: \n"
               "\t\tDistance - %d mm\n"
               "\t\tDestination - %c%d\n"
               "\t\tSwitch Configuration - %x\n"
               "\t\tSwitch Mask - %x\n",
               i + 1,
               p->distances[i],
               p->sensors[i].group + 'A',
               p->sensors[i].id + 1,
               p->states[i],
               p->masks[i]);
    }
    printf("END\n");
}

int main(int argc, char *argv[])
{
    struct RestrictedPath p;
    struct Restrictions r;
    for (int i = 0; i < TRACK_MAX; ++i)
        r.isEnabled[i] = 1;
    r.isEnabled[0x2B] = 0;
    init_tracka();
    int dist = findRestrictedPath(20, 10, &r, &p);
    printf("Distance: %d\n", dist);
    printPath(&p);

    return 0;
}
