with SDL.Image;
with Switches;
with Sensors;

package Reservations is
    procedure Initialize;
    procedure Finalize;
    procedure Draw;

    procedure Reserve_Switch (Which : Switches.GenericSwitch);
    procedure Unreserve_Switch (Which : Switches.GenericSwitch);
    procedure Reserve_Sensor (
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId);
    procedure Unreserve_Sensor (
        Group : Sensors.SensorGroup;
        Id : Sensors.SensorId);
private
    BiStates : array (Switches.BiSwitch) of Boolean := (others => False);
    TriStates : array (Switches.TriSwitch) of Boolean := (others => False);
    SensorStates : array (Sensors.SensorGroup, Sensors.SensorId) of Boolean :=
        (others => (others => False));
    Occupied : SDL.Image.Image;
end Reservations;
