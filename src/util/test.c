#include "trains/path_finder.h"
#include "trains/reservation.h"
#include <stdio.h>
#include <string.h>

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
}

int main(int argc, char *argv[])
{
    struct RestrictedPath p;
    struct Restrictions r;
    struct ReservationSystem reservations;

    init_tracka();

    initReservation(&reservations);

    //takeSpace(&reservations, SENSOR_SPACE(S_MAKE(C, 10), S_MAKE(B, 3)), 1);
    //takeSpace(&reservations, SWITCH_SPACE(5), 1);
    getRestrictions(&reservations, 0, &r);

    printRestrictions(&r);
    int max = 0;
    int tmax = 0;
    int tmax_src = -1;
    int tmax_dst = -1;
    for (int src = 0; src < 80; ++src) {
        for (int dst = 0; dst < 80; ++dst) {
            int dist = findRestrictedPath(src, dst, &r, &p);
            printf("%d -> %d: %d, %d\n", src, dst, p.length, p.trueLength);
            if (p.length > max) max = p.length;
            if (p.trueLength > tmax) {
                tmax = p.trueLength;
                tmax_src = src;
                tmax_dst = dst;
            }
        }
    }

    printf("MAX: %d\n", max);
    printf("TMAX: %d\n", tmax);

    (void)findRestrictedPath(tmax_src, tmax_dst, &r, &p);
    printPath(&p);
    return 0;
}
