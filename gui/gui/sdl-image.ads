package SDL.Image is
    subtype SDL_Image is System.Address;
    type Image is
        record
            W : Sint32;
            H : Sint32;
            Img : SDL_Image;
        end record;
    pragma Convention (C, Image);

    Null_Image : constant Image := (W => 0, H => 0, Img => System.Null_Address);

    procedure Open (
        Fname : in Interfaces.C.Strings.chars_ptr;
        Img : out Image);
    pragma Import (C, Open, "open_image_sdl");

    procedure Free (
        Img : in Image);
    pragma Import (C, Free, "free_image_sdl");

    procedure Draw (
        Img : in Image;
        Top : in Sint32;
        Left : in Sint32;
        Height : in Sint32;
        Width : in Sint32);
    pragma Import (C, Draw, "draw_image_sdl");

    procedure Draw_Bounds (
        Img : in Image;
        Bounds : in SDL.Rectangle);

end SDL.Image;
