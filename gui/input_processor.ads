package Input_Processor is
    procedure Process (C : Character);
    procedure Process_Click;
private
    Init : Boolean := False;
    Args : array (1 .. 3) of Character := (others => ASCII.NUL);
    Command : Character := ASCII.NUL;
end Input_Processor;
