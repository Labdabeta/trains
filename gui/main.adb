with GNAT.Serial_Communications; use GNAT.Serial_Communications;
with SDL; use SDL;
with SDL.Image;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Com;
with Sensors;
with Switches;
with Input_Processor;

procedure Main is
    -- Our map is 1242 x 682
    Window_Width : constant := 1242;
    Window_Height : constant := 682;
    Ticks_Per_Frame : constant := 1000 / 60; -- 60 fps
    Init_Error : chars_ptr;
    Background : SDL.Image.Image;
    Quit : Boolean := False;
    Last_Ticks : SDL.Uint32;
    Current_Ticks : SDL.Uint32;
    E : SDL.Event;
    I : Integer;
    Init : Boolean := False;
begin
    if Ada.Command_Line.Argument_Count /= 3 then
        SDL.Error_Popup (
            Title => New_String ("Invalid arguments"),
            Message => New_String ("Please provide 3 arguments: " &
                "a load string, a window title, and a serial port number."));
        return;
    end if;

    Init_Error := SDL.Initialize;
    if Init_Error /= Null_Ptr then
        SDL.Error_Popup (
            Title => New_String ("Error Initializing SDL"),
            Message => Init_Error);
        return;
    end if;

    Init_Error := Com.Initialize (New_String (Ada.Command_Line.Argument (3)));
    if Init_Error /= Null_Ptr then
        SDL.Error_Popup (
            Title => New_String ("Error Initializing Com2"),
            Message => Init_Error);
        return;
    end if;

    SDL.Open_Window (
        Width => Window_Width,
        Height => Window_Height,
        Title => New_String (Ada.Command_Line.Argument (2)));

    SDL.Image.Open (
        Fname => New_String ("res/track_a.png"),
        Img => Background);

    -- Switches.Initialize;
    Sensors.Initialize;

    Last_Ticks := SDL.Get_Ticks;

    while not Quit loop
        loop
            SDL.Poll_Event (E => E);
            case E.Kind is
                when SDL.NONE => exit;
                when SDL.QUIT => Quit := True; exit;
                when SDL.KEYDOWN => null; -- TODO
                when SDL.KEYUP => null; -- TODO
                when SDL.MOUSEMOVE => null;
                when SDL.MOUSEDOWN => null;
                when SDL.MOUSEUP => Put_Line ("Mouse up at: (" &
                    SDL.Sint32'Image (SDL.Status.Mouse_X) & "," &
                    SDL.Sint32'Image (SDL.Status.Mouse_Y) & ")");
                when SDL.WHEELMOVE => null;
                when SDL.UNKNOWN => null;
            end case;
        end loop;

        loop
            I := Com.Getc;
            exit when I < 0;
            Input_Processor.Process (Character'Val (I));
        end loop;

        SDL.Render_Clear;
        SDL.Image.Draw (
            Img => Background,
            Top => 0,
            Left => 0,
            Height => SDL.Status.Window_Height,
            Width => SDL.Status.Window_Width);
        Sensors.Draw;
        SDL.Render_Present;

        Current_Ticks := SDL.Get_Ticks - Last_Ticks;
        Last_Ticks := SDL.Get_Ticks;
        if Current_Ticks < Ticks_Per_Frame then
            SDL.Wait (Ticks_Per_Frame - Current_Ticks);
        end if;
    end loop;

    Com.Putc ('Q');

    Init_Error := Com.Finalize;
    if Init_Error /= Null_Ptr then
        SDL.Error_Popup (
            Title => New_String ("Error Finalizing Com2"),
            Message => Init_Error);
        return;
    end if;

    -- Switches.Finalize;
    Sensors.Finalize;
    SDL.Finalize;

    exception
        when Serial_Error =>
            SDL.Error_Popup (
                Title => New_String ("COM Error"),
                Message =>
                    New_String ("Could not open port 1: " &
                        "is the serial line connected?"));
end Main;
