with SDL_Keys;
with SDL.Font;
with SDL.Image;
with Constants;
with Ada.Text_IO;

package Input_Processor is
    procedure Initialize;
    procedure Finalize;
    function Process (C : Character) return Boolean;
    procedure Process_Click;
    procedure Process_Keyboard (Key : SDL_Keys.Key);
    procedure Draw;
private
    Init : Boolean := False;
    Args : array (1 .. 3) of Character := (others => ASCII.NUL);
    Input_Args : Constants.Long_Command_String := (others => ' ');
    Input_Args_Length : Integer := 1;
    Input_Length : Integer := 1;
    Is_Log : Boolean := False;
    Log_Type : Integer := 0;
    Next_Arg : Integer := 1;
    Command : Constants.Command_String := (others => ' ');
    Command_Length : Integer := 1;
    --  Some circular buffer spilled on the Ada from the C
    Command_History : array (0 .. Constants.Command_History_Length - 1) of
        Constants.Command_String := (others => (others => ' '));
    Command_Length_History : array (0 .. Constants.Command_History_Length - 1)
        of Integer := (others => 0);
    Current_History_Idx : Integer := 0;
    Current_Command_Idx : Integer := 0;
    Previous_Line : array (0 .. Constants.Message_Height - 1) of
        Constants.Command_String := (others => (others => ' '));
    Previous_Line_Image : array (0 .. Constants.Message_Height - 1) of
        SDL.Image.Image := (others => SDL.Image.Null_Image);
    Previous_Line_Idx : Integer := 0; --  This is the top of the screen
    Command_Image : SDL.Image.Image := SDL.Image.Null_Image;
    Prompt_Image : SDL.Image.Image := SDL.Image.Null_Image;
    The_Font : SDL.Font.SDL_Font;
    Log_File : Ada.Text_IO.File_Type;
end Input_Processor;
