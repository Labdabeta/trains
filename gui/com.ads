with GNAT.Serial_Communications;

package Com is
    procedure Initialize;
    procedure Finalize;
    procedure Putc (C : Character);
    function Getc return Character;
private
    Com : aliased GNAT.Serial_Communications.Serial_Port;
end Com;
