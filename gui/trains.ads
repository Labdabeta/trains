package Trains is
    type Train_Id is range -1 .. 80;

    function Parse_Id (A, B : Character) return Train_Id;
end Trains;
