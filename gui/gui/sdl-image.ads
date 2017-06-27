package SDL.Image is
    subtype SDL_Image is System.Address;
    type Image is
        record
            w : Sint32;
            h : Sint32;
            img : SDL_Image;
        end record;
    pragma Convention (C, Image);

    Null_Image : constant Image := (w => 0, h => 0, img => System.Null_Address);

    procedure Open (
        fname : in Interfaces.C.Strings.chars_ptr;
        img : out Image);
    pragma Import (C, Open, "open_image_sdl");

    procedure Free (
        img : in Image);
    pragma Import (C, Free, "free_image_sdl");

    procedure Draw (
        img : in Image;
        top : in Sint32;
        left : in Sint32;
        height : in Sint32;
        width : in Sint32);
    pragma Import (C, Draw, "draw_image_sdl");

    procedure Draw_Bounds (
        img : in Image;
        bounds : in SDL.Rectangle);

end SDL.Image;
