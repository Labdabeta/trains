with Ada.Text_IO; use Ada.Text_IO;
with Com;
with Sensors; use Sensors;
with Switches; use Switches;
with SDL; use SDL;
with Constants;

package body Input_Processor is
    procedure Process (C : Character) is
        procedure Process_Command is

        begin
            if Args (1) = 's' then
                Draw_Sensor (
                    Group => Args (2);
                    Id => --  TODO
        end Process_Command;
    begin
        if not Init then
            if C = ASCII.STX then
                Init := True;
                Put_Line ("Connection established...");
                Next_Arg := 1;
            end if;
            return;
        end if;

        Args (Next_Arg) := C;
        Next_Arg = Next_Arg + 1;
        if Next_Arg > 5 then
            Next_Arg := 1;
            Process_Command;
        end if;
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
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('C');
                when TRISWITCH_STRAIGHT =>
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('C');
                when TRISWITCH_RIGHT =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('B');
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('C');
            end case;
        end if;

        if Within (
            Point => (X, Y),
            Space => Constants.TriSwitch_Area (SOUTH_SWITCH))
        then
            case Next_TriSwitch (SOUTH_SWITCH) is
                when TRISWITCH_LEFT =>
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('9');
                when TRISWITCH_STRAIGHT =>
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('9');
                when TRISWITCH_RIGHT =>
                    Com.Putc ('c'); Com.Putc ('9'); Com.Putc ('A');
                    Com.Putc ('s'); Com.Putc ('9'); Com.Putc ('9');
            end case;
        end if;
    end Process_Click;
end Input_Processor;
