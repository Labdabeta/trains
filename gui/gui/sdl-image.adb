package body SDL.Image is
    procedure Draw_Bounds (
        Img : in Image;
        Bounds : in SDL.Rectangle) is
    begin
        Draw (
            Img => Img,
            Top => Sint32 (Float (Bounds.Top) *
                Float (SDL.Status.Window_Height)),
            Left => Sint32 (Float (Bounds.Left) *
                Float (SDL.Status.Window_Width)),
            Height => Sint32 (Float (Bounds.Height) * Float
                (SDL.Status.Window_Height)),
            Width => Sint32 (Float (Bounds.Width) * Float
                (SDL.Status.Window_Width)));
    end Draw_Bounds;
end SDL.Image;
