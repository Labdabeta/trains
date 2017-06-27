with SDL;
with SDL.Image;

package Buttons is
    type ButtonState is (NORMAL, HOVER, PRESSED);
    type Button is
        record
            bounds : SDL.Rectangle;
            message : SDL.Image.Image;
        end record;

    procedure Draw_Button (
        which : in Button);

    function Handle_Event (
        which : in Button;
        event : access SDL.Event)
        return Boolean;

end Buttons;
