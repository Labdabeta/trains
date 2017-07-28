pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__io_exceptions_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "ada__strings_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "interfaces__c_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "interfaces__c__strings_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "system__os_lib_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__tags_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__streams_E");
   E082 : Short_Integer; pragma Import (Ada, E082, "system__file_control_block_E");
   E075 : Short_Integer; pragma Import (Ada, E075, "system__finalization_root_E");
   E073 : Short_Integer; pragma Import (Ada, E073, "ada__finalization_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "system__file_io_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__storage_pools_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__finalization_masters_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "ada__calendar_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "ada__text_io_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__strings__maps_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "system__pool_global_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "gnat__serial_communications_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "sdl_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "sdl__image_E");
   E094 : Short_Integer; pragma Import (Ada, E094, "sensors_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "switches_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "constants_E");
   E137 : Short_Integer; pragma Import (Ada, E137, "reservations_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "trains_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "input_processor_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E104 := E104 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "gnat__serial_communications__finalize_spec");
      begin
         F1;
      end;
      E110 := E110 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__pool_global__finalize_spec");
      begin
         F2;
      end;
      E064 := E064 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      E116 := E116 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__finalization_masters__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E072 := E072 - 1;
         F5;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E067 := E067 + 1;
      Ada.Strings'Elab_Spec;
      E127 := E127 + 1;
      Interfaces.C'Elab_Spec;
      E077 := E077 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E085 := E085 + 1;
      System.Os_Lib'Elab_Body;
      E079 := E079 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E051 := E051 + 1;
      Ada.Streams'Elab_Spec;
      E066 := E066 + 1;
      System.File_Control_Block'Elab_Spec;
      E082 := E082 + 1;
      System.Finalization_Root'Elab_Spec;
      E075 := E075 + 1;
      Ada.Finalization'Elab_Spec;
      E073 := E073 + 1;
      System.File_Io'Elab_Body;
      E072 := E072 + 1;
      System.Storage_Pools'Elab_Spec;
      E114 := E114 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E116 := E116 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E124 := E124 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E064 := E064 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E131 := E131 + 1;
      System.Pool_Global'Elab_Spec;
      E110 := E110 + 1;
      Gnat.Serial_Communications'Elab_Spec;
      E104 := E104 + 1;
      E088 := E088 + 1;
      E096 := E096 + 1;
      Sensors'Elab_Spec;
      Switches'Elab_Spec;
      Constants'Elab_Spec;
      E086 := E086 + 1;
      E094 := E094 + 1;
      E099 := E099 + 1;
      Reservations'Elab_Spec;
      E137 := E137 + 1;
      E153 := E153 + 1;
      Input_Processor'Elab_Spec;
      E122 := E122 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/com.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/sdl_keys.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/sdl.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/sdl-image.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/sdl-font.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/constants.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/sensors.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/switches.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/reservations.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/trains.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/input_processor.o
   --   /home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/main.o
   --   -L/home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/
   --   -L/home/louis/csassignments/cs452/kernel/cs452_kernel/gui/objects/
   --   -L/usr/lib/gcc/x86_64-pc-linux-gnu/7.1.1/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
