with Assets; use Assets;
with SDL; use SDL;
with SDL.Image; use SDL.Image;

package body Buttons is

    Resources : array (ButtonState) of Sprite_Name := (
        NORMAL => Button_Normal,
        HOVER => Button_Hover,
        PRESSED => Button_Pressed);

    procedure Draw_Button (
        which : in Button) is
        state : ButtonState;
        dimx, dimy : Dimension;
    begin
        dimx := Get_Mouse_X;
        dimy := Get_Mouse_Y;
        if
            dimx >= which.bounds.left and
            dimx <= which.bounds.left + which.bounds.width and
            dimy >= which.bounds.top and
            dimy <= which.bounds.top + which.bounds.height
        then
            if Status.mouse_left /= 0 then
                state := PRESSED;
            else
                state := HOVER;
            end if;
        else
            state := NORMAL;
        end if;

        SDL.Image.Draw_Bounds (
            img => Get_Sprite (Resources (state)),
            bounds => which.bounds);

        SDL.Image.Draw_Bounds (
            img => which.message,
            bounds => which.bounds);
    end Draw_Button;

    function Handle_Event (
        which : in Button;
        event : access SDL.Event)
        return Boolean is
        dimx, dimy : Dimension;
    begin
        dimx := Get_Mouse_X;
        dimy := Get_Mouse_Y;
        if
            event.t = SDL.MOUSEUP and
            dimx >= which.bounds.left and
            dimx <= which.bounds.left + which.bounds.width and
            dimy >= which.bounds.top and
            dimy <= which.bounds.top + which.bounds.height
        then
            return True;
        end if;
        return False;
    end Handle_Event;
end Buttons;
