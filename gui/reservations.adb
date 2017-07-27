with SDL.Image;
with Switches; use Switches;
with Sensors; use Sensors;
with Constants;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package body Reservations is

    procedure Draw is
    begin
        for Group in SensorGroup'Range loop
            for Id in SensorId'Range loop
                if SensorStates (Group, Id) then
                    SDL.Image.Draw (
                        Img => Occupied,
                        Destination => Constants.Sensor_Area (Group, Id));
                end if;
            end loop;
        end loop;
        for Bi in BiSwitch'Range loop
            if BiStates (Bi) then
                SDL.Image.Draw (
                    Img => Occupied,
                    Destination => Constants.BiSwitch_Area (Bi));
            end if;
        end loop;
        for Tri in TriSwitch'Range loop
            if TriStates (Tri) then
                SDL.Image.Draw (
                    Img => Occupied,
                    Destination => Constants.TriSwitch_Area (Tri));
            end if;
        end loop;
    end Draw;

    procedure Finalize is
    begin
        SDL.Image.Free (Occupied);
    end Finalize;

    procedure Initialize is
    begin
        SDL.Image.Open (
            Fname => New_String ("res/occupied.png"),
            Img => Occupied);
    end Initialize;

    procedure Reserve_Sensor (
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId) is
    begin
        SensorStates (Group, Id) := True;
    end Reserve_Sensor;

    procedure Reserve_Switch (Which : Switches.GenericSwitch) is
    begin
        if Which.IsTri then
            TriStates (Which.Tri) := True;
        else
            BiStates (Which.Bi) := True;
        end if;
    end Reserve_Switch;

    procedure Unreserve_Sensor (
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId) is
    begin
        SensorStates (Group, Id) := False;
    end Unreserve_Sensor;

    procedure Unreserve_Switch (Which : Switches.GenericSwitch) is
    begin
        if Which.IsTri then
            TriStates (Which.Tri) := False;
        else
            BiStates (Which.Bi) := False;
        end if;
    end Unreserve_Switch;
end Reservations;
