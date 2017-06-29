#include <SDL/SDL.h>
#include <SDL/SDL_image.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
    SDL_Surface *sur;
    unsigned int *pixels;
    int *res;
    int w;
    int h;
    int x;
    int y;

    SDL_Init(SDL_INIT_EVERYTHING);
    if (IMG_Init(IMG_INIT_PNG) != IMG_INIT_PNG)
        return printf("Can't load IMG: %s\n", IMG_GetError());

    sur = IMG_Load(argv[1]);
    if (!sur)
        return printf("ERROR: %s\n", IMG_GetError());

    SDL_LockSurface(sur);

    w = sur->w;
    h = sur->h;
    res = malloc(sizeof(int) * w * h);
    pixels = (unsigned int*)sur->pixels;

    for (y = 0; y < h; ++y)
        for (x = 0; x < w; ++x)
            res[y * w + x] = !!(pixels[y * w + x] & sur->format->Amask);

    SDL_UnlockSurface(sur);
    SDL_FreeSurface(sur);

    printf("%s : array (1 .. %d, 1 .. %d) of Boolean := (", argv[1], h, w);
    for (y = 0; y < h; ++y) {
        int left = -1;
        int right = -1;
        printf("%d => (", y+1);
        for (x = 0; x < w; ++x) {
            if (res[y * w + x]) {
                if (left < 0)
                    left = right = x;
                else
                    right = x;
            } else {
                if (left >= 0) {
                    if (left == right)
                        printf("%d => True, ", left+1);
                    else
                        printf("%d .. %d => True, ", left+1, right+1);
                    left = -1;
                    right = -1;
                }
            }
        }
        printf("others => False), ");
    }
    printf("others => (others => False));\n");

    return 0;
}
