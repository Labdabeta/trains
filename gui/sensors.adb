with Interfaces.C.Strings; use Interfaces.C.Strings;
with SDL;
with SDL.Image;
with Ada.Text_IO; use Ada.Text_IO;
with Constants;

package body Sensors is
    procedure Draw is
    begin
        for Group in SensorGroup'Range loop
            for Id in SensorId'Range loop
                if States (Group, Id) then
                    SDL.Image.Draw (
                        Img => Images (Group, Id),
                        Destination => Constants.Map_Area);
                end if;
            end loop;
        end loop;
    end Draw;

    procedure Draw_Sensor (
        Group : SensorGroup;
        Id : SensorId;
        Active : Boolean) is
    begin
        States (Group, Id) := Active;
    end Draw_Sensor;

    procedure Finalize is begin
        for Group in SensorGroup'Range loop
            for Id in SensorId'Range loop
                SDL.Image.Free (Images (Group, Id));
            end loop;
        end loop;
    end Finalize;

    procedure Initialize is begin
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A1.png"),
            Img => Images (SG_A, 1));
        Put_Line ("Loaded res/Sensors/A/A1.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A2.png"),
            Img => Images (SG_A, 2));
        Put_Line ("Loaded res/Sensors/A/A2.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A3.png"),
            Img => Images (SG_A, 3));
        Put_Line ("Loaded res/Sensors/A/A3.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A4.png"),
            Img => Images (SG_A, 4));
        Put_Line ("Loaded res/Sensors/A/A4.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A5.png"),
            Img => Images (SG_A, 5));
        Put_Line ("Loaded res/Sensors/A/A5.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A6.png"),
            Img => Images (SG_A, 6));
        Put_Line ("Loaded res/Sensors/A/A6.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A7.png"),
            Img => Images (SG_A, 7));
        Put_Line ("Loaded res/Sensors/A/A7.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A8.png"),
            Img => Images (SG_A, 8));
        Put_Line ("Loaded res/Sensors/A/A8.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A9.png"),
            Img => Images (SG_A, 9));
        Put_Line ("Loaded res/Sensors/A/A9.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A10.png"),
            Img => Images (SG_A, 10));
        Put_Line ("Loaded res/Sensors/A/A10.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A11.png"),
            Img => Images (SG_A, 11));
        Put_Line ("Loaded res/Sensors/A/A11.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A12.png"),
            Img => Images (SG_A, 12));
        Put_Line ("Loaded res/Sensors/A/A12.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A13.png"),
            Img => Images (SG_A, 13));
        Put_Line ("Loaded res/Sensors/A/A13.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A14.png"),
            Img => Images (SG_A, 14));
        Put_Line ("Loaded res/Sensors/A/A14.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A15.png"),
            Img => Images (SG_A, 15));
        Put_Line ("Loaded res/Sensors/A/A15.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/A/A16.png"),
            Img => Images (SG_A, 16));
        Put_Line ("Loaded res/Sensors/A/A16.png...");

        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B1.png"),
            Img => Images (SG_B, 1));
        Put_Line ("Loaded res/Sensors/B/B1.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B2.png"),
            Img => Images (SG_B, 2));
        Put_Line ("Loaded res/Sensors/B/B2.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B3.png"),
            Img => Images (SG_B, 3));
        Put_Line ("Loaded res/Sensors/B/B3.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B4.png"),
            Img => Images (SG_B, 4));
        Put_Line ("Loaded res/Sensors/B/B4.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B5.png"),
            Img => Images (SG_B, 5));
        Put_Line ("Loaded res/Sensors/B/B5.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B6.png"),
            Img => Images (SG_B, 6));
        Put_Line ("Loaded res/Sensors/B/B6.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B7.png"),
            Img => Images (SG_B, 7));
        Put_Line ("Loaded res/Sensors/B/B7.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B8.png"),
            Img => Images (SG_B, 8));
        Put_Line ("Loaded res/Sensors/B/B8.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B9.png"),
            Img => Images (SG_B, 9));
        Put_Line ("Loaded res/Sensors/B/B9.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B10.png"),
            Img => Images (SG_B, 10));
        Put_Line ("Loaded res/Sensors/B/B10.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B11.png"),
            Img => Images (SG_B, 11));
        Put_Line ("Loaded res/Sensors/B/B11.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B12.png"),
            Img => Images (SG_B, 12));
        Put_Line ("Loaded res/Sensors/B/B12.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B13.png"),
            Img => Images (SG_B, 13));
        Put_Line ("Loaded res/Sensors/B/B13.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B14.png"),
            Img => Images (SG_B, 14));
        Put_Line ("Loaded res/Sensors/B/B14.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B15.png"),
            Img => Images (SG_B, 15));
        Put_Line ("Loaded res/Sensors/B/B15.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/B/B16.png"),
            Img => Images (SG_B, 16));
        Put_Line ("Loaded res/Sensors/B/B16.png...");

        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C1.png"),
            Img => Images (SG_C, 1));
        Put_Line ("Loaded res/Sensors/C/C1.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C2.png"),
            Img => Images (SG_C, 2));
        Put_Line ("Loaded res/Sensors/C/C2.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C3.png"),
            Img => Images (SG_C, 3));
        Put_Line ("Loaded res/Sensors/C/C3.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C4.png"),
            Img => Images (SG_C, 4));
        Put_Line ("Loaded res/Sensors/C/C4.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C5.png"),
            Img => Images (SG_C, 5));
        Put_Line ("Loaded res/Sensors/C/C5.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C6.png"),
            Img => Images (SG_C, 6));
        Put_Line ("Loaded res/Sensors/C/C6.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C7.png"),
            Img => Images (SG_C, 7));
        Put_Line ("Loaded res/Sensors/C/C7.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C8.png"),
            Img => Images (SG_C, 8));
        Put_Line ("Loaded res/Sensors/C/C8.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C9.png"),
            Img => Images (SG_C, 9));
        Put_Line ("Loaded res/Sensors/C/C9.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C10.png"),
            Img => Images (SG_C, 10));
        Put_Line ("Loaded res/Sensors/C/C10.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C11.png"),
            Img => Images (SG_C, 11));
        Put_Line ("Loaded res/Sensors/C/C11.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C12.png"),
            Img => Images (SG_C, 12));
        Put_Line ("Loaded res/Sensors/C/C12.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C13.png"),
            Img => Images (SG_C, 13));
        Put_Line ("Loaded res/Sensors/C/C13.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C14.png"),
            Img => Images (SG_C, 14));
        Put_Line ("Loaded res/Sensors/C/C14.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C15.png"),
            Img => Images (SG_C, 15));
        Put_Line ("Loaded res/Sensors/C/C15.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/C/C16.png"),
            Img => Images (SG_C, 16));
        Put_Line ("Loaded res/Sensors/C/C16.png...");

        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D1.png"),
            Img => Images (SG_D, 1));
        Put_Line ("Loaded res/Sensors/D/D1.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D2.png"),
            Img => Images (SG_D, 2));
        Put_Line ("Loaded res/Sensors/D/D2.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D3.png"),
            Img => Images (SG_D, 3));
        Put_Line ("Loaded res/Sensors/D/D3.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D4.png"),
            Img => Images (SG_D, 4));
        Put_Line ("Loaded res/Sensors/D/D4.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D5.png"),
            Img => Images (SG_D, 5));
        Put_Line ("Loaded res/Sensors/D/D5.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D6.png"),
            Img => Images (SG_D, 6));
        Put_Line ("Loaded res/Sensors/D/D6.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D7.png"),
            Img => Images (SG_D, 7));
        Put_Line ("Loaded res/Sensors/D/D7.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D8.png"),
            Img => Images (SG_D, 8));
        Put_Line ("Loaded res/Sensors/D/D8.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D9.png"),
            Img => Images (SG_D, 9));
        Put_Line ("Loaded res/Sensors/D/D9.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D10.png"),
            Img => Images (SG_D, 10));
        Put_Line ("Loaded res/Sensors/D/D10.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D11.png"),
            Img => Images (SG_D, 11));
        Put_Line ("Loaded res/Sensors/D/D11.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D12.png"),
            Img => Images (SG_D, 12));
        Put_Line ("Loaded res/Sensors/D/D12.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D13.png"),
            Img => Images (SG_D, 13));
        Put_Line ("Loaded res/Sensors/D/D13.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D14.png"),
            Img => Images (SG_D, 14));
        Put_Line ("Loaded res/Sensors/D/D14.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D15.png"),
            Img => Images (SG_D, 15));
        Put_Line ("Loaded res/Sensors/D/D15.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/D/D16.png"),
            Img => Images (SG_D, 16));
        Put_Line ("Loaded res/Sensors/D/D16.png...");

        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E1.png"),
            Img => Images (SG_E, 1));
        Put_Line ("Loaded res/Sensors/E/E1.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E2.png"),
            Img => Images (SG_E, 2));
        Put_Line ("Loaded res/Sensors/E/E2.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E3.png"),
            Img => Images (SG_E, 3));
        Put_Line ("Loaded res/Sensors/E/E3.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E4.png"),
            Img => Images (SG_E, 4));
        Put_Line ("Loaded res/Sensors/E/E4.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E5.png"),
            Img => Images (SG_E, 5));
        Put_Line ("Loaded res/Sensors/E/E5.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E6.png"),
            Img => Images (SG_E, 6));
        Put_Line ("Loaded res/Sensors/E/E6.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E7.png"),
            Img => Images (SG_E, 7));
        Put_Line ("Loaded res/Sensors/E/E7.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E8.png"),
            Img => Images (SG_E, 8));
        Put_Line ("Loaded res/Sensors/E/E8.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E9.png"),
            Img => Images (SG_E, 9));
        Put_Line ("Loaded res/Sensors/E/E9.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E10.png"),
            Img => Images (SG_E, 10));
        Put_Line ("Loaded res/Sensors/E/E10.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E11.png"),
            Img => Images (SG_E, 11));
        Put_Line ("Loaded res/Sensors/E/E11.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E12.png"),
            Img => Images (SG_E, 12));
        Put_Line ("Loaded res/Sensors/E/E12.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E13.png"),
            Img => Images (SG_E, 13));
        Put_Line ("Loaded res/Sensors/E/E13.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E14.png"),
            Img => Images (SG_E, 14));
        Put_Line ("Loaded res/Sensors/E/E14.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E15.png"),
            Img => Images (SG_E, 15));
        Put_Line ("Loaded res/Sensors/E/E15.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Sensors/E/E16.png"),
            Img => Images (SG_E, 16));
        Put_Line ("Loaded res/Sensors/E/E16.png...");
    end Initialize;
end Sensors;
