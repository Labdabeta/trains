#include "decoder.h"
#include "trains/track_server.h"
#include "tasks.h"

int decodeTrain(void)
{
    int track_tid = WhoIs(TRACK_SERVER_NAME);
    struct Sensor incoming = S_MAKE(C, 4);
    struct Sensor test;
    struct TrackServerMessage msg;

    registerForSensorDown(track_tid, -1);

    // set the train to come in when it hits our track
    tput2(14, 24);

    do {
        int caller;
        Receive(&caller, (char*)&msg, sizeof(msg));
        Reply(caller, 0, 0);

        test = msg.data.sensor.sensor;
        dprintf("%c%d hit\n\r", S_PRINT(test));
    } while (!S_EQUAL(test, incoming));

    // must be 24, bring it in
    tput2(28, 24);

    incoming = S_MAKE(C, 8);
    do {
        int caller;
        Receive(&caller, (char*)&msg, sizeof(msg));
        Reply(caller, 0, 0);

        test = msg.data.sensor.sensor;
        dprintf("%c%d hit\n\r", S_PRINT(test));
    } while (!S_EQUAL(test, incoming));

    // stop it
    tput2(0, 24);
    Delay(WhoIs("CLOCK"), 500);

    tput2(15, 24);
    Delay(WhoIs("CLOCK"), 1000);

    return 24;
}
