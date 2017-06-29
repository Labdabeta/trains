with Interfaces.C;
with Interfaces.C.Strings;
with System;
with Ada.Characters.Latin_1;
with SDL_Keys;

package SDL is
    type Uint8 is mod 2**8;
    pragma Convention (C, Uint8);
    type Uint32 is mod 2**32;
    pragma Convention (C, Uint32);
    type Sint32 is range -2**31 .. 2**31 - 1;
    pragma Convention (C, Sint32);
    type Milliseconds is mod 2**32;
    pragma Convention (C, Milliseconds);
    type Mouse_Button is (MOUSE_LEFT, MOUSE_MIDDLE, MOUSE_RIGHT, MOUSE_UNKNOWN);
    for Mouse_Button use (
        MOUSE_LEFT => 1, MOUSE_MIDDLE => 2,
        MOUSE_RIGHT => 3, MOUSE_UNKNOWN => 4);
    pragma Convention (C, Mouse_Button);

    type Dimension is delta 0.001 range 0.0 .. 1.0;
    type Coordinate is
        record
            X, Y : Dimension;
        end record;

    type Rectangle is
        record
            Top, Left, Width, Height : Dimension;
        end record;

    type Event_Type is (
        NONE, QUIT, KEYDOWN, KEYUP, MOUSEMOVE, MOUSEDOWN, MOUSEUP, WHEELMOVE,
        UNKNOWN);
    for Event_Type use (
        NONE => 0, QUIT => 1, KEYDOWN => 2, KEYUP => 3, MOUSEMOVE => 4,
        MOUSEDOWN => 5, MOUSEUP => 6, WHEELMOVE => 7, UNKNOWN => 8);
    pragma Convention (C, Event_Type);

    type Event is
        record
            Kind : Event_Type;
            Timestamp : Milliseconds;
            Key : SDL_Keys.Key; --  Only for KEYUP/KEYDOWN
            Button : Mouse_Button;    --  Only for MOUSEUP/MOUSEDOWN
            Dx, Dy : Sint32;    --  Only for MOUSEMOVE/WHEELMOVE
        end record;
    pragma Convention (C, Event);

    type Key_State is array (SDL_Keys.Key range SDL_Keys.KEY_ANY ..
        SDL_Keys.KEY_DELETE) of aliased Interfaces.C.int;
    pragma Convention (C, Key_State);
    type Input_Status is
        record
            Mouse_X, Mouse_Y : aliased Sint32;
            Mouse_Left, Mouse_Right, Mouse_Middle : aliased Sint32;
            Window_Width, Window_Height : aliased Sint32;
            Keys : Key_State;
        end record;
    pragma Convention (C, Input_Status);

    Status : aliased Input_Status;
    pragma Import (C, Status, "status");

    function Get_Mouse_X return Dimension;
    function Get_Mouse_Y return Dimension;

    procedure Poll_Event (E : out Event);
    pragma Import (C, Poll_Event, "poll_event_sdl");

    procedure Open_Window (
        Width : in Interfaces.C.int;
        Height : in Interfaces.C.int;
        Title : in Interfaces.C.Strings.chars_ptr);
    pragma Import (C, Open_Window, "open_window_sdl");

    procedure Close_Window;
    pragma Import (C, Close_Window, "close_window_sdl");

    --  The popups will print to stdout/stderr if they fail on the C side
    procedure Error_Popup (
        Title : in Interfaces.C.Strings.chars_ptr;
        Message : in Interfaces.C.Strings.chars_ptr);
    pragma Import (C, Error_Popup, "error_popup_sdl");

    procedure Warning_Popup (
        Title : in Interfaces.C.Strings.chars_ptr;
        Message : in Interfaces.C.Strings.chars_ptr);
    pragma Import (C, Warning_Popup, "warning_popup_sdl");

    procedure Info_Popup (
        Title : in Interfaces.C.Strings.chars_ptr;
        Message : in Interfaces.C.Strings.chars_ptr);
    pragma Import (C, Info_Popup, "info_popup_sdl");

    function Initialize return Interfaces.C.Strings.chars_ptr;
    pragma Import (C, Initialize, "initialize_sdl");

    procedure Finalize;
    pragma Import (C, Finalize, "finalize_sdl");

    procedure Render_Clear;
    pragma Import (C, Render_Clear, "render_clear_sdl");

    procedure Render_Present;
    pragma Import (C, Render_Present, "render_present_sdl");

    function Get_Ticks return Uint32;
    pragma Import (C, Get_Ticks, "get_ticks_sdl");

    procedure Wait (Time : Uint32);
    pragma Import (C, Wait, "delay_sdl");
end SDL;
