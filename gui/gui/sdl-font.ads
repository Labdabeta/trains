with SDL.Image;

package SDL.Font is
    subtype SDL_Font is System.Address;

    function Open (
        fname : in Interfaces.C.Strings.chars_ptr;
        size : in Interfaces.C.int)
        return SDL_Font;
    pragma Import (C, Open, "open_font_sdl");

    procedure Free (fnt : in SDL_Font);
    pragma Import (C, Free, "free_font_sdl");

    procedure RenderFast (
        fnt : in SDL_Font;
        text : in Interfaces.C.Strings.chars_ptr;
        red : in Uint8;
        green : in Uint8;
        blue : in Uint8;
        img : out SDL.Image.Image);
    pragma Import (C, RenderFast, "render_text_aliased_sdl");

    procedure RenderAntialiased (
        fnt : in SDL_Font;
        text : in Interfaces.C.Strings.chars_ptr;
        foreground_red : in Uint8;
        foreground_green : in Uint8;
        foreground_blue : in Uint8;
        background_red : in Uint8;
        background_green : in Uint8;
        background_blue : in Uint8;
        img : out SDL.Image.Image);
    pragma Import (C, RenderAntialiased, "render_text_background_sdl");

    procedure RenderNice (
        fnt : in SDL_Font;
        text : in Interfaces.C.Strings.chars_ptr;
        red : in Uint8;
        green : in Uint8;
        blue : in Uint8;
        img : out SDL.Image.Image);
    pragma Import (C, RenderNice, "render_text_nice_sdl");

end SDL.Font;
