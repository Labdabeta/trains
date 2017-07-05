package SDL.Dialog is
    type Default_Button is (DEFAULT_ESCAPE, DEFAULT_ENTER);

    type Dialog is private;

    function Make_Dialog (
        Title : String;
        Message : String)
        return Dialog;

    --  Maximum of 8 buttons
    procedure Add_Button (
        Default : Default_Button;
        Text : String;
        Id : Integer;
        Which : in out Dialog);

    procedure Set_Background_Colour (
        Red : Uint8;
        Green : Uint8;
        Blue : Uint8;
        Which : in out Dialog);

    procedure Set_Text_Colour (
        Red : Uint8;
        Green : Uint8;
        Blue : Uint8;
        Which : in out Dialog);

    procedure Set_Button_Border_Colour (
        Red : Uint8;
        Green : Uint8;
        Blue : Uint8;
        Which : in out Dialog);

    procedure Set_Button_Background_Colour (
        Red : Uint8;
        Green : Uint8;
        Blue : Uint8;
        Which : in out Dialog);

    procedure Set_Button_Selected_Colour (
        Red : Uint8;
        Green : Uint8;
        Blue : Uint8;
        Which : in out Dialog);

    function Show_Dialog (
        Which : Dialog) return Integer;
private
    type Dialog is
        record
            Temp : Integer;
        end record;
end SDL.Dialog;
