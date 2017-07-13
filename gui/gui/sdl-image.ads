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
        Source : in Rectangle := (
            Top => 0.0, Left => 0.0, Width => 1.0, Height => 1.0);
        Destination : in Rectangle := (
            Top => 0.0, Left => 0.0, Width => 1.0, Height => 1.0);
        Rotation : in Interfaces.C.double := 0.0;
        Center : in Coordinate := (X => 0.5, Y => 0.5);
        VFlip : in Boolean := False;
        HFlip : in Boolean := False);

    procedure Draw_Raw (
        Img : in Image;
        Top_Left : in SDL.Coordinate);

end SDL.Image;
