with Ada.Text_IO; use Ada.Text_IO;
with Com;
with Sensors; use Sensors;
with Switches; use Switches;
with SDL; use SDL;
with SDL_Keys; use SDL_Keys;
with Constants;
with Trains;
with SDL.Image; use SDL.Image;
with Interfaces.C.Strings; use Interfaces.C.Strings;
with Interfaces.C; use Interfaces.C;

package body Input_Processor is
    function To_Hex_Char (Val : Integer) return Character;
    procedure Draw is
        Idx : Integer;
    begin
        SDL.Image.Draw_Raw (
            Img => Command_Image,
            Top_Left => Constants.Command_Text_Spot);
        SDL.Image.Draw_Raw (
            Img => Prompt_Image,
            Top_Left => Constants.Command_Prompt_Spot);

        Idx := Previous_Line_Idx;

        for I in Integer range 1 .. Constants.Message_Height loop
            if Previous_Line_Image (Idx) /= SDL.Image.Null_Image then
                SDL.Image.Draw_Raw (
                    Img => Previous_Line_Image (Idx),
                    Top_Left => Constants.Previous_Lines_Spots (I));
            end if;

            Idx := (Idx + 1) mod Constants.Message_Height;
        end loop;
    end Draw;

    procedure Initialize is
    begin
        The_Font := SDL.Font.Open (New_String ("res/font.ttf"), 28);
        SDL.Font.RenderFast (The_Font, New_String (String (Command)), 200, 200,
            200, Command_Image);
        SDL.Font.RenderFast (The_Font, New_String (">"), 255, 255, 255,
            Prompt_Image);
    end Initialize;

    function Process (C : Character) return Boolean is
        function Process_Command return Boolean is begin
            case Args (1) is
                when 'c' =>
                    Set_Switch (
                        Which => Parse_Switch_Id (Args (2), Args (3)),
                        Curved => True);
                when '|' =>
                    Set_Switch (
                        Which => Parse_Switch_Id (Args (2), Args (3)),
                        Curved => False);
                when 's' =>
                    Draw_Sensor (
                        Group => Char_To_Sensor_Group (Args (2)),
                        Id => Char_To_Sensor_Id (Args (3)),
                        Active => True);
                when 'S' =>
                    Draw_Sensor (
                        Group => Char_To_Sensor_Group (Args (2)),
                        Id => Char_To_Sensor_Id (Args (3)),
                        Active => False);
                when 'p' =>
                    Input_Length :=
                        (Character'Pos (Args (2)) - Character'Pos ('0')) * 10 +
                        Character'Pos (Args (3)) - Character'Pos ('0');
                    Input_Args := (others => ' ');
                    if Input_Length = 0 then
                        Input_Length := 100;
                    end if;
                    Input_Args_Length := 0;
                    Is_Log := False;
                when 'l' =>
                    Input_Length :=
                        (Character'Pos (Args (2)) - Character'Pos ('0')) * 10 +
                        Character'Pos (Args (3)) - Character'Pos ('0');
                    Input_Args := (others => ' ');
                    if Input_Length = 0 then
                        Input_Length := 100;
                    end if;
                    Input_Args_Length := 0;
                    Is_Log := True;
                when 'd' =>
                    return True;
                when others =>
                    Put_Line ("Unknown command: "
                        & Character'Image (Args (1))
                        & Character'Image (Args (2))
                        & Character'Image (Args (3)));
            end case;
            return False;
        end Process_Command;

    begin
        if not Init then
            if C = ASCII.STX then
                Init := True;
                Put_Line ("Connection established...");
                Next_Arg := 1;
            end if;
            return False;
        end if;

        if Input_Length > Input_Args_Length then
            Input_Args_Length := Input_Args_Length + 1;
            Input_Args (Input_Args_Length) := C;

            if Input_Length = Input_Args_Length then
                if Is_Log then
                    Previous_Line_Idx := (Previous_Line_Idx +
                        Constants.Message_Height - 1) mod
                        Constants.Message_Height;
                    Previous_Line (Previous_Line_Idx) := Command;
                    if Previous_Line_Image (Previous_Line_Idx) /=
                        SDL.Image.Null_Image
                    then
                        SDL.Image.Free (Previous_Line_Image
                            (Previous_Line_Idx));
                    end if;
                    SDL.Font.RenderFast (The_Font,
                        New_String (String (Input_Args)),
                        200, 200, 200, Previous_Line_Image (Previous_Line_Idx));
                end if;
            end if;
        else
            Args (Next_Arg) := C;
            Next_Arg := Next_Arg + 1;
            if Next_Arg > 3 then
                Next_Arg := 1;
                return Process_Command;
            end if;
        end if;

        return False;
    end Process;

    procedure Process_Click is
        X : SDL.Dimension := Get_Mouse_X;
        Y : SDL.Dimension := Get_Mouse_Y;
    begin
        for Bi in Switches.BiSwitch'Range loop
            if Within (
                Point => (X, Y),
                Space => Constants.BiSwitch_Area (Bi))
            then
                Com.Putc ('s'); Com.Putc ('w');
                if Next_BiSwitch (Bi) = BISWITCH_STRAIGHT then
                    Com.Putc ('s');
                else
                    Com.Putc ('c');
                end if;
                Com.Putc (To_Hex_Char (Integer (Bi / 16)));
                Com.Putc (To_Hex_Char (Integer (Bi mod 16)));
            end if;
        end loop;

        if Within (
            Point => (X, Y),
            Space => Constants.TriSwitch_Area (NORTH_SWITCH))
        then
            case Next_TriSwitch (NORTH_SWITCH) is
                when TRISWITCH_LEFT =>
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('C');
                when TRISWITCH_STRAIGHT =>
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('C');
                when TRISWITCH_RIGHT =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('C');
                when TRISWITCH_DERAIL =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('C');
            end case;
        end if;

        if Within (
            Point => (X, Y),
            Space => Constants.TriSwitch_Area (SOUTH_SWITCH))
        then
            case Next_TriSwitch (SOUTH_SWITCH) is
                when TRISWITCH_LEFT =>
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('9');
                when TRISWITCH_STRAIGHT =>
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('9');
                when TRISWITCH_RIGHT =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('|'); Com.Putc ('9'); Com.Putc ('9');
                when TRISWITCH_DERAIL =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('9');
            end case;
        end if;
    end Process_Click;

    procedure Process_Keyboard (Key : SDL_Keys.Key) is
    begin
        if (Key >= KEY_SPACE and Key <= KEY_AT) or
           (Key >= KEY_a and Key <= KEY_z)
        then
            if Key >= KEY_a and Key <= KEY_z and (
                SDL.Status.Keys (KEY_LSHIFT) /= 0 or
                SDL.Status.Keys (KEY_RSHIFT) /= 0)
            then
                Command (Command_Length) := Character'Val (Key - 32);
            else
                Command (Command_Length) := Character'Val (Key);
            end if;
            Command_Length := Command_Length + 1;
            if Command_Image /= SDL.Image.Null_Image then
                SDL.Image.Free (Command_Image);
            end if;
            SDL.Font.RenderFast (The_Font, New_String (String (Command)), 200,
                200, 200, Command_Image);
        elsif Key = KEY_BACKSPACE then
            if Command_Length > 1 then
                Command_Length := Command_Length - 1;
                Command (Command_Length) := ' ';
            end if;
            if Command_Image /= SDL.Image.Null_Image then
                SDL.Image.Free (Command_Image);
            end if;
            SDL.Font.RenderFast (The_Font, New_String (String (Command)), 200,
                200, 200, Command_Image);
        elsif Key = KEY_RETURN then
            if Command_Length > 1 then
                Current_History_Idx := (Current_History_Idx + 1) mod
                    Constants.Command_History_Length;
                Command_History (Current_History_Idx) := Command;
                Command_Length_History (Current_History_Idx) := Command_Length;

                Previous_Line_Idx := (Previous_Line_Idx +
                    Constants.Message_Height - 1) mod
                    Constants.Message_Height;
                Previous_Line (Previous_Line_Idx) := Command;
                if Previous_Line_Image (Previous_Line_Idx) /=
                    SDL.Image.Null_Image
                then
                    SDL.Image.Free (Previous_Line_Image (Previous_Line_Idx));
                end if;
                Previous_Line_Image (Previous_Line_Idx) := Command_Image;

                Command_Length := Command_Length - 1;
                Com.Putc ('g');
                Com.Putc (Character'Val
                    (Character'Pos ('0') + (Command_Length / 10)));
                Com.Putc (Character'Val
                    (Character'Pos ('0') + (Command_Length mod 10)));
                for I in Integer range 1 .. Command_Length loop
                    Com.Putc (Command (I));
                    Command (I) := ' ';
                end loop;
                SDL.Font.RenderFast (The_Font, New_String (String (Command)),
                    200, 200, 200, Command_Image);

                Command_Length := 1;
                Current_Command_Idx := Current_History_Idx;
            end if;
        elsif Key = KEY_UP then
            Command := Command_History (Current_Command_Idx);
            Command_Length := Command_Length_History (Current_Command_Idx);
            SDL.Font.RenderFast (The_Font, New_String (String (Command)),
                200, 200, 200, Command_Image);

            Current_Command_Idx := (Current_Command_Idx +
                Constants.Command_History_Length - 1) mod
                Constants.Command_History_Length;
        elsif Key = KEY_DOWN then
            Current_Command_Idx := (Current_Command_Idx + 1) mod
                Constants.Command_History_Length;
            Command := Command_History (Current_Command_Idx);
            Command_Length := Command_Length_History (Current_Command_Idx);
            SDL.Font.RenderFast (The_Font, New_String (String (Command)),
                200, 200, 200, Command_Image);
        end if;
    end Process_Keyboard;

    function To_Hex_Char (Val : Integer) return Character is
    begin
        if Val < 10 then
            return Character'Val (Val + Character'Pos ('0'));
        else
            return Character'Val (Val + Character'Pos ('A') - 10);
        end if;
    end To_Hex_Char;
end Input_Processor;
