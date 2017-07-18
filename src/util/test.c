#include "trains/reservation.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    struct ReservationSystem r;
    initReservation(&r);

    printf("%d\n", reserveSpace(&r, SENSOR_SPACE(parseSensor("A8"),parseSensor("C7")), 76));
    printf("%d\n", reserveSpace(&r, SENSOR_SPACE(parseSensor("C7"),parseSensor("C3")), 76));
    printf("%d\n", reserveSpace(&r, SWITCH_SPACE(5), 76));
    printf("%d\n", reserveSpace(&r, SENSOR_SPACE(parseSensor("C3"),parseSensor("C4")), 76));
    printf("%d\n", reserveSpace(&r, SENSOR_SPACE(parseSensor("C4"),parseSensor("C6")), 76));
    printf("%d\n", reserveSpace(&r, SWITCH_SPACE(18), 76));
    printf("%d\n", reserveSpace(&r, SENSOR_SPACE(parseSensor("C6"),parseSensor("B15")), 76));

    printf("%d\n", whoOwnsSpace(&r, SENSOR_SPACE(S_MAKE(A, 8), S_MAKE(C, 7))));
    clearSpace(&r, SENSOR_SPACE(S_MAKE(A, 8), S_MAKE(C, 7)), 76);
    printf("%d\n", whoOwnsSpace(&r, SENSOR_SPACE(S_MAKE(A, 8), S_MAKE(C, 7))));

    return 0;
}
