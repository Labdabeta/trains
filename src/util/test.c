#include "trains/path_finder.h"
#include "trains/track.h"
#include "trains/reservation.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    struct Track tr;
    struct ReservationSystem res;
    struct Restrictions rest;
    struct RestrictedPath p;

    initTrackA(&tr);


    initReservation(&res);
    getRestrictions(&res, 70, &rest);

    findRestrictedPath(10, 20, &rest, &p);

    printf("%s\n", restrictedPathToString(&p));

    return 0;
}
