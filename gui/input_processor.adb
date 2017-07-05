with Ada.Text_IO; use Ada.Text_IO;
with Com;
with Sensors; use Sensors;
with Switches; use Switches;
with SDL; use SDL;
with Constants;

package body Input_Processor is
    function To_Hex_Char (Input : Integer) return Character;
    procedure Do_Sensor_Read (
        Group : out Sensors.SensorGroup;
        Id : out Sensors.SensorId);

    procedure Do_Sensor_Down is
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId;
    begin
        Do_Sensor_Read (Group => Group, Id => Id);
        Sensors.Draw_Sensor (
            Group => Group,
            Id => Id,
            Active => True);
    end Do_Sensor_Down;

    procedure Do_Sensor_Read (
        Group : out Sensors.SensorGroup;
        Id : out Sensors.SensorId) is
    begin
        case Args (1) is
            when 'A' | 'a' => Group := Sensors.SG_A;
            when 'B' | 'b' => Group := Sensors.SG_B;
            when 'C' | 'c' => Group := Sensors.SG_C;
            when 'D' | 'd' => Group := Sensors.SG_D;
            when 'E' | 'e' => Group := Sensors.SG_E;
            when others => Put_Line ("Unexpected sensor group: " &
                Character'Image (Args (1)));
        end case;

        if Args (2) <= '9' then
            Id := Sensors.SensorId (Character'Pos (Args (2)) -
                Character'Pos ('0'));
        elsif Args (2) >= 'A' and Args (2) <= 'G' then
            Id := Sensors.SensorId (10 + Character'Pos (Args (2)) -
                Character'Pos ('A'));
        elsif Args (2) >= 'a' and Args (2) <= 'g' then
            Id := Sensors.SensorId (10 + Character'Pos (Args (2)) -
                Character'Pos ('a'));
        end if;
    end Do_Sensor_Read;

    procedure Do_Sensor_Up is
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId;
    begin
        Do_Sensor_Read (Group => Group, Id => Id);
        Sensors.Draw_Sensor (
            Group => Group,
            Id => Id,
            Active => False);
    end Do_Sensor_Up;

    procedure Erase_Data is begin
        Command := ASCII.NUL;
        Args (1) := ASCII.NUL;
        Args (2) := ASCII.NUL;
        Args (3) := ASCII.NUL;
    end Erase_Data;

    procedure Process (C : Character) is
    begin
        if not Init then
            if C = ASCII.STX then
                Init := True;
                Put_Line ("Connection established...");
            end if;
            return;
        end if;

        if Command = ASCII.NUL then
            Command := C;
            return;
        end if;

        case Command is
            when 'S' =>
                if Args (1) = ASCII.NUL then
                    Args (1) := C;
                elsif Args (2) = ASCII.NUL then
                    Args (2) := C;
                    Do_Sensor_Up;
                    Erase_Data;
                end if;
            when 's' =>
                if Args (1) = ASCII.NUL then
                    Args (1) := C;
                elsif Args (2) = ASCII.NUL then
                    Args (2) := C;
                    Do_Sensor_Down;
                    Erase_Data;
                end if;
            when others =>
                Put_Line ("Unknown character: " & Character'Image (C));
                Command := ASCII.NUL;
        end case;
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

    function To_Hex_Char (
        Input : Integer) return Character is
    begin
        if Input < 0 then
            return '?';
        end if;
        if Input < 10 then
            return Character'Val (Character'Pos ('0') + Input);
        end if;
        if Input > 15 then
            return '?';
        end if;
        return Character'Val (Character'Pos ('A') + Input - 10);
    end To_Hex_Char;

end Input_Processor;
