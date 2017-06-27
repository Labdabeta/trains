package body SDL.Image is
    procedure Draw_Bounds (
        img : in Image;
        bounds : in SDL.Rectangle) is
    begin
        Draw (
            img => img,
            top => Sint32 (Float (bounds.top) * Float (SDL.Status.win_height)),
            left => Sint32 (Float (bounds.left) * Float (SDL.Status.win_width)),
            height => Sint32 (Float (bounds.height) * Float
                (SDL.Status.win_height)),
            width => Sint32 (Float (bounds.width) * Float
                (SDL.Status.win_width)));
    end Draw_Bounds;
end SDL.Image;
