with Ada.Text_IO; use Ada.Text_IO;
with Com;
with Sensors; use Sensors;
with Switches;

package body Input_Processor is
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
        elsif Args (2) > 'A' and Args (2) < 'F' then
            Id := 10 + Sensors.SensorId (Character'Pos (Args (2)) -
                Character'Pos ('A'));
        elsif Args (2) > 'a' and Args (2) < 'f' then
            Id := 10 + Sensors.SensorId (Character'Pos (Args (2)) -
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
        end case;
    end Process;

end Input_Processor;
