with GNAT.Serial_Communications; use GNAT.Serial_Communications;
with Ada.Text_IO; use Ada.Text_IO;

package body Serializer is
    task body Reader is
        Com2 : access Serial_Port;
    begin
        Put_Line ("Reader created.");
        accept Start (Port : access Serial_Port) do
            Com2 := Port;
        end Start;
    end Reader;

    task body Writer is
        Com2 : access Serial_Port;
    begin
        Put_Line ("Writer created.");
        accept Start (Port : access Serial_Port) do
            Com2 := Port;
        end Start;
    end Writer;
end Serializer;
