with GNAT.Serial_Communications; use GNAT.Serial_Communications;
with Ada.Text_IO; use Ada.Text_IO;
with SDL; use SDL;
with Interfaces.C.Strings; use Interfaces.C.Strings;

procedure Main is
    Com2 : aliased Serial_Port;
    Load_Message : String := "load -h 10.15.167.5 " & ASCII.Quotation &
    "ARM/laburke/kernel.elf" & ASCII.Quotation & ASCII.CR;
    Init_Error : chars_ptr;
    Window_Title : chars_ptr :=
        New_String ("Taggart Transcontinental Control Terminal");
    Window_Width : constant := 1000;
    Window_Height : constant := 600;
    SDL_Error_Title : chars_ptr :=
        New_String ("Error Initializing SDL");
begin
    Init_Error := Initialize;
    if Init_Error /= Null_Ptr then
        Error_Popup (
            Title => SDL_Error_Title,
            Message => Init_Error);
        return;
    end if;

    Open_Window (
        Width => Window_Width,
        Height => Window_Height,
        Title => Window_Title);

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
    Finalize;

exception
    when Serial_Error =>
        Error_Popup (
            Title => New_String ("COM Error"),
            Message =>
                New_String ("Could not open port 1: " &
                    "is the serial line connected?"));
        Finalize;
end Main;
