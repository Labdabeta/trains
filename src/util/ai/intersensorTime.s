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
	.file	"intersensorTime.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initIST
	.syntax unified
	.arm
	.fpu softvfp
	.type	initIST, %function
initIST:
.LFB0:
	.file 1 "src/util/ai/intersensorTime.c"
	.loc 1 7 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-8]
	.loc 1 8 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r2, r3
	mov	r3, #20
	str	r3, [r2, #2096]
	.loc 1 9 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r2, r3
	mov	r3, #1
	str	r3, [r2, #2100]
	.loc 1 10 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #9792
	add	r3, r3, #48
	ldr	r2, [fp, #-8]
	add	r2, r2, #8192
	str	r3, [r2, #2104]
	.loc 1 11 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #10240
	ldr	r2, [fp, #-8]
	add	r2, r2, #8192
	str	r3, [r2, #2108]
	.loc 1 12 0
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	add	r2, r2, #8192
	str	r3, [r2, #2112]
	.loc 1 13 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #9728
	add	r3, r3, #32
	ldr	r2, [fp, #-8]
	add	r2, r2, #8192
	str	r3, [r2, #2116]
	.loc 1 14 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r2, #3
	strb	r2, [r3, #2120]
	.loc 1 15 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #8192
	mov	r2, #3
	strb	r2, [r3, #2121]
	.loc 1 16 0
	ldr	r3, [fp, #-8]
	add	r0, r3, #10240
	add	r0, r0, #20
	.loc 1 17 0
	ldr	r3, [fp, #-8]
	add	r1, r3, #10240
	add	r1, r1, #48
	ldr	r3, [fp, #-8]
	add	r3, r3, #10304
	add	r3, r3, #8
	ldr	r2, [fp, #-8]
	add	r2, r2, #10240
	add	r2, r2, #56
	ldr	ip, [fp, #-8]
	add	ip, ip, #10304
	.loc 1 16 0
	str	ip, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r1
	mov	r2, #2
	mov	r1, #122
	bl	mlpInit(PLT)
	.loc 1 18 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	initIST, .-initIST
	.global	__aeabi_i2f
	.global	__aeabi_fdiv
	.align	2
	.global	trainIST
	.syntax unified
	.arm
	.fpu softvfp
	.type	trainIST, %function
trainIST:
.LFB1:
	.loc 1 21 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	.loc 1 22 0
	ldr	r0, [fp, #-24]
	bl	__aeabi_i2f(PLT)
.LVL0:
	mov	r3, r0
	ldr	r1, .L3
	mov	r0, r3
	bl	__aeabi_fdiv(PLT)
.LVL1:
	mov	r3, r0
	str	r3, [fp, #-8]	@ float
	.loc 1 23 0
	ldr	r3, [fp, #-16]
	add	r0, r3, #10240
	add	r0, r0, #20
	sub	r2, fp, #8
	ldr	r3, .L3+4
	str	r3, [sp]	@ float
	mov	r3, r2
	mov	r2, #0
	ldr	r1, [fp, #-20]
	bl	network_train(PLT)
	.loc 1 24 0
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1120403456
	.word	1008981770
	.cfi_endproc
.LFE1:
	.size	trainIST, .-trainIST
	.global	__aeabi_f2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.align	2
	.global	getIST
	.syntax unified
	.arm
	.fpu softvfp
	.type	getIST, %function
getIST:
.LFB2:
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 1 29 0
	ldr	r3, [fp, #-24]
	add	r3, r3, #10240
	add	r3, r3, #20
	sub	r2, fp, #16
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	network_value(PLT)
	.loc 1 31 0
	ldr	r3, [fp, #-16]	@ float
	mov	r0, r3
	bl	__aeabi_f2d(PLT)
.LVL2:
	mov	r2, #0
	ldr	r3, .L7
	bl	__aeabi_dmul(PLT)
.LVL3:
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	__aeabi_d2iz(PLT)
.LVL4:
	mov	r3, r0
	.loc 1 32 0
	mov	r0, r3
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
.L8:
	.align	2
.L7:
	.word	1079574528
	.cfi_endproc
.LFE2:
	.size	getIST, .-getIST
.Letext0:
	.file 2 "src/util/ai/mlp.h"
	.file 3 "src/util/ai/intersensorTime.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x380
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0xc
	.4byte	.LASF38
	.4byte	.LASF39
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x14
	.byte	0x2
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x5
	.4byte	0x6e
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x6
	.4byte	0x75
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x7
	.4byte	0x7b
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.4byte	0x7b
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9
	.4byte	0x7b
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.4byte	0x7b
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	.LASF5
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x2
	.byte	0xa
	.4byte	0x8d
	.uleb128 0x5
	.byte	0x4
	.4byte	0x25
	.uleb128 0x8
	.4byte	.LASF40
	.byte	0x1
	.4byte	0xbc
	.byte	0x2
	.byte	0xc
	.4byte	0xbc
	.uleb128 0x9
	.4byte	.LASF6
	.byte	0
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF9
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.4byte	0x124
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x14
	.4byte	0x124
	.byte	0
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.4byte	0x6e
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x16
	.4byte	0x12a
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.4byte	0x130
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0x18
	.4byte	0x6e
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x19
	.4byte	0x6e
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x2
	.byte	0x1a
	.4byte	0x6e
	.byte	0x18
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x82
	.uleb128 0x5
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x5
	.byte	0x4
	.4byte	0x93
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1b
	.4byte	0xc3
	.uleb128 0xa
	.4byte	.LASF22
	.2byte	0x284c
	.byte	0x3
	.byte	0x10
	.4byte	0x1c2
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0x11
	.4byte	0x1c2
	.byte	0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.byte	0x12
	.4byte	0x1da
	.2byte	0x2620
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.byte	0x13
	.4byte	0x1ea
	.2byte	0x2670
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.byte	0x14
	.4byte	0x1fa
	.2byte	0x2800
	.uleb128 0xc
	.ascii	"nn\000"
	.byte	0x3
	.byte	0x15
	.4byte	0x136
	.2byte	0x2814
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.byte	0x16
	.4byte	0x20a
	.2byte	0x2830
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.byte	0x17
	.4byte	0x21a
	.2byte	0x2838
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x3
	.byte	0x18
	.4byte	0x22a
	.2byte	0x2840
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.byte	0x19
	.4byte	0x23a
	.2byte	0x2848
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x1d3
	.uleb128 0xe
	.4byte	0x1d3
	.2byte	0x987
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF28
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x1ea
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x25
	.4byte	0x1fa
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x13
	.byte	0
	.uleb128 0xd
	.4byte	0x25
	.4byte	0x20a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	0x6e
	.4byte	0x21a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x8d
	.4byte	0x22a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x75
	.4byte	0x23a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.4byte	0x93
	.4byte	0x24a
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x1
	.byte	0
	.uleb128 0xa
	.4byte	.LASF29
	.2byte	0x1e8
	.byte	0x3
	.byte	0x1c
	.4byte	0x28b
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x3
	.byte	0x1d
	.4byte	0x28b
	.byte	0
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x3
	.byte	0x1e
	.4byte	0x29b
	.2byte	0x140
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.byte	0x1f
	.4byte	0x2ab
	.2byte	0x198
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.byte	0x20
	.4byte	0x2bb
	.2byte	0x1b0
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x29b
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x4f
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2ab
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x15
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2bb
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0x5
	.byte	0
	.uleb128 0xd
	.4byte	0x7b
	.4byte	0x2cb
	.uleb128 0xf
	.4byte	0x1d3
	.byte	0xd
	.byte	0
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x1
	.byte	0x1a
	.4byte	0x6e
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30d
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1a
	.4byte	0x313
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0x1c
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x141
	.uleb128 0x5
	.byte	0x4
	.4byte	0x24a
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x1
	.byte	0x14
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x365
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF18
	.byte	0x1
	.byte	0x14
	.4byte	0x313
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.byte	0x14
	.4byte	0x6e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF36
	.byte	0x1
	.byte	0x16
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF43
	.byte	0x1
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x30d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x3
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
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
	.uleb128 0x12
	.uleb128 0x5
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
.LASF12:
	.ascii	"MultilayerPerceptron\000"
.LASF42:
	.ascii	"trainIST\000"
.LASF38:
	.ascii	"src/util/ai/intersensorTime.c\000"
.LASF37:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF7:
	.ascii	"AF_SOFTPLUS\000"
.LASF27:
	.ascii	"layerSizes\000"
.LASF8:
	.ascii	"AF_SIGMOID\000"
.LASF43:
	.ascii	"initIST\000"
.LASF1:
	.ascii	"weights\000"
.LASF3:
	.ascii	"last_output\000"
.LASF29:
	.ascii	"ISTNetworkInputs\000"
.LASF5:
	.ascii	"float\000"
.LASF11:
	.ascii	"PerceptronNode\000"
.LASF32:
	.ascii	"isTrain\000"
.LASF0:
	.ascii	"size\000"
.LASF14:
	.ascii	"numLayers\000"
.LASF21:
	.ascii	"NeuralNetwork\000"
.LASF6:
	.ascii	"AF_RELU\000"
.LASF33:
	.ascii	"isSpeed\000"
.LASF22:
	.ascii	"ISTNetwork\000"
.LASF10:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"AF_LINEAR\000"
.LASF34:
	.ascii	"realOutput\000"
.LASF30:
	.ascii	"isLast\000"
.LASF36:
	.ascii	"real\000"
.LASF18:
	.ascii	"inputs\000"
.LASF17:
	.ascii	"outputs\000"
.LASF4:
	.ascii	"last_doutput\000"
.LASF13:
	.ascii	"layers\000"
.LASF19:
	.ascii	"maxLayer\000"
.LASF28:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"layer_weights\000"
.LASF39:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF2:
	.ascii	"bias\000"
.LASF23:
	.ascii	"input_weights\000"
.LASF41:
	.ascii	"getIST\000"
.LASF31:
	.ascii	"isCurved\000"
.LASF26:
	.ascii	"output_layer\000"
.LASF20:
	.ascii	"NNLayer\000"
.LASF16:
	.ascii	"activators\000"
.LASF40:
	.ascii	"ActivationFunction\000"
.LASF35:
	.ascii	"output\000"
.LASF15:
	.ascii	"numNodes\000"
.LASF25:
	.ascii	"layer\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
