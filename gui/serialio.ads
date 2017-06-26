with GNAT.Serial_Communications;

package SerialIO is

    function Get_Serial_Port
        return GNAT.Serial_Communications.Serial_Port;

    procedure Close_Serial_Port (
        Port : in GNAT.Serial_Communications.Serial_Port);

end SerialIO;
