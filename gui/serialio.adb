with GNAT.Serial_Communications; use GNAT.Serial_Communications;

package body SerialIO is

    procedure Close_Serial_Port (Port : in Serial_Port) is begin
        Close (Port);
    end Close_Serial_Port;

    function Get_Serial_Port return Serial_Port is
        Port : Serial_Port;
    begin
        Open (Port => Port, Name => Name (1));
        Set (
            Port => Port,
            Rate => B115200,
            Bits => CS8,
            Stop_Bits => One,
            Parity => None,
            Block => False,
            Timeout => 0.0);
        return Port;
    end Get_Serial_Port;

end SerialIO;
