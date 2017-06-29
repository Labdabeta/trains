with Interfaces.C.Strings; use Interfaces.C.Strings;
with SDL;
with SDL.Image;
with Ada.Text_IO; use Ada.Text_IO;
with Switch_Collisions;

package body Switches is

    procedure Draw is begin
        for Bi in BiSwitch'Range loop
            SDL.Image.Draw (
                Img => BiImages (Bi, BiStates (Bi)),
                Top => 0,
                Left => 0,
                Height => SDL.Status.Window_Height,
                Width => SDL.Status.Window_Width);
        end loop;

        for Tri in TriSwitch'Range loop
            SDL.Image.Draw (
                Img => TriImages (Tri, TriStates (Tri)),
                Top => 0,
                Left => 0,
                Height => SDL.Status.Window_Height,
                Width => SDL.Status.Window_Width);
        end loop;
    end Draw;

    procedure Draw_BiSwitch (
        Switch : BiSwitch;
        State : BiSwitchState) is
    begin
        null;
    end Draw_BiSwitch;

    procedure Draw_TriSwitch (
        Switch : TriSwitch;
        State : TriSwitchState) is
    begin
        null;
    end Draw_TriSwitch;

    procedure Finalize is begin
        for Bi in BiSwitch'Range loop
            for State in BiSwitchState'Range loop
                SDL.Image.Free (BiImages (Bi, State));
            end loop;
        end loop;

        for Tri in TriSwitch'Range loop
            for State in TriSwitchState'Range loop
                SDL.Image.Free (TriImages (Tri, State));
            end loop;
        end loop;
    end Finalize;

    procedure Handle_Click is
    begin
        null;
    end Handle_Click;

    procedure Initialize is
    begin
        SDL.Image.Open (
            Fname => New_String ("res/Switches/1S.png"),
            Img => BiImages (1, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/1S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/1C.png"),
            Img => BiImages (1, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/1C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/2S.png"),
            Img => BiImages (2, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/2S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/2C.png"),
            Img => BiImages (2, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/2C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/3S.png"),
            Img => BiImages (3, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/3S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/3C.png"),
            Img => BiImages (3, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/3C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/4S.png"),
            Img => BiImages (4, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/4S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/4C.png"),
            Img => BiImages (4, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/4C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/5S.png"),
            Img => BiImages (5, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/5S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/5C.png"),
            Img => BiImages (5, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/5C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/6S.png"),
            Img => BiImages (6, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/6S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/6C.png"),
            Img => BiImages (6, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/6C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/7S.png"),
            Img => BiImages (7, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/7S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/7C.png"),
            Img => BiImages (7, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/7C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/8S.png"),
            Img => BiImages (8, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/8S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/8C.png"),
            Img => BiImages (8, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/8C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/9S.png"),
            Img => BiImages (9, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/9S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/9C.png"),
            Img => BiImages (9, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/9C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/10S.png"),
            Img => BiImages (10, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/10S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/10C.png"),
            Img => BiImages (10, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/10C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/11S.png"),
            Img => BiImages (11, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/11S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/11C.png"),
            Img => BiImages (11, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/11C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/12S.png"),
            Img => BiImages (12, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/12S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/12C.png"),
            Img => BiImages (12, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/12C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/13S.png"),
            Img => BiImages (13, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/13S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/13C.png"),
            Img => BiImages (13, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/13C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/14S.png"),
            Img => BiImages (14, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/14S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/14C.png"),
            Img => BiImages (14, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/14C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/15S.png"),
            Img => BiImages (15, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/15S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/15C.png"),
            Img => BiImages (15, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/15C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/16S.png"),
            Img => BiImages (16, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/16S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/16C.png"),
            Img => BiImages (16, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/16C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/17S.png"),
            Img => BiImages (17, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/17S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/17C.png"),
            Img => BiImages (17, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/17C.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/18S.png"),
            Img => BiImages (18, BISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/18S.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/18C.png"),
            Img => BiImages (18, BISWITCH_CURVED));
        Put_Line ("Loaded res/Switches/18C.png...");

        SDL.Image.Open (
            Fname => New_String ("res/Switches/NL.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_LEFT));
        Put_Line ("Loaded res/Switches/NL.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/NR.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_RIGHT));
        Put_Line ("Loaded res/Switches/NR.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/NS.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_STRAIGHT));
        Put_Line ("Loaded res/Switches/NS.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SL.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_LEFT));
        Put_Line ("Loaded res/Switches/SL.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SR.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_RIGHT));
        Put_Line ("Loaded res/Switches/SR.png...");
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SS.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_STRAIGHT));
    end Initialize;
end Switches;
