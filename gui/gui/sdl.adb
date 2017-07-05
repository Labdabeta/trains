package body SDL is
    function Get_Mouse_X return Dimension is
    begin
        if Status.Mouse_X >= 0 and Status.Mouse_X <= Status.Window_Width then
            return Dimension (Float (Status.Mouse_X) /
                Float (Status.Window_Width));
        end if;
        return 0.0;
    end Get_Mouse_X;

    function Get_Mouse_Y return Dimension is
    begin
        if Status.Mouse_Y >= 0 and Status.Mouse_Y <= Status.Window_Height then
            return Dimension (Float (Status.Mouse_Y) /
                Float (Status.Window_Height));
        end if;
        return 0.0;
    end Get_Mouse_Y;

    function Within (
        Point : Coordinate;
        Space : Rectangle) return Boolean is
    begin
        if
            Point.X > Space.Left and
            Point.X < Space.Left + Space.Width and
            Point.Y > Space.Top and
            Point.Y < Space.Top + Space.Height
        then
            return True;
        else
            return False;
        end if;
    end Within;
end SDL;
