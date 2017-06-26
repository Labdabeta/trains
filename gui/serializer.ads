with GNAT.Serial_Communications; use GNAT.Serial_Communications;

package Serializer is
    task type Reader is
        entry Start (Port : access Serial_Port);
    end Reader;

    task type Writer is
        entry Start (Port : access Serial_Port);
    end Writer;
end Serializer;
