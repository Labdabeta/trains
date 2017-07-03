#include "tasks.h"
#include "gui.h"

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
