with SDL.Image;

package Switches is
    type BiSwitch is range 1 .. 18;
    type BiSwitchState is (BISWITCH_STRAIGHT, BISWITCH_CURVED);

    type TriSwitch is (NORTH_SWITCH, SOUTH_SWITCH);
    type TriSwitchState is (TRISWITCH_LEFT, TRISWITCH_STRAIGHT,
        TRISWITCH_RIGHT);

    procedure Initialize;

    procedure Finalize;

    procedure Draw_BiSwitch (
        Switch : BiSwitch;
        State : BiSwitchState);

    procedure Draw_TriSwitch (
        Switch : TriSwitch;
        State : TriSwitchState);

    procedure Handle_Click;

    procedure Draw;
private
    BiStates : aliased array (BiSwitch) of BiSwitchState :=
        (others => BISWITCH_CURVED);
    TriStates : aliased array (TriSwitch) of TriSwitchState :=
        (others => TRISWITCH_LEFT);
    BiImages : array (BiSwitch, BiSwitchState) of SDL.Image.Image;
    TriImages : array (TriSwitch, TriSwitchState) of SDL.Image.Image;

end Switches;
