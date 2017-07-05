#ifndef C_SDL_IMAGE_H
#define C_SDL_IMAGE_H

struct SDLImage {
    int32_t w;
    int32_t h;
    void *img;
};

void open_image_sdl(const char *fname, struct SDLImage *img);
void free_image_sdl(const struct SDLImage *img);

void *open_font_sdl(const char *fname, int size);
void free_font_sdl(void *font);
/* Fast but aliased, blits fast. */
void render_text_aliased_sdl(void *font, const char *text, uint8_t r, uint8_t g, uint8_t b, struct SDLImage *img);
/* Slow but anti-aliased, blits fast. */
void render_text_background_sdl(void *font, const char *text, uint8_t fr, uint8_t fg, uint8_t fb, uint8_t br, uint8_t bg, uint8_t bb, struct SDLImage *img);
/* Slow but anti-aliased, blits slow. */
void render_text_nice_sdl(void *font, const char *text, uint8_t r, uint8_t g, uint8_t b, struct SDLImage *img);

void draw_image_sdl(const struct SDLImage *img,
                    int32_t stop, int32_t sleft, int32_t sheight, int32_t swidth,
                    int32_t top, int32_t left, int32_t height, int32_t width,
                    double angle, int32_t cx, int32_t cy,
                    int32_t vflip, int32_t hflip);

#endif /* C_SDL_IMAGE_H */
