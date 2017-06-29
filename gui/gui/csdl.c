#include "csdl.h"
#include <stdio.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL_mixer.h>

struct SDLStatus status;

SDL_Window *window;
SDL_Renderer *renderer;

const char *initialize_sdl(void)
{
    if (SDL_Init(SDL_INIT_EVERYTHING))
        return SDL_GetError();
    if (IMG_Init(IMG_INIT_PNG) != IMG_INIT_PNG)
        return IMG_GetError();
    if (TTF_Init() < 0)
        return TTF_GetError();
    if (Mix_Init(MIX_INIT_MP3) != MIX_INIT_MP3 ||
        Mix_OpenAudio(MIX_DEFAULT_FREQUENCY,
                      MIX_DEFAULT_FORMAT,
                      MIX_DEFAULT_CHANNELS,
                      4096) < 0)
        return Mix_GetError();

    return NULL;
}

void finalize_sdl(void)
{
    Mix_CloseAudio();
    Mix_Quit();
    TTF_Quit();
    IMG_Quit();
    SDL_Quit();
}

void poll_event_sdl(struct SDLEvent *event)
{
    SDL_Event e;
    event->t = NONE;
    if (SDL_PollEvent(&e)) {
        switch (e.type) {
            case SDL_QUIT:
                event->t = QUIT;
                event->timestamp = e.quit.timestamp;
                break;
            case SDL_KEYDOWN:
                event->t = KEYDOWN;
                event->timestamp = e.key.timestamp;
                event->k = e.key.keysym.sym;
                if (e.key.keysym.sym >= 0 && e.key.keysym.sym < 256)
                    status.keys[e.key.keysym.sym] = 1;
                break;
            case SDL_KEYUP:
                event->t = KEYUP;
                event->timestamp = e.key.timestamp;
                event->k = e.key.keysym.sym;
                if (e.key.keysym.sym >= 0 && e.key.keysym.sym < 256)
                    status.keys[e.key.keysym.sym] = 0;
            case SDL_WINDOWEVENT:
                event->timestamp = e.window.timestamp;
                if (e.window.type == SDL_WINDOWEVENT_RESIZED) {
                    status.win_width = e.window.data1;
                    status.win_height = e.window.data2;
                }
                break;
            case SDL_MOUSEMOTION:
                event->t = MOUSEMOVE;
                event->timestamp = e.motion.timestamp;
                event->dx = e.motion.xrel;
                event->dy = e.motion.yrel;
                status.mouse_x = e.motion.x;
                status.mouse_y = e.motion.y;
                break;
            case SDL_MOUSEBUTTONDOWN:
                event->t = MOUSEDOWN;
                event->timestamp = e.button.timestamp;
                switch (e.button.button) {
                    case SDL_BUTTON_LEFT:
                        event->b = MOUSE_LEFT;
                        status.mouse_left = 1;
                        break;
                    case SDL_BUTTON_MIDDLE:
                        event->b = MOUSE_MIDDLE;
                        status.mouse_middle = 1;
                        break;
                    case SDL_BUTTON_RIGHT:
                        event->b = MOUSE_RIGHT;
                        status.mouse_right = 1;
                        break;
                    default: event->b = MOUSE_UNKNOWN;
                }
                status.mouse_x = e.button.x;
                status.mouse_y = e.button.y;
                break;
            case SDL_MOUSEBUTTONUP:
                event->t = MOUSEUP;
                event->timestamp = e.button.timestamp;
                switch (e.button.button) {
                    case SDL_BUTTON_LEFT:
                        event->b = MOUSE_LEFT;
                        status.mouse_left = 0;
                        break;
                    case SDL_BUTTON_MIDDLE:
                        event->b = MOUSE_MIDDLE;
                        status.mouse_middle = 0;
                        break;
                    case SDL_BUTTON_RIGHT:
                        event->b = MOUSE_RIGHT;
                        status.mouse_right = 0;
                        break;
                    default: event->b = MOUSE_UNKNOWN;
                }
                status.mouse_x = e.button.x;
                status.mouse_y = e.button.y;
                break;
            case SDL_MOUSEWHEEL:
                event->t = WHEELMOVE;
                event->timestamp = e.wheel.timestamp;
                event->dx = e.wheel.x;
                event->dy = e.wheel.y;
                break;
            default:
                event->timestamp = SDL_GetTicks();
        }
    }
}

void open_window_sdl(int width, int height, const char *title)
{
    window = SDL_CreateWindow(title, SDL_WINDOWPOS_UNDEFINED,
            SDL_WINDOWPOS_UNDEFINED, width, height, SDL_WINDOW_SHOWN);

    if (!window) {
        error_popup_sdl("Window creation failed!", SDL_GetError());
    }

    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    if (!renderer) {
        error_popup_sdl("Renderer creation failed!", SDL_GetError());
    }

    status.win_width = width;
    status.win_height = height;
}

void close_window_sdl(void)
{
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
}

void error_popup_sdl(const char *title, const char *message)
{
    if (SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, title, message, NULL))
        fprintf(stderr,"ERROR: %s - %s\n",title,message);
}

void warning_popup_sdl(const char *title, const char *message)
{
    if (SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_WARNING, title, message, NULL))
        fprintf(stdout,"Warning: %s - %s\n",title,message);
}

void info_popup_sdl(const char *title, const char *message)
{
    if (SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_INFORMATION, title, message, NULL))
        fprintf(stdout,"%s - %s\n",title,message);
}

void render_clear_sdl(void)
{
    SDL_RenderClear(renderer);
}

void render_present_sdl(void)
{
    SDL_RenderPresent(renderer);
}

