#include "tasks.h"
#include "gui.h"

void conductor(void)
{
    int tid;
    struct GUIMessage msg;
    registerForMessages(WhoIs(GUI_SERVER_NAME));

    int clock = WhoIs("CLOCK");

    for (ever) {
        Receive(&tid, (char*)&msg, sizeof(msg));
        Reply(tid, 0, 0);

        switch (msg.type) {
            case GMT_QUIT:
                KQuit();
                break;
            case GMT_CURVE:
                dprintf("Curving %d\n\r", msg.data.switch_id);
                tput2(34, msg.data.switch_id);
                Delay(clock, 5);
                tputc(32);
                break;
            case GMT_STRAIGHT:
                dprintf("Straightening %d\n\r", msg.data.switch_id);
                tput2(33, msg.data.switch_id);
                Delay(clock, 5);
                tputc(32);
                break;
            case GMT_CMD:
                dprintf("Got command: %s\n\r", msg.data.cmd);
                if (msg.data.cmd[0] == 'q')
                    cputstr("die");
                break;
        }
    }
}
