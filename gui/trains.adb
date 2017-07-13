package body Trains is
    function Parse_Id (A, B : Character) return Train_Id is
        Return_Value : Train_Id;
    begin
        if A = '?' or B = '?' then
            return -1;
        end if;

        case A is
            when '0' => Return_Value := 16#00#;
            when '1' => Return_Value := 16#10#;
            when '2' => Return_Value := 16#20#;
            when '3' => Return_Value := 16#30#;
            when '4' => Return_Value := 16#40#;
            when others => return -1;
        end case;

        case B is
            when '0' => return Return_Value;
            when '1' => return Return_Value + 1;
            when '2' => return Return_Value + 2;
            when '3' => return Return_Value + 3;
            when '4' => return Return_Value + 4;
            when '5' => return Return_Value + 5;
            when '6' => return Return_Value + 6;
            when '7' => return Return_Value + 7;
            when '8' => return Return_Value + 8;
            when '9' => return Return_Value + 9;
            when 'a' => return Return_Value + 10;
            when 'b' => return Return_Value + 11;
            when 'c' => return Return_Value + 12;
            when 'd' => return Return_Value + 13;
            when 'e' => return Return_Value + 14;
            when 'f' => return Return_Value + 15;
            when 'A' => return Return_Value + 10;
            when 'B' => return Return_Value + 11;
            when 'C' => return Return_Value + 12;
            when 'D' => return Return_Value + 13;
            when 'E' => return Return_Value + 14;
            when 'F' => return Return_Value + 15;
            when others => return -1;
        end case;
    end Parse_Id;
end Trains;
