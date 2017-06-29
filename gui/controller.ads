with GNAT.Serial_Communications;
with SDL.Image;

package Controller is
    procedure Initialize (
        Name : GNAT.Serial_Communications.Port_Name;
        Load : String);

    procedure Close;

    task type Com_Controller;
    procedure Putc (C : Character);
private
    Com : aliased GNAT.Serial_Communications.Serial_Port;
end Controller;
