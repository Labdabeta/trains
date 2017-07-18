#include "trains/track.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    struct Track t;
    int i;
    initTrackA(&t);

    addTrain(&t, 70, S_MAKE(B, 5));

    i = 1;
    for (;;) {
        char buf[256];
        scanf("%s", buf);
        if (buf[0] == 'q')
            return 0;
        struct Sensor sen = parseSensor(buf);
        printf("Train %d hit sensor %c%d\n", saveSensorFlip(&t, sen, i++), S_PRINT(sen));
    }
}
