#include "tasks.h"
#include "sensors.h"

void hello()
{
    // Connect to the UI
    cputc(2);

    registerForSensorFlips(WhoIs("SENSOR"));
    char msg[4] = {0};
    msg[3] = 0; // just to be sure

    for (ever) {
        int sensor, tid, num;
        Receive(&tid, (char*)&sensor, sizeof(sensor));
        Reply(tid, 0, 0);
        dprintf("Got: %d\n\r", sensor);
        msg[0] = 's';
        if (sensor < 0) {
            sensor = -sensor;
            msg[0] = 'S';
        }
        toGroupNumber(sensor, &msg[1], &num);
        msg[2] = (num < 10 ? '0' + num : 'a' + num - 10);
        dprintf("Sending: %s\n\r", msg);
        cputstr(msg);
    }
}
