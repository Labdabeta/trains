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
	.file	"pq.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pq_swap, %function
pq_swap:
.LFB4:
	.file 1 "src/util/data/pq.c"
	.loc 1 5 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	.loc 1 6 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	.loc 1 7 0
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	.loc 1 8 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	.loc 1 9 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	.loc 1 10 0
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	.loc 1 11 0
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	.loc 1 12 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE4:
	.size	pq_swap, .-pq_swap
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	bubbleDown, %function
bubbleDown:
.LFB5:
	.loc 1 15 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	.loc 1 16 0
	mvn	r3, #0
	str	r3, [fp, #-8]
	.loc 1 17 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 1 19 0
	b	.L3
.L6:
.LBB2:
	.loc 1 20 0
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	.loc 1 21 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-16]
	.loc 1 22 0
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	.loc 1 24 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L4
	.loc 1 25 0 discriminator 1
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	.loc 1 24 0 discriminator 1
	cmp	r2, r3
	bge	.L4
	.loc 1 26 0
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
.L4:
	.loc 1 27 0
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L5
	.loc 1 28 0 discriminator 1
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	.loc 1 27 0 discriminator 1
	cmp	r2, r3
	bge	.L5
	.loc 1 29 0
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
.L5:
	.loc 1 31 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L3
	.loc 1 32 0
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	add	r0, r3, #4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r1, r3
	bl	pq_swap(PLT)
.L3:
.LBE2:
	.loc 1 19 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L6
	.loc 1 34 0
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
.LFE5:
	.size	bubbleDown, .-bubbleDown
	.align	2
	.global	pqPop
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqPop, %function
pqPop:
.LFB6:
	.loc 1 37 0
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
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	.loc 1 38 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	.loc 1 39 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L9
	.loc 1 40 0
	ldr	r3, [fp, #-8]
	add	r0, r3, #4
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r1, r3
	bl	pq_swap(PLT)
	.loc 1 41 0
	ldr	r0, [fp, #-8]
	bl	bubbleDown(PLT)
.L9:
	.loc 1 43 0
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
.LFE6:
	.size	pqPop, .-pqPop
	.align	2
	.global	pqInsert
	.syntax unified
	.arm
	.fpu softvfp
	.type	pqInsert, %function
pqInsert:
.LFB7:
	.loc 1 46 0
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
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	.loc 1 47 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-16]
	str	r1, [r2]
	str	r3, [fp, #-8]
	.loc 1 48 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	.loc 1 49 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	str	r2, [r3, #8]
	.loc 1 50 0
	b	.L11
.L13:
	.loc 1 51 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	add	r0, r3, #4
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	asr	r3, r3, #1
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r1, r3
	bl	pq_swap(PLT)
	.loc 1 52 0
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	asr	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	.loc 1 50 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L14
	.loc 1 50 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	asr	r3, r3, #1
	ldr	r2, [fp, #-16]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L13
.L14:
	.loc 1 54 0 is_stmt 1
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
.LFE7:
	.size	pqInsert, .-pqInsert
.Letext0:
	.file 2 "src/util/data/pq.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1b3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0xc
	.4byte	.LASF18
	.4byte	.LASF19
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x8
	.byte	0x2
	.byte	0x8
	.4byte	0x4a
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x9
	.4byte	0x4a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0xa
	.4byte	0x4a
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x4
	.byte	0x2
	.byte	0xd
	.4byte	0x76
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0xe
	.4byte	0x4a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0xf
	.4byte	0x76
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	0x25
	.4byte	0x85
	.uleb128 0x6
	.4byte	0x85
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x8
	.4byte	.LASF3
	.byte	0x2
	.byte	0x10
	.4byte	0x51
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x1
	.byte	0x2d
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe4
	.uleb128 0xa
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0xe4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2d
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.4byte	.LASF1
	.byte	0x1
	.byte	0x2d
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF9
	.byte	0x1
	.byte	0x2f
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x8c
	.uleb128 0x9
	.4byte	.LASF8
	.byte	0x1
	.byte	0x24
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10d
	.uleb128 0xa
	.ascii	"pq\000"
	.byte	0x1
	.byte	0x24
	.4byte	0xe4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF14
	.byte	0x1
	.byte	0xe
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x172
	.uleb128 0xa
	.ascii	"pq\000"
	.byte	0x1
	.byte	0xe
	.4byte	0xe4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.4byte	.LASF10
	.byte	0x1
	.byte	0x10
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF11
	.byte	0x1
	.byte	0x11
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x1
	.byte	0x15
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x1
	.byte	0x16
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b0
	.uleb128 0xa
	.ascii	"q1\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.ascii	"q2\000"
	.byte	0x1
	.byte	0x4
	.4byte	0x1b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x6
	.4byte	0x4a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.4byte	0x25
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
.LASF8:
	.ascii	"pqPop\000"
.LASF4:
	.ascii	"size\000"
.LASF12:
	.ascii	"left\000"
.LASF16:
	.ascii	"temp\000"
.LASF11:
	.ascii	"current\000"
.LASF6:
	.ascii	"prio\000"
.LASF13:
	.ascii	"right\000"
.LASF15:
	.ascii	"pq_swap\000"
.LASF0:
	.ascii	"priority\000"
.LASF14:
	.ascii	"bubbleDown\000"
.LASF9:
	.ascii	"nodeIndex\000"
.LASF1:
	.ascii	"data\000"
.LASF2:
	.ascii	"PriorityQueueElement\000"
.LASF19:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF3:
	.ascii	"PriorityQueue\000"
.LASF18:
	.ascii	"src/util/data/pq.c\000"
.LASF10:
	.ascii	"prev\000"
.LASF7:
	.ascii	"pqInsert\000"
.LASF17:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF5:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
