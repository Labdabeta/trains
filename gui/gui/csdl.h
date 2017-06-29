#ifndef C_SDL_H
#define C_SDL_H

#include <stdint.h>
#include <SDL2/SDL.h>

/* Keycodes, determined from SDL_keycode.h */
typedef enum Key {
    KEY_ANY = 0, KEY_UNKNOWN = 0, KEY_RETURN = '\r', KEY_ESCAPE = '\033',
    KEY_BACKSPACE = '\b', KEY_TAB = '\t', KEY_SPACE = ' ', KEY_EXCLAIM = '!',
    KEY_QUOTEDBL = '"', KEY_HASH = '#', KEY_PERCENT = '%', KEY_DOLLAR = '$',
    KEY_AMPERSAND = '&', KEY_QUOTE = '\'', KEY_LEFTPAREN = '(',
    KEY_RIGHTPAREN = ')', KEY_ASTERISK = '*', KEY_PLUS = '+', KEY_COMMA = ',',
    KEY_MINUS = '-', KEY_PERIOD = '.', KEY_SLASH = '/', KEY_0 = '0',
    KEY_1 = '1', KEY_2 = '2', KEY_3 = '3', KEY_4 = '4', KEY_5 = '5',
    KEY_6 = '6', KEY_7 = '7', KEY_8 = '8', KEY_9 = '9', KEY_COLON = ':',
    KEY_SEMICOLON = ';', KEY_LESS = '<', KEY_EQUALS = '=', KEY_GREATER = '>',
    KEY_QUESTION = '?', KEY_AT = '@', KEY_LEFTBRACKET = '[',
    KEY_BACKSLASH = '\\', KEY_RIGHTBRACKET = ']', KEY_CARET = '^',
    KEY_UNDERSCORE = '_', KEY_BACKQUOTE = '`', KEY_a = 'a', KEY_b = 'b',
    KEY_c = 'c', KEY_d = 'd', KEY_e = 'e', KEY_f = 'f', KEY_g = 'g',
    KEY_h = 'h', KEY_i = 'i', KEY_j = 'j', KEY_k = 'k', KEY_l = 'l',
    KEY_m = 'm', KEY_n = 'n', KEY_o = 'o', KEY_p = 'p', KEY_q = 'q',
    KEY_r = 'r', KEY_s = 's', KEY_t = 't', KEY_u = 'u', KEY_v = 'v',
    KEY_w = 'w', KEY_x = 'x', KEY_y = 'y', KEY_z = 'z', KEY_DELETE = '\177'
} Key;

struct SDLStatus {
    int mouse_x;
    int mouse_y;
    int mouse_left;
    int mouse_right;
    int mouse_middle;
    int win_width;
    int win_height;
    int keys[256];
};

extern struct SDLStatus status;
extern SDL_Window *window;
extern SDL_Renderer *renderer;

enum EventType {
    NONE = 0, QUIT = 1, KEYDOWN = 2, KEYUP = 3, MOUSEMOVE = 4,
    MOUSEDOWN = 5, MOUSEUP = 6, WHEELMOVE = 7, UNKNOWN = 8
};

enum Button {
    MOUSE_LEFT = 1,
    MOUSE_MIDDLE = 2,
    MOUSE_RIGHT = 3,
    MOUSE_UNKNOWN = 4
};

struct SDLEvent {
    enum EventType t;
    uint32_t timestamp;
    enum Key k;
    enum Button b;
    int32_t dx;
    int32_t dy;
};

void poll_event_sdl(struct SDLEvent *event);
void open_window_sdl(int width, int height, const char *title);
void close_window_sdl(void);

/* Returns NULL, or an error message. */
const char *initialize_sdl(void);
void finalize_sdl(void);

void error_popup_sdl(const char *title, const char *message);
void warning_popup_sdl(const char *title, const char *message);
void info_popup_sdl(const char *title, const char *message);

void render_clear_sdl(void);
void render_present_sdl(void);

uint32_t get_ticks_sdl(void);
void delay_sdl(uint32_t delay);

#endif /* C_SDL_H */
