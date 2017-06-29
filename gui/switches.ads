package Switches is
    type BiSwitch is range 1 .. 18;
    type BiSwitchState is (BISWITCH_STRAIGHT, BISWITCH_CURVED);

    type TriSwitch is (NORTH_SWITCH, SOUTH_SWITCH);
    type TriSwitchState is (TRISWITCH_LEFT, TRISWITCH_STRAIGHT,
        TRISWITCH_RIGHT);

    procedure Initialize;

    procedure Draw_BiSwitch (
        Switch : BiSwitch;
        State : BiSwitchState);

    procedure Draw_TriSwitch (
        Switch : TriSwitch;
        State : TriSwitchState);
end Switches;
