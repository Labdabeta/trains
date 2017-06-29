with GNAT.Serial_Communications; use GNAT.Serial_Communications;
with SDL;
with SDL.Image;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Controller;
with Sensors;
with Switches;

procedure Main is
    -- Our map is 2483 x 1363
    -- Window_Width : constant := 2483;
    -- Window_Height : constant := 1363;
    Window_Width : constant := 2000;
    Window_Height : constant := 1200;
    Init_Error : chars_ptr;
    Background : SDL.Image.Image;
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

    Controller.Initialize (
        Name => GNAT.Serial_Communications.Port_Name (
            Ada.Command_Line.Argument (3)),
        Load => Ada.Command_Line.Argument (1));

    SDL.Open_Window (
        Width => Window_Width,
        Height => Window_Height,
        Title => New_String (Ada.Command_Line.Argument (2)));

    SDL.Image.Open (
        Fname => New_String ("res/track_a.png"),
        Img => Background);

    -- Switches.Initialize;
    Sensors.Initialize;

    declare
        Com_Control : Controller.Com_Controller;
        Quit : Boolean := False;
        E : SDL.Event;
    begin
        while not Quit loop
            SDL.Poll_Event (E => E);
            case E.Kind is
                when SDL.NONE => null;
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
            SDL.Render_Clear;
            SDL.Image.Draw (
                Img => Background,
                Top => 0,
                Left => 0,
                Height => SDL.Status.Window_Height,
                Width => SDL.Status.Window_Width);
            Sensors.Draw;
            SDL.Render_Present;
        end loop;
        Controller.Putc ('Q');
    end;

    Controller.Close;

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
