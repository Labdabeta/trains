with Interfaces.C;
with Interfaces.C.Strings;

package Com is
    function Initialize (
        Port : in Interfaces.C.Strings.chars_ptr)
        return Interfaces.C.Strings.chars_ptr;
    function Finalize return Interfaces.C.Strings.chars_ptr;
    function Getc return Integer;
    procedure Putc (C : in Character);

    pragma Import (C, Initialize, "initCom2");
    pragma Import (C, Finalize, "quitTerminals");
    pragma Import (C, Getc, "com2_getc");
    pragma Import (C, Putc, "com2_putc");
end Com;
