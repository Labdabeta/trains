with SDL.Image;

package Switches is
    type BiSwitch is range 1 .. 18;
    type BiSwitchState is (BISWITCH_STRAIGHT, BISWITCH_CURVED);

    type TriSwitch is (NORTH_SWITCH, SOUTH_SWITCH);
    type TriSwitchState is (TRISWITCH_LEFT, TRISWITCH_STRAIGHT,
        TRISWITCH_RIGHT, TRISWITCH_DERAIL);

    type GenericSwitch (IsTri : Boolean := False) is
        record
            case IsTri is
                when True =>
                    Tri : TriSwitch;
                    Left : Boolean;
                when False =>
                    Bi : BiSwitch;
            end case;
        end record;

    function Parse_Switch_Id (A, B : Character) return GenericSwitch;

    procedure Initialize;

    procedure Finalize;

    function Next_BiSwitch (Switch : BiSwitch) return BiSwitchState;

    function Next_TriSwitch (Switch : TriSwitch) return TriSwitchState;

    procedure Set_Switch (Which : GenericSwitch; Curved : Boolean);

    procedure Draw;
private
    BiStates : aliased array (BiSwitch) of BiSwitchState :=
        (others => BISWITCH_CURVED);
    TriStates : aliased array (TriSwitch) of TriSwitchState :=
        (others => TRISWITCH_LEFT);
    BiImages : array (BiSwitch, BiSwitchState) of SDL.Image.Image;
    TriImages : array (TriSwitch, TriSwitchState) of SDL.Image.Image;

end Switches;
