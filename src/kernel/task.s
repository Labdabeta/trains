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
	.file	"task.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	setupTaskArray
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupTaskArray, %function
setupTaskArray:
.LFB1:
	.file 1 "src/kernel/task.c"
	.loc 1 9 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 11, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	.loc 1 11 0
	mov	r3, #33554432
	str	r3, [fp, #-12]
	.loc 1 13 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L8:
	.loc 1 14 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	.loc 1 15 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mvn	r2, #0
	str	r2, [r3, #24]
	.loc 1 16 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mvn	r2, #0
	str	r2, [r3, #4]
	.loc 1 17 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	.loc 1 18 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #20]
	.loc 1 19 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #28]
	.loc 1 20 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 21 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #16]
	.loc 1 22 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #1
	strb	r2, [r3, #72]
	.loc 1 23 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #32]
	.loc 1 24 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #36]
	.loc 1 25 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #40]
	.loc 1 26 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #64]
	.loc 1 27 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	mov	r2, #0
	str	r2, [r3, #68]
	.loc 1 28 0
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, r2
	mov	r3, #0
	mov	r4, #0
	str	r3, [r2, #80]
	str	r4, [r2, #84]
	.loc 1 30 0
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	bgt	.L3
	.loc 1 31 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #2097152
	str	r3, [fp, #-12]
	b	.L4
.L3:
	.loc 1 32 0
	ldr	r3, [fp, #-8]
	cmp	r3, #12
	bgt	.L5
	.loc 1 33 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1048576
	str	r3, [fp, #-12]
	b	.L4
.L5:
	.loc 1 34 0
	ldr	r3, [fp, #-8]
	cmp	r3, #27
	bgt	.L6
	.loc 1 35 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #262144
	str	r3, [fp, #-12]
	b	.L4
.L6:
	.loc 1 36 0
	ldr	r3, [fp, #-8]
	cmp	r3, #44
	bgt	.L7
	.loc 1 37 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #65536
	str	r3, [fp, #-12]
	b	.L4
.L7:
	.loc 1 39 0
	ldr	r3, [fp, #-12]
	sub	r3, r3, #16384
	str	r3, [fp, #-12]
.L4:
	.loc 1 13 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 13 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #74
	ble	.L8
	.loc 1 41 0 is_stmt 1
	nop
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{r4, fp}
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	setupTaskArray, .-setupTaskArray
	.align	2
	.global	activateTask
	.syntax unified
	.arm
	.fpu softvfp
	.type	activateTask, %function
activateTask:
.LFB2:
	.loc 1 44 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, .L10
.LPIC0:
	add	r3, pc, r3
	.loc 1 45 0
	ldr	r2, [fp, #-8]
	mov	r1, #80
	str	r1, [r2, #4]
	.loc 1 46 0
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #12]
	sub	r2, r2, #40
	mov	r1, r2
	ldr	r2, [fp, #-8]
	str	r1, [r2, #16]
	.loc 1 48 0
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #16]
	ldr	r1, .L10+4
	ldr	r1, [r3, r1]
	mov	r0, r1
	ldr	r1, .L10+8
	ldr	r3, [r3, r1]
	add	r3, r0, r3
	str	r3, [r2, #40]
	.loc 1 49 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 1 50 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+8)
	.word	CODE_BASE(GOT)
	.word	Exit(GOT)
	.cfi_endproc
.LFE2:
	.size	activateTask, .-activateTask
.Letext0:
	.file 2 "src/util/data/buffer.h"
	.file 3 "src/kernel/task.h"
	.file 4 "src/linker.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2f2
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
	.4byte	.LASF4
	.byte	0xc
	.byte	0x2
	.byte	0x5
	.4byte	0x56
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0x6
	.4byte	0x56
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x2
	.byte	0x7
	.4byte	0x58
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.4byte	0x5f
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2c
	.byte	0x3
	.byte	0x25
	.4byte	0xee
	.uleb128 0x7
	.ascii	"pc\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0
	.uleb128 0x7
	.ascii	"r4\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x7
	.ascii	"r5\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x7
	.ascii	"r6\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0xc
	.uleb128 0x7
	.ascii	"r7\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0x10
	.uleb128 0x7
	.ascii	"r8\000"
	.byte	0x3
	.byte	0x26
	.4byte	0x5f
	.byte	0x14
	.uleb128 0x7
	.ascii	"r9\000"
	.byte	0x3
	.byte	0x27
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x7
	.ascii	"r10\000"
	.byte	0x3
	.byte	0x27
	.4byte	0x5f
	.byte	0x1c
	.uleb128 0x7
	.ascii	"r11\000"
	.byte	0x3
	.byte	0x27
	.4byte	0x5f
	.byte	0x20
	.uleb128 0x7
	.ascii	"fp\000"
	.byte	0x3
	.byte	0x27
	.4byte	0x5f
	.byte	0x24
	.uleb128 0x7
	.ascii	"lr\000"
	.byte	0x3
	.byte	0x27
	.4byte	0x5f
	.byte	0x28
	.byte	0
	.uleb128 0x8
	.4byte	.LASF40
	.byte	0x1
	.4byte	0x135
	.byte	0x3
	.byte	0x2a
	.4byte	0x135
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
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x3
	.byte	0x34
	.4byte	0xee
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x58
	.byte	0x3
	.byte	0x36
	.4byte	0x22c
	.uleb128 0x7
	.ascii	"tid\000"
	.byte	0x3
	.byte	0x37
	.4byte	0x5f
	.byte	0
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3a
	.4byte	0x5f
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3b
	.4byte	0x5f
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x3
	.byte	0x3c
	.4byte	0x56
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x3d
	.4byte	0x22c
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x3
	.byte	0x40
	.4byte	0x232
	.byte	0x14
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x3
	.byte	0x41
	.4byte	0x5f
	.byte	0x18
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x3
	.byte	0x44
	.4byte	0x232
	.byte	0x1c
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0x47
	.4byte	0x232
	.byte	0x20
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x3
	.byte	0x48
	.4byte	0x232
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x3
	.byte	0x49
	.4byte	0x232
	.byte	0x28
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x3
	.byte	0x4a
	.4byte	0x232
	.byte	0x2c
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x3
	.byte	0x4b
	.4byte	0x232
	.byte	0x30
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x3
	.byte	0x4c
	.4byte	0x232
	.byte	0x34
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x3
	.byte	0x4d
	.4byte	0x238
	.byte	0x38
	.uleb128 0x7
	.ascii	"buf\000"
	.byte	0x3
	.byte	0x4e
	.4byte	0x24f
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x3
	.byte	0x4f
	.4byte	0x13c
	.byte	0x48
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x3
	.byte	0x52
	.4byte	0x265
	.byte	0x50
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x66
	.uleb128 0xb
	.byte	0x4
	.4byte	0x147
	.uleb128 0xc
	.4byte	0x56
	.4byte	0x248
	.uleb128 0xd
	.4byte	0x248
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF32
	.uleb128 0xc
	.4byte	0x25f
	.4byte	0x25f
	.uleb128 0xd
	.4byte	0x248
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF33
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x4
	.byte	0x4
	.4byte	0x277
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF34
	.uleb128 0xf
	.4byte	.LASF42
	.byte	0x1
	.byte	0x2b
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2af
	.uleb128 0x10
	.ascii	"td\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x232
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0x2b
	.4byte	0x2b6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x12
	.4byte	0x2b6
	.uleb128 0x13
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2af
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x8
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.ascii	"ta\000"
	.byte	0x1
	.byte	0x8
	.4byte	0x232
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0xa
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x1
	.byte	0xb
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.ascii	"STATE_ACTIVE\000"
.LASF31:
	.ascii	"ticks\000"
.LASF7:
	.ascii	"STATE_ZOMBIE\000"
.LASF9:
	.ascii	"STATE_RECV_BLOCKED\000"
.LASF30:
	.ascii	"state\000"
.LASF25:
	.ascii	"nextRecv\000"
.LASF32:
	.ascii	"sizetype\000"
.LASF11:
	.ascii	"STATE_SHARE_BLOCKED\000"
.LASF16:
	.ascii	"TaskDescriptor\000"
.LASF12:
	.ascii	"STATE_OBTAIN_BLOCKED\000"
.LASF13:
	.ascii	"STATE_RESPOND_BLOCKED\000"
.LASF27:
	.ascii	"obtQueueTail\000"
.LASF22:
	.ascii	"parent\000"
.LASF8:
	.ascii	"STATE_SEND_BLOCKED\000"
.LASF24:
	.ascii	"recvQueueTail\000"
.LASF18:
	.ascii	"rval\000"
.LASF1:
	.ascii	"data_len\000"
.LASF10:
	.ascii	"STATE_REPL_BLOCKED\000"
.LASF29:
	.ascii	"share\000"
.LASF40:
	.ascii	"TaskState\000"
.LASF35:
	.ascii	"entry\000"
.LASF43:
	.ascii	"setupTaskArray\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"TaskFrame\000"
.LASF26:
	.ascii	"obtQueueHead\000"
.LASF17:
	.ascii	"cpsr\000"
.LASF14:
	.ascii	"STATE_EVENT_BLOCKED\000"
.LASF36:
	.ascii	"task_base_address\000"
.LASF33:
	.ascii	"long long unsigned int\000"
.LASF42:
	.ascii	"activateTask\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF19:
	.ascii	"stack\000"
.LASF38:
	.ascii	"src/kernel/task.c\000"
.LASF39:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF28:
	.ascii	"nextObt\000"
.LASF34:
	.ascii	"char\000"
.LASF23:
	.ascii	"recvQueueHead\000"
.LASF0:
	.ascii	"data\000"
.LASF21:
	.ascii	"priority\000"
.LASF37:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF41:
	.ascii	"CODE_BASE\000"
.LASF4:
	.ascii	"Buffer\000"
.LASF20:
	.ascii	"next\000"
.LASF2:
	.ascii	"truncated\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
