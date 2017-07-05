#include "csdl.h"
#include "sdl_image.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL_mixer.h>

void open_image_sdl(const char *fname, struct SDLImage *img)
{
    SDL_Surface *sur;

    if (!(sur = IMG_Load(fname))) {
        error_popup_sdl("Image load failed!", IMG_GetError());
        // TODO: load an error image into img
    } else {
        img->w = sur->w;
        img->h = sur->h;
        img->img = SDL_CreateTextureFromSurface(renderer, sur);
        if (!img->img)
            error_popup_sdl("Image texturization failed!", SDL_GetError());

        SDL_FreeSurface(sur);
    }
}

void free_image_sdl(const struct SDLImage *img)
{
    SDL_DestroyTexture(img->img);
}

void *open_font_sdl(const char *fname, int size)
{
    return TTF_OpenFont(fname, size);
}

void render_text_aliased_sdl(
        void *font,
        const char *text,
        uint8_t r, uint8_t g, uint8_t b,
        struct SDLImage *img)
{
    SDL_Surface *sur;
    SDL_Color col = { r, g, b, 0xFF };

    if (!(sur = TTF_RenderText_Solid(font, text, col))) {
        error_popup_sdl("Text render failed!", TTF_GetError());
    } else {
        img->w = sur->w;
        img->h = sur->h;
        img->img = SDL_CreateTextureFromSurface(renderer, sur);

        SDL_FreeSurface(sur);
    }
}

void render_text_background_sdl(
        void *font,
        const char *text,
        uint8_t fr, uint8_t fg, uint8_t fb,
        uint8_t br, uint8_t bg, uint8_t bb,
        struct SDLImage *img)
{
    SDL_Surface *sur;
    SDL_Color f = { fr, fg, fb, 0xFF };
    SDL_Color b = { br, bg, bb, 0xFF };

    if (!(sur = TTF_RenderText_Shaded(font, text, f, b))) {
        error_popup_sdl("Text render failed!", TTF_GetError());
    } else {
        img->w = sur->w;
        img->h = sur->h;
        img->img = SDL_CreateTextureFromSurface(renderer, sur);

        SDL_FreeSurface(sur);
    }
}

void render_text_nice_sdl(
        void *font,
        const char *text,
        uint8_t r, uint8_t g, uint8_t b,
        struct SDLImage *img)
{
    SDL_Surface *sur;
    SDL_Color col = { r, g, b, 0xFF };

    if (!(sur = TTF_RenderText_Blended(font, text, col))) {
        error_popup_sdl("Text render failed!", TTF_GetError());
    } else {
        img->w = sur->w;
        img->h = sur->h;
        img->img = SDL_CreateTextureFromSurface(renderer, sur);

        SDL_FreeSurface(sur);
    }
}

void draw_image_sdl(const struct SDLImage *img,
                    int32_t stop, int32_t sleft, int32_t sheight, int32_t swidth,
                    int32_t top, int32_t left, int32_t height, int32_t width,
                    double angle, int32_t cx, int32_t cy,
                    int32_t vflip, int32_t hflip)
{
    SDL_Rect src, dst;
    SDL_Point center;
    src.x = sleft; src.y = stop; src.w = swidth; src.h = sheight;
    dst.x = left; dst.y = top; dst.w = width; dst.h = height;
    center.x = cx;
    center.y = cy;
    if (SDL_RenderCopyEx(renderer, img->img, &src, &dst, angle, &center,
                (vflip ? SDL_FLIP_VERTICAL : 0) |
                (hflip ? SDL_FLIP_HORIZONTAL : 0)))
        error_popup_sdl("Render copy failed!", SDL_GetError());
}
