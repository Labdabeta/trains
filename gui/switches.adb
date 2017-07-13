with Interfaces.C.Strings; use Interfaces.C.Strings;
with SDL; use SDL;
with SDL.Image;
with Ada.Text_IO; use Ada.Text_IO;
with Constants;

package body Switches is

    procedure Draw is begin
        for Bi in BiSwitch'Range loop
            SDL.Image.Draw (
                Img => BiImages (Bi, BiStates (Bi)),
                Destination => Constants.BiSwitch_Area (Bi));
        end loop;

        for Tri in TriSwitch'Range loop
            SDL.Image.Draw (
                Img => TriImages (Tri, TriStates (Tri)),
                Destination => Constants.TriSwitch_Area (Tri));
        end loop;
    end Draw;

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

    procedure Initialize is
    begin
        SDL.Image.Open (
            Fname => New_String ("res/Switches/1S.png"),
            Img => BiImages (1, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/1C.png"),
            Img => BiImages (1, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/2S.png"),
            Img => BiImages (2, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/2C.png"),
            Img => BiImages (2, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/3S.png"),
            Img => BiImages (3, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/3C.png"),
            Img => BiImages (3, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/4S.png"),
            Img => BiImages (4, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/4C.png"),
            Img => BiImages (4, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/5S.png"),
            Img => BiImages (5, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/5C.png"),
            Img => BiImages (5, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/6S.png"),
            Img => BiImages (6, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/6C.png"),
            Img => BiImages (6, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/7S.png"),
            Img => BiImages (7, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/7C.png"),
            Img => BiImages (7, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/8S.png"),
            Img => BiImages (8, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/8C.png"),
            Img => BiImages (8, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/9S.png"),
            Img => BiImages (9, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/9C.png"),
            Img => BiImages (9, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/10S.png"),
            Img => BiImages (10, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/10C.png"),
            Img => BiImages (10, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/11S.png"),
            Img => BiImages (11, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/11C.png"),
            Img => BiImages (11, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/12S.png"),
            Img => BiImages (12, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/12C.png"),
            Img => BiImages (12, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/13S.png"),
            Img => BiImages (13, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/13C.png"),
            Img => BiImages (13, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/14S.png"),
            Img => BiImages (14, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/14C.png"),
            Img => BiImages (14, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/15S.png"),
            Img => BiImages (15, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/15C.png"),
            Img => BiImages (15, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/16S.png"),
            Img => BiImages (16, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/16C.png"),
            Img => BiImages (16, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/17S.png"),
            Img => BiImages (17, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/17C.png"),
            Img => BiImages (17, BISWITCH_CURVED));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/18S.png"),
            Img => BiImages (18, BISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/18C.png"),
            Img => BiImages (18, BISWITCH_CURVED));

        SDL.Image.Open (
            Fname => New_String ("res/Switches/NL.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_LEFT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/NR.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_RIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/NS.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/ND.png"),
            Img => TriImages (NORTH_SWITCH, TRISWITCH_DERAIL));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SL.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_LEFT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SR.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_RIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SS.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_STRAIGHT));
        SDL.Image.Open (
            Fname => New_String ("res/Switches/SD.png"),
            Img => TriImages (SOUTH_SWITCH, TRISWITCH_DERAIL));
    end Initialize;

    function Next_BiSwitch (Switch : BiSwitch) return BiSwitchState is
    begin
        if BiStates (Switch) = BISWITCH_CURVED then
            BiStates (Switch) := BISWITCH_STRAIGHT;
        else
            BiStates (Switch) := BISWITCH_CURVED;
        end if;
        return BiStates (Switch);
    end Next_BiSwitch;

    function Next_TriSwitch (Switch : TriSwitch) return TriSwitchState is
    begin
        case TriStates (Switch) is
            when TRISWITCH_LEFT => TriStates (Switch) := TRISWITCH_STRAIGHT;
            when TRISWITCH_STRAIGHT => TriStates (Switch) := TRISWITCH_RIGHT;
            when TRISWITCH_RIGHT => TriStates (Switch) := TRISWITCH_DERAIL;
            when TRISWITCH_DERAIL => TriStates (Switch) := TRISWITCH_LEFT;
        end case;
        return TriStates (Switch);
    end Next_TriSwitch;

    function Parse_Switch_Id (A, B : Character) return GenericSwitch is
        Value : Integer := 0;
        Return_Value : GenericSwitch;
    begin
        if A >= '0' and A <= '9' then
            Value := Character'Pos (A) - Character'Pos ('0');
        elsif A >= 'a' and A <= 'f' then
            Value := Character'Pos (A) - Character'Pos ('a') + 10;
        elsif A >= 'A' and A <= 'F' then
            Value := Character'Pos (A) - Character'Pos ('A') + 10;
        end if;

        Value := Value * 16;

        if B >= '0' and B <= '9' then
            Value := Value + Character'Pos (B) - Character'Pos ('0');
        elsif B >= 'a' and B <= 'f' then
            Value := Value + Character'Pos (B) - Character'Pos ('a') + 10;
        elsif B >= 'A' and B <= 'F' then
            Value := Value + Character'Pos (B) - Character'Pos ('A') + 10;
        end if;

        if Value <= 18 then
            Return_Value := (
                IsTri => False,
                Bi => BiSwitch (Value));
        else
            --  Includes short-coded options
            case Value is
                when 19 | 16#99# =>
                    Return_Value := (
                        IsTri => True,
                        Tri => SOUTH_SWITCH,
                        Left => True);
                when 20 | 16#9A# =>
                    Return_Value := (
                        IsTri => True,
                        Tri => SOUTH_SWITCH,
                        Left => False);
                when 21 | 16#9B# =>
                    Return_Value := (
                        IsTri => True,
                        Tri => NORTH_SWITCH,
                        Left => False);
                when 22 | 16#9C# =>
                    Return_Value := (
                        IsTri => True,
                        Tri => NORTH_SWITCH,
                        Left => True);
                when others =>
                    Put_Line ("Error: Invalid switch - " &
                        Integer'Image (Value));
            end case;
        end if;

        return Return_Value;
    end Parse_Switch_Id;

    procedure Set_Switch (Which : GenericSwitch; Curved : Boolean) is
    begin
        if Which.IsTri then
            case TriStates (Which.Tri) is
                when TRISWITCH_LEFT =>
                    if Which.Left and not Curved then
                        TriStates (Which.Tri) := TRISWITCH_STRAIGHT;
                    end if;
                    if not Which.Left and Curved then
                        TriStates (Which.Tri) := TRISWITCH_DERAIL;
                    end if;
                when TRISWITCH_STRAIGHT =>
                    if Curved then
                        if Which.Left then
                            TriStates (Which.Tri) := TRISWITCH_LEFT;
                        else
                            TriStates (Which.Tri) := TRISWITCH_RIGHT;
                        end if;
                    end if;
                when TRISWITCH_RIGHT =>
                    if Which.Left and Curved then
                        TriStates (Which.Tri) := TRISWITCH_DERAIL;
                    end if;
                    if not Which.Left and not Curved then
                        TriStates (Which.Tri) := TRISWITCH_STRAIGHT;
                    end if;
                when TRISWITCH_DERAIL =>
                    if not Curved then
                        if Which.Left then
                            TriStates (Which.Tri) := TRISWITCH_RIGHT;
                        else
                            TriStates (Which.Tri) := TRISWITCH_LEFT;
                        end if;
                    end if;
            end case;
        else
            if Curved then
                BiStates (Which.Bi) := BISWITCH_CURVED;
            else
                BiStates (Which.Bi) := BISWITCH_STRAIGHT;
            end if;
        end if;
    end Set_Switch;
end Switches;
