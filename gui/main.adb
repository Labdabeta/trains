with GNAT.Serial_Communications; use GNAT.Serial_Communications;
with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Main, Gtk.Window;

procedure Main is
    Com2 : aliased Serial_Port;
    Load_Message : String := "load -h 10.15.167.5 " & ASCII.Quotation &
    "ARM/laburke/kernel.elf" & ASCII.Quotation & ASCII.CR;
    Window : Gtk.Window.Gtk_Window;
begin
    Gtk.Main.Init;
    Gtk.Window.Gtk_New (Window);
    Gtk.Window.Show (Window);
    Gtk.Main.Main;
    Open (
        Port => Com2,
        Name => Name (1));
    Set (
        Port => Com2,
        Rate => B115200,
        Bits => CS8,
        Stop_Bits => One,
        Parity => None,
        Block => True);

    String'Write (Com2'Access, Load_Message);
    declare
        task Reader;
        task Writer;

        task body Reader is
            C : Character;
        begin
            loop
                Character'Read (Com2'Access, C);
                Put (C);
            end loop;
        end Reader;

        task body Writer is
            C : Character;
            A : Boolean;
        begin
            loop
                Get_Immediate (C, A);
                if A then
                    Character'Write (Com2'Access, C);
                end if;
            end loop;
        end Writer;
    begin
        null;
    end;

    Close (Com2);

    Qt_Ada.Application.Finalize;
exception
    when Serial_Error =>
        Put_Line ("Could not open port 1: is the serial line connected?");
end Main;
