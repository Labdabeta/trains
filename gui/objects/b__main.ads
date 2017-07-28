pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 7.1.1 20170630" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#ee264441#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#7ec093d3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#c0061b29#;
   pragma Export (C, u00005, "ada__command_lineB");
   u00006 : constant Version_32 := 16#9c1a321d#;
   pragma Export (C, u00006, "ada__command_lineS");
   u00007 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00007, "systemS");
   u00008 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00008, "system__secondary_stackB");
   u00009 : constant Version_32 := 16#fca7137e#;
   pragma Export (C, u00009, "system__secondary_stackS");
   u00010 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00010, "system__parametersB");
   u00011 : constant Version_32 := 16#381fe17b#;
   pragma Export (C, u00011, "system__parametersS");
   u00012 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#d8b13451#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#c2326fda#;
   pragma Export (C, u00014, "ada__exceptionsB");
   u00015 : constant Version_32 := 16#6e98a13f#;
   pragma Export (C, u00015, "ada__exceptionsS");
   u00016 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerB");
   u00017 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerS");
   u00018 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00018, "system__exception_tableB");
   u00019 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00019, "system__exception_tableS");
   u00020 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00020, "system__exceptionsB");
   u00021 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00021, "system__exceptionsS");
   u00022 : constant Version_32 := 16#843d48dc#;
   pragma Export (C, u00022, "system__exceptions__machineS");
   u00023 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00023, "system__exceptions_debugB");
   u00024 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00024, "system__exceptions_debugS");
   u00025 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00025, "system__img_intB");
   u00026 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00026, "system__img_intS");
   u00027 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00027, "system__storage_elementsB");
   u00028 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00028, "system__storage_elementsS");
   u00029 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00029, "system__tracebackB");
   u00030 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00030, "system__tracebackS");
   u00031 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00031, "system__traceback_entriesB");
   u00032 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00032, "system__traceback_entriesS");
   u00033 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00033, "system__traceback__symbolicB");
   u00034 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00034, "system__traceback__symbolicS");
   u00035 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00035, "ada__exceptions__tracebackB");
   u00036 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00036, "ada__exceptions__tracebackS");
   u00037 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00037, "system__address_imageB");
   u00038 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00038, "system__address_imageS");
   u00039 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00039, "system__wch_conB");
   u00040 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00040, "system__wch_conS");
   u00041 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00041, "system__wch_stwB");
   u00042 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00042, "system__wch_stwS");
   u00043 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00043, "system__wch_cnvB");
   u00044 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00044, "system__wch_cnvS");
   u00045 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00045, "interfacesS");
   u00046 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00046, "system__wch_jisB");
   u00047 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00047, "system__wch_jisS");
   u00048 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00048, "system__stack_checkingB");
   u00049 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00049, "system__stack_checkingS");
   u00050 : constant Version_32 := 16#3d17c74c#;
   pragma Export (C, u00050, "ada__tagsB");
   u00051 : constant Version_32 := 16#5a4e344a#;
   pragma Export (C, u00051, "ada__tagsS");
   u00052 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00052, "system__htableB");
   u00053 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00053, "system__htableS");
   u00054 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00054, "system__string_hashB");
   u00055 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00055, "system__string_hashS");
   u00056 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00056, "system__unsigned_typesS");
   u00057 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00057, "system__val_lluB");
   u00058 : constant Version_32 := 16#0841c7f5#;
   pragma Export (C, u00058, "system__val_lluS");
   u00059 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00059, "system__val_utilB");
   u00060 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00060, "system__val_utilS");
   u00061 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00061, "system__case_utilB");
   u00062 : constant Version_32 := 16#623c85d3#;
   pragma Export (C, u00062, "system__case_utilS");
   u00063 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00063, "ada__text_ioB");
   u00064 : constant Version_32 := 16#e1e47390#;
   pragma Export (C, u00064, "ada__text_ioS");
   u00065 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00065, "ada__streamsB");
   u00066 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00066, "ada__streamsS");
   u00067 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00067, "ada__io_exceptionsS");
   u00068 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00068, "interfaces__c_streamsB");
   u00069 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00069, "interfaces__c_streamsS");
   u00070 : constant Version_32 := 16#36a43a0a#;
   pragma Export (C, u00070, "system__crtlS");
   u00071 : constant Version_32 := 16#d542d957#;
   pragma Export (C, u00071, "system__file_ioB");
   u00072 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00072, "system__file_ioS");
   u00073 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00073, "ada__finalizationS");
   u00074 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00074, "system__finalization_rootB");
   u00075 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00075, "system__finalization_rootS");
   u00076 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00076, "interfaces__cB");
   u00077 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00077, "interfaces__cS");
   u00078 : constant Version_32 := 16#957a1bdd#;
   pragma Export (C, u00078, "system__os_libB");
   u00079 : constant Version_32 := 16#5913ca02#;
   pragma Export (C, u00079, "system__os_libS");
   u00080 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00080, "system__stringsB");
   u00081 : constant Version_32 := 16#388afd62#;
   pragma Export (C, u00081, "system__stringsS");
   u00082 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00082, "system__file_control_blockS");
   u00083 : constant Version_32 := 16#597e3f92#;
   pragma Export (C, u00083, "comS");
   u00084 : constant Version_32 := 16#56258f93#;
   pragma Export (C, u00084, "interfaces__c__stringsB");
   u00085 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00085, "interfaces__c__stringsS");
   u00086 : constant Version_32 := 16#59f1ba9b#;
   pragma Export (C, u00086, "constantsS");
   u00087 : constant Version_32 := 16#44ffbea9#;
   pragma Export (C, u00087, "sdlB");
   u00088 : constant Version_32 := 16#a9eb10dd#;
   pragma Export (C, u00088, "sdlS");
   u00089 : constant Version_32 := 16#1e40f010#;
   pragma Export (C, u00089, "system__fat_fltS");
   u00090 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00090, "ada__charactersS");
   u00091 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00091, "ada__characters__latin_1S");
   u00092 : constant Version_32 := 16#b3e2f5b5#;
   pragma Export (C, u00092, "sdl_keysS");
   u00093 : constant Version_32 := 16#42b3ae1c#;
   pragma Export (C, u00093, "sensorsB");
   u00094 : constant Version_32 := 16#54b36604#;
   pragma Export (C, u00094, "sensorsS");
   u00095 : constant Version_32 := 16#adb6025c#;
   pragma Export (C, u00095, "sdl__imageB");
   u00096 : constant Version_32 := 16#975d7253#;
   pragma Export (C, u00096, "sdl__imageS");
   u00097 : constant Version_32 := 16#3872f91d#;
   pragma Export (C, u00097, "system__fat_lfltS");
   u00098 : constant Version_32 := 16#acc7d8ea#;
   pragma Export (C, u00098, "switchesB");
   u00099 : constant Version_32 := 16#b5a168bc#;
   pragma Export (C, u00099, "switchesS");
   u00100 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00100, "system__concat_2B");
   u00101 : constant Version_32 := 16#44953bd4#;
   pragma Export (C, u00101, "system__concat_2S");
   u00102 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00102, "gnatS");
   u00103 : constant Version_32 := 16#399f7a54#;
   pragma Export (C, u00103, "gnat__serial_communicationsB");
   u00104 : constant Version_32 := 16#90a90beb#;
   pragma Export (C, u00104, "gnat__serial_communicationsS");
   u00105 : constant Version_32 := 16#266b1267#;
   pragma Export (C, u00105, "gnat__os_libS");
   u00106 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00106, "system__communicationB");
   u00107 : constant Version_32 := 16#5f55b9d6#;
   pragma Export (C, u00107, "system__communicationS");
   u00108 : constant Version_32 := 16#69418a44#;
   pragma Export (C, u00108, "system__os_constantsS");
   u00109 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00109, "system__pool_globalB");
   u00110 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00110, "system__pool_globalS");
   u00111 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00111, "system__memoryB");
   u00112 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00112, "system__memoryS");
   u00113 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00113, "system__storage_poolsB");
   u00114 : constant Version_32 := 16#65d872a9#;
   pragma Export (C, u00114, "system__storage_poolsS");
   u00115 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00115, "system__finalization_mastersB");
   u00116 : constant Version_32 := 16#1dc9d5ce#;
   pragma Export (C, u00116, "system__finalization_mastersS");
   u00117 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00117, "system__img_boolB");
   u00118 : constant Version_32 := 16#b3ec9def#;
   pragma Export (C, u00118, "system__img_boolS");
   u00119 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00119, "system__ioB");
   u00120 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00120, "system__ioS");
   u00121 : constant Version_32 := 16#bbe292d1#;
   pragma Export (C, u00121, "input_processorB");
   u00122 : constant Version_32 := 16#3e736a83#;
   pragma Export (C, u00122, "input_processorS");
   u00123 : constant Version_32 := 16#0d7f1a43#;
   pragma Export (C, u00123, "ada__calendarB");
   u00124 : constant Version_32 := 16#5b279c75#;
   pragma Export (C, u00124, "ada__calendarS");
   u00125 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00125, "system__os_primitivesB");
   u00126 : constant Version_32 := 16#ccbafd72#;
   pragma Export (C, u00126, "system__os_primitivesS");
   u00127 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00127, "ada__stringsS");
   u00128 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00128, "ada__strings__fixedB");
   u00129 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00129, "ada__strings__fixedS");
   u00130 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00130, "ada__strings__mapsB");
   u00131 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00131, "ada__strings__mapsS");
   u00132 : constant Version_32 := 16#e95cd909#;
   pragma Export (C, u00132, "system__bit_opsB");
   u00133 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00133, "system__bit_opsS");
   u00134 : constant Version_32 := 16#60da0992#;
   pragma Export (C, u00134, "ada__strings__searchB");
   u00135 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00135, "ada__strings__searchS");
   u00136 : constant Version_32 := 16#2ad46d00#;
   pragma Export (C, u00136, "reservationsB");
   u00137 : constant Version_32 := 16#9564c1b4#;
   pragma Export (C, u00137, "reservationsS");
   u00138 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00138, "system__concat_3B");
   u00139 : constant Version_32 := 16#4d45b0a1#;
   pragma Export (C, u00139, "system__concat_3S");
   u00140 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00140, "system__concat_6B");
   u00141 : constant Version_32 := 16#94f2c1b6#;
   pragma Export (C, u00141, "system__concat_6S");
   u00142 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00142, "system__concat_5B");
   u00143 : constant Version_32 := 16#c16baf2a#;
   pragma Export (C, u00143, "system__concat_5S");
   u00144 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00144, "system__concat_4B");
   u00145 : constant Version_32 := 16#3851c724#;
   pragma Export (C, u00145, "system__concat_4S");
   u00146 : constant Version_32 := 16#276453b7#;
   pragma Export (C, u00146, "system__img_lldB");
   u00147 : constant Version_32 := 16#b517e56d#;
   pragma Export (C, u00147, "system__img_lldS");
   u00148 : constant Version_32 := 16#bd3715ff#;
   pragma Export (C, u00148, "system__img_decB");
   u00149 : constant Version_32 := 16#e818e5df#;
   pragma Export (C, u00149, "system__img_decS");
   u00150 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00150, "system__img_lliB");
   u00151 : constant Version_32 := 16#577ab9d5#;
   pragma Export (C, u00151, "system__img_lliS");
   u00152 : constant Version_32 := 16#890767db#;
   pragma Export (C, u00152, "trainsB");
   u00153 : constant Version_32 := 16#d5c7e58c#;
   pragma Export (C, u00153, "trainsS");
   u00154 : constant Version_32 := 16#6f719019#;
   pragma Export (C, u00154, "sdl__fontS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_dec%s
   --  system.img_dec%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_lld%s
   --  system.img_lld%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  ada.exceptions.last_chance_handler%b
   --  system.soft_links%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.command_line%s
   --  ada.command_line%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  interfaces.c.strings%s
   --  interfaces.c.strings%b
   --  system.os_constants%s
   --  system.os_lib%s
   --  system.os_lib%b
   --  gnat.os_lib%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.communication%s
   --  system.communication%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.serial_communications%s
   --  gnat.serial_communications%b
   --  com%s
   --  sdl_keys%s
   --  sdl%s
   --  sdl%b
   --  sdl.image%s
   --  sdl.image%b
   --  sdl.font%s
   --  sensors%s
   --  switches%s
   --  constants%s
   --  sensors%b
   --  switches%b
   --  reservations%s
   --  reservations%b
   --  trains%s
   --  trains%b
   --  input_processor%s
   --  input_processor%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;
