package body SDL.Image is
    procedure CDraw (
        Img : in Image;
        Source_Top : in Sint32;
        Source_Left : in Sint32;
        Source_Height : in Sint32;
        Source_Width : in Sint32;
        Top : in Sint32;
        Left : in Sint32;
        Height : in Sint32;
        Width : in Sint32;
        Angle : in Interfaces.C.double;
        Center_X : in Sint32;
        Center_Y : in Sint32;
        VFlip : in Sint32;
        HFlip : in Sint32);
    pragma Import (C, CDraw, "draw_image_sdl");

    procedure Draw (
        Img : in Image;
        Source : in Rectangle := (
            Top => 0.0, Left => 0.0, Width => 1.0, Height => 1.0);
        Destination : in Rectangle := (
            Top => 0.0, Left => 0.0, Width => 1.0, Height => 1.0);
        Rotation : in Interfaces.C.double := 0.0;
        Center : in Coordinate := (X => 0.5, Y => 0.5);
        VFlip : in Boolean := False;
        HFlip : in Boolean := False) is
        VFlip_Value : Sint32;
        HFlip_Value : Sint32;
    begin
        if VFlip then
            VFlip_Value := 1;
        else
            VFlip_Value := 0;
        end if;

        if HFlip then
            HFlip_Value := 1;
        else
            HFlip_Value := 0;
        end if;

        CDraw (
            Img => Img,
            Source_Top => Sint32 (Float (Source.Top) * Float (Img.H)),
            Source_Left => Sint32 (Float (Source.Left) * Float (Img.W)),
            Source_Height => Sint32 (Float (Source.Height) * Float (Img.H)),
            Source_Width => Sint32 (Float (Source.Width) * Float (Img.W)),
            Top => Sint32 (Float (Destination.Top) *
                Float (SDL.Status.Window_Height)),
            Left => Sint32 (Float (Destination.Left) *
                Float (SDL.Status.Window_Width)),
            Height => Sint32 (Float (Destination.Height) * Float
                (SDL.Status.Window_Height)),
            Width => Sint32 (Float (Destination.Width) * Float
                (SDL.Status.Window_Width)),
            Angle => Rotation,
            Center_X => Sint32 (Float (Center.X) * Float (Img.W)),
            Center_Y => Sint32 (Float (Center.X) * Float (Img.H)),
            VFlip => VFlip_Value,
            HFlip => HFlip_Value);
    end Draw;

    procedure Draw_Raw (
        Img : in Image;
        Top_Left : in SDL.Coordinate) is
    begin
        CDraw (
            Img => Img,
            Source_Top => 0, Source_Left => 0,
            Source_Height => Img.H, Source_Width => Img.W,
            Top => Sint32 (Float (Top_Left.Y) *
                Float (SDL.Status.Window_Height)),
            Left => Sint32 (Float (Top_Left.X) *
                Float (SDL.Status.Window_Width)),
            Width => Img.W, Height => Img.H,
            Angle => 0.0, Center_X => 0, Center_Y => 0, VFlip => 0, HFlip => 0);
    end Draw_Raw;
end SDL.Image;
