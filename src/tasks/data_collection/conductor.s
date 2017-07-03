	.cpu arm920t
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"conductor.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Conducting...\012\015\000"
	.align	2
.LC1:
	.ascii	"Result: %d\012\015\000"
	.text
	.align	2
	.global	conductor
	.syntax unified
	.arm
	.fpu softvfp
	.type	conductor, %function
conductor:
.LFB0:
	.file 1 "src/tasks/data_collection/conductor.c"
	.loc 1 10 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	.loc 1 11 0
	bl	init_tracka(PLT)
	.loc 1 12 0
	ldr	r3, .L2
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_printf(PLT)
	.loc 1 13 0
	mov	r3, #10
	mov	r2, #70
	mov	r1, #20
	mov	r0, #40
	bl	getAccurateStopTime(PLT)
	mov	r3, r0
	mov	r1, r3
	ldr	r3, .L2+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	tfp_printf(PLT)
	.loc 1 14 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE0:
	.size	conductor, .-conductor
.Letext0:
	.file 2 "src/util/trains/track_data.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x170
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0xc
	.4byte	.LASF20
	.4byte	.LASF21
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	0x33
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x1
	.4byte	0x25
	.byte	0x2
	.byte	0x4
	.4byte	0x77
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF5
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF6
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x5
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0xb
	.4byte	0x46
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x12
	.4byte	0x8d
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x30
	.byte	0x2
	.byte	0x1b
	.4byte	0xd6
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1c
	.4byte	0x12a
	.byte	0
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x2
	.byte	0x1d
	.4byte	0x77
	.byte	0x4
	.uleb128 0xa
	.ascii	"num\000"
	.byte	0x2
	.byte	0x1e
	.4byte	0x3f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x2
	.byte	0x1f
	.4byte	0x124
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0x20
	.4byte	0x130
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x2
	.byte	0x13
	.4byte	0xe1
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x10
	.byte	0x2
	.byte	0x15
	.4byte	0x11e
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x2
	.byte	0x16
	.4byte	0x11e
	.byte	0
	.uleb128 0xa
	.ascii	"src\000"
	.byte	0x2
	.byte	0x17
	.4byte	0x124
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.4byte	0x124
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x2
	.byte	0x18
	.4byte	0x3f
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xd6
	.uleb128 0xb
	.byte	0x4
	.4byte	0x82
	.uleb128 0xb
	.byte	0x4
	.4byte	0x3a
	.uleb128 0xc
	.4byte	0xd6
	.4byte	0x140
	.uleb128 0xd
	.4byte	0x2c
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	0x82
	.4byte	0x150
	.uleb128 0xd
	.4byte	0x2c
	.byte	0x8f
	.byte	0
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x2
	.byte	0x29
	.4byte	0x140
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF18
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x9
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"NODE_MERGE\000"
.LASF16:
	.ascii	"dest\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"dist\000"
.LASF4:
	.ascii	"NODE_SENSOR\000"
.LASF7:
	.ascii	"NODE_ENTER\000"
.LASF22:
	.ascii	"track_nodes\000"
.LASF9:
	.ascii	"node_type\000"
.LASF11:
	.ascii	"name\000"
.LASF13:
	.ascii	"reverse\000"
.LASF3:
	.ascii	"NODE_NONE\000"
.LASF20:
	.ascii	"src/tasks/data_collection/conductor.c\000"
.LASF15:
	.ascii	"track_edge\000"
.LASF23:
	.ascii	"conductor\000"
.LASF2:
	.ascii	"char\000"
.LASF10:
	.ascii	"track_node\000"
.LASF14:
	.ascii	"edge\000"
.LASF8:
	.ascii	"NODE_EXIT\000"
.LASF5:
	.ascii	"NODE_BRANCH\000"
.LASF21:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF12:
	.ascii	"type\000"
.LASF18:
	.ascii	"unsigned int\000"
.LASF19:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF1:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
