#ifndef GUI_H
#define GUI_H

#define GUI_SERVER_NAME "GUI"

typedef enum GUIMessageType {
    GMT_QUIT
} GUIMessageType;

struct GUIMessage {
    GUIMessageType type;
};

void registerForMessages(int tid);

#endif /* GUI_H */
