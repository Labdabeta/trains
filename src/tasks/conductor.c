#include "tasks.h"
#include "gui.h"
#if 0
void conductor(void)
{
    int tid;
    struct GUIMessage msg;
    registerForMessages(WhoIs(GUI_SERVER_NAME));

    for (ever) {
        Receive(&tid, (char*)&msg, sizeof(msg));
        Reply(tid, 0, 0);

        if (msg.type == GMT_QUIT)
            Exit();
    }
}
#endif

void tester(void)
{
    int tid;
    Receive(&tid, 0, 0);
    Reply(tid, 0, 0);
    Exit(); // oops
}

void conductor(void)
{
    int i;

    for (i = 0; i < 20; ++i) {
        int t = Create(2, tester);
        dprintf("1: %d\n\r", Send(t, 0, 0, 0, 0));
        dprintf("2: %d\n\r", Send(t, 0, 0, 0, 0));
    }

    dprintf("DONE!\n\r");
}
