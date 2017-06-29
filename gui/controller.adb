with Interfaces.C.Strings; use Interfaces.C.Strings;
with GNAT.Serial_Communications;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions;
with Sensors; use Sensors;
with Switches;

package body Controller is
    procedure Close is begin
        Put_Line ("Closing serial port.");
        GNAT.Serial_Communications.Close (Com);
    end Close;
    task body Com_Controller is
        C : Character;
        Quit : Boolean := False;
        Init : Boolean := False; -- Change to false to force connection

        function Read_Sensor (
            Group : out Sensors.SensorGroup;
            Id : out Sensors.SensorId) return Boolean;

        function Get_A_Char return Character is
            Ch : Character;
        begin
            Put_Line ("Reading...");
            Character'Read (Com'Access, Ch);
            Put_Line ("Got: " & Integer'Image (Character'Pos (Ch)));
            return Ch;
        end Get_A_Char;

        procedure Process_Sensor_Down is
            Group : Sensors.SensorGroup;
            Id : Sensors.SensorId;
        begin
            if Read_Sensor (Group => Group, Id => Id) then
                Sensors.Draw_Sensor (
                    Group => Group,
                    Id => Id,
                    Active => True);
            else
                Put_Line ("Bad Sensor Id");
            end if;
        end Process_Sensor_Down;

        procedure Process_Sensor_Up is
            Group : Sensors.SensorGroup;
            Id : Sensors.SensorId;
        begin
            if Read_Sensor (Group => Group, Id => Id) then
                Sensors.Draw_Sensor (
                    Group => Group,
                    Id => Id,
                    Active => False);
            else
                Put_Line ("Bad Sensor Id");
            end if;
        end Process_Sensor_Up;

        function Read_Sensor (
            Group : out Sensors.SensorGroup;
            Id : out Sensors.SensorId) return Boolean is
            Ch : Character;
        begin
            Ch := Get_A_Char;
            case Ch is
                when 'A' | 'a' => Group := Sensors.SG_A;
                when 'B' | 'b' => Group := Sensors.SG_B;
                when 'C' | 'c' => Group := Sensors.SG_C;
                when 'D' | 'd' => Group := Sensors.SG_D;
                when 'E' | 'e' => Group := Sensors.SG_E;
                when others => Put_Line ("Unexpected sensor group: " &
                    Character'Image (Ch));
                    return False;
            end case;

            Ch := Get_A_Char;
            if Ch < '0' then
                Put_Line ("Unexpected sensor number: " & Character'Image (Ch));
                return False;
            end if;

            if Ch <= '9' then
                Id := Sensors.SensorId (Character'Pos (Ch) -
                    Character'Pos ('0'));
            elsif Ch > 'A' and Ch < 'F' then
                Id := 10 + Sensors.SensorId (Character'Pos (Ch) -
                    Character'Pos ('A'));
            elsif Ch > 'a' and Ch < 'f' then
                Id := 10 + Sensors.SensorId (Character'Pos (Ch) -
                    Character'Pos ('a'));
            end if;

            return True;
        end Read_Sensor;
    begin
        while not Quit loop
            C := Get_A_Char;
            if Init then
                case C is
                    -- when ASCII.NUL => Quit := True;
                    when 'S' => Process_Sensor_Up;
                    when 's' => Process_Sensor_Down;
                    when others => Put_Line ("Unexpected character: " &
                        Character'Image (C));
                end case;
            else
                if C = ASCII.STX then
                    Init := True;
                    Put_Line ("Connection established...");
                end if;
            end if;
        end loop;
    exception
        when The_Error : others =>
            Ada.Text_IO.Put_Line ("Unexpected error.");
            Ada.Text_IO.Put_Line (Ada.Exceptions.Exception_Information
                (The_Error));
            Ada.Text_IO.Skip_Line;
    end Com_Controller;

    procedure Initialize (
        Name : GNAT.Serial_Communications.Port_Name;
        Load : String) is
    begin
        GNAT.Serial_Communications.Open (
            Port => Com,
            Name => Name);

        GNAT.Serial_Communications.Set (
            Port => Com,
            Rate => GNAT.Serial_Communications.B115200,
            Bits => GNAT.Serial_Communications.CS8,
            Stop_Bits => GNAT.Serial_Communications.One,
            Parity => GNAT.Serial_Communications.None,
            Block => True);

        String'Write (Com'Access, Load);
    end Initialize;

    procedure Putc (C : Character) is
    begin
        Character'Write (Com'Access, C);
    end Putc;

end Controller;
