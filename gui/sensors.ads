with SDL.Image;

package Sensors is
    type SensorGroup is (SG_A, SG_B, SG_C, SG_D, SG_E);
    type SensorId is range 1 .. 16;

    procedure Initialize;

    procedure Finalize;

    procedure Draw_Sensor (
        Group : SensorGroup;
        Id : SensorId;
        Active : Boolean);

    procedure Draw;
private
    States : aliased array (SensorGroup, SensorId) of Boolean :=
        (others => (others => False));
    Images : array (SensorGroup, SensorId) of SDL.Image.Image;
end Sensors;
