package Input_Processor is
    procedure Process (C : Character);
    procedure Process_Click;
private
    Init : Boolean := False;
    Args : array (1 .. 5) of Character := (others => ASCII.NUL);
    Next_Arg : Integer := 1;
end Input_Processor;
