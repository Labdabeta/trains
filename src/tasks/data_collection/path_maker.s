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
	.file	"path_maker.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CLOCK\000"
	.align	2
.LC1:
	.ascii	"PATH\000"
	.text
	.align	2
	.global	path_maker
	.syntax unified
	.arm
	.fpu softvfp
	.type	path_maker, %function
path_maker:
.LFB0:
	.file 1 "src/tasks/data_collection/path_maker.c"
	.loc 1 4 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #176
	.loc 1 5 0
	bl	Service(PLT)
	.loc 1 9 0
	ldr	r3, .L5
.LPIC0:
	add	r3, pc, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	str	r0, [fp, #-12]
	.loc 1 11 0
	ldr	r3, .L5+4
.LPIC1:
	add	r3, pc, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
.L4:
	.loc 1 14 0
	sub	r1, fp, #180
	sub	r3, fp, #16
	mov	r2, #164
	mov	r0, r3
	bl	Receive(PLT)
	.loc 1 15 0
	ldr	r3, [fp, #-16]
	mov	r2, #0
	mov	r1, #0
	mov	r0, r3
	bl	Reply(PLT)
.LBB2:
	.loc 1 17 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	.loc 1 18 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-172]
	and	r2, r3, #255
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	ldr	r3, [r3, #-172]
	and	r3, r3, #255
	mov	r1, r3
	mov	r0, r2
	bl	tput2(PLT)
	.loc 1 19 0 discriminator 3
	mov	r1, #5
	ldr	r0, [fp, #-12]
	bl	Delay(PLT)
	.loc 1 17 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 17 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-180]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L3
.LBE2:
	.loc 1 21 0 is_stmt 1
	mov	r0, #32
	bl	tputc(PLT)
	.loc 1 14 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	.LC0-(.LPIC0+8)
	.word	.LC1-(.LPIC1+8)
	.cfi_endproc
.LFE0:
	.size	path_maker, .-path_maker
.Letext0:
	.file 2 "src/util/trains/track_data.h"
	.file 3 "src/util/trains/path_finder.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1f3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0xc
	.4byte	.LASF27
	.4byte	.LASF28
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.4byte	0x56
	.byte	0x2
	.byte	0x4
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x5
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0xb
	.4byte	0x25
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x12
	.4byte	0x73
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x30
	.byte	0x2
	.byte	0x1b
	.4byte	0xbc
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1c
	.4byte	0x117
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1d
	.4byte	0x5d
	.byte	0x4
	.uleb128 0x8
	.ascii	"num\000"
	.byte	0x2
	.byte	0x1e
	.4byte	0x110
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1f
	.4byte	0x10a
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x20
	.4byte	0x129
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x2
	.byte	0x13
	.4byte	0xc7
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x10
	.byte	0x2
	.byte	0x15
	.4byte	0x104
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x16
	.4byte	0x104
	.byte	0
	.uleb128 0x8
	.ascii	"src\000"
	.byte	0x2
	.byte	0x17
	.4byte	0x10a
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x17
	.4byte	0x10a
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x18
	.4byte	0x110
	.byte	0xc
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0xbc
	.uleb128 0x9
	.byte	0x4
	.4byte	0x68
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x9
	.byte	0x4
	.4byte	0x124
	.uleb128 0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0xb
	.4byte	0x11d
	.uleb128 0xc
	.4byte	0xbc
	.4byte	0x139
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0xc
	.4byte	0x68
	.4byte	0x150
	.uleb128 0xd
	.4byte	0x139
	.byte	0x8f
	.byte	0
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x2
	.byte	0x29
	.4byte	0x140
	.uleb128 0xc
	.4byte	0x110
	.4byte	0x16b
	.uleb128 0xd
	.4byte	0x139
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0xa4
	.byte	0x3
	.byte	0xe
	.4byte	0x19c
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x3
	.byte	0xf
	.4byte	0x110
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x3
	.byte	0x10
	.4byte	0x15b
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x3
	.byte	0x11
	.4byte	0x15b
	.byte	0x54
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF22
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x1
	.byte	0x4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0x8
	.4byte	0x16b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
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
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
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
	.byte	0x1
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
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
.LASF4:
	.ascii	"NODE_ENTER\000"
.LASF12:
	.ascii	"track_edge\000"
.LASF13:
	.ascii	"dest\000"
.LASF23:
	.ascii	"caller\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"route\000"
.LASF11:
	.ascii	"edge\000"
.LASF3:
	.ascii	"NODE_MERGE\000"
.LASF1:
	.ascii	"NODE_SENSOR\000"
.LASF30:
	.ascii	"path_maker\000"
.LASF18:
	.ascii	"PathSwitchPositions\000"
.LASF7:
	.ascii	"track_node\000"
.LASF21:
	.ascii	"positions\000"
.LASF2:
	.ascii	"NODE_BRANCH\000"
.LASF20:
	.ascii	"stations\000"
.LASF16:
	.ascii	"char\000"
.LASF8:
	.ascii	"name\000"
.LASF19:
	.ascii	"length\000"
.LASF0:
	.ascii	"NODE_NONE\000"
.LASF25:
	.ascii	"clock_tid\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"type\000"
.LASF22:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"src/tasks/data_collection/path_maker.c\000"
.LASF28:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF14:
	.ascii	"dist\000"
.LASF10:
	.ascii	"reverse\000"
.LASF29:
	.ascii	"track_nodes\000"
.LASF5:
	.ascii	"NODE_EXIT\000"
.LASF26:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF6:
	.ascii	"node_type\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
