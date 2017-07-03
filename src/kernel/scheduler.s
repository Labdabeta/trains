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
	.file	"scheduler.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initScheduler
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScheduler, %function
initScheduler:
.LFB4:
	.file 1 "src/kernel/scheduler.c"
	.loc 1 6 0
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
	.loc 1 8 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	.loc 1 9 0
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 1 10 0
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	.loc 1 11 0 discriminator 3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	asr	r3, r2, #31
	lsr	r3, r3, #29
	add	r2, r2, r3
	and	r2, r2, #7
	sub	r3, r2, r3
	mov	r2, r3
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r0, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r0, r3
	str	r1, [r3, #4]
	.loc 1 10 0 discriminator 3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	.loc 1 10 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	ble	.L4
	.loc 1 8 0 is_stmt 1 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 8 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L5
	.loc 1 13 0 is_stmt 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #288]
	.loc 1 14 0
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
	.size	initScheduler, .-initScheduler
.Letext0:
	.file 2 "src/util/data/buffer.h"
	.file 3 "src/kernel/task.h"
	.file 4 "src/kernel/scheduler.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x31e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0xc
	.4byte	.LASF40
	.4byte	.LASF41
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
	.4byte	.LASF42
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
	.4byte	.LASF42
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
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x24
	.byte	0x4
	.byte	0x9
	.4byte	0x291
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x4
	.byte	0xb
	.4byte	0x232
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x4
	.byte	0xe
	.4byte	0x291
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	0x2a1
	.4byte	0x2a1
	.uleb128 0xd
	.4byte	0x248
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x26c
	.uleb128 0xe
	.4byte	.LASF37
	.2byte	0x124
	.byte	0x4
	.byte	0x11
	.4byte	0x2ce
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x4
	.byte	0x12
	.4byte	0x2ce
	.byte	0
	.uleb128 0xf
	.4byte	.LASF38
	.byte	0x4
	.byte	0x13
	.4byte	0x2a1
	.2byte	0x120
	.byte	0
	.uleb128 0xc
	.4byte	0x26c
	.4byte	0x2de
	.uleb128 0xd
	.4byte	0x248
	.byte	0x7
	.byte	0
	.uleb128 0x10
	.4byte	.LASF43
	.byte	0x1
	.byte	0x5
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31b
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0x5
	.4byte	0x31b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.ascii	"ii\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2a7
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
	.uleb128 0xf
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
.LASF31:
	.ascii	"ticks\000"
.LASF37:
	.ascii	"Scheduler\000"
.LASF39:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF34:
	.ascii	"RunQueue\000"
.LASF5:
	.ascii	"TaskFrame\000"
.LASF26:
	.ascii	"obtQueueHead\000"
.LASF19:
	.ascii	"stack\000"
.LASF24:
	.ascii	"recvQueueTail\000"
.LASF14:
	.ascii	"STATE_EVENT_BLOCKED\000"
.LASF2:
	.ascii	"truncated\000"
.LASF1:
	.ascii	"data_len\000"
.LASF30:
	.ascii	"state\000"
.LASF12:
	.ascii	"STATE_OBTAIN_BLOCKED\000"
.LASF23:
	.ascii	"recvQueueHead\000"
.LASF0:
	.ascii	"data\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF16:
	.ascii	"TaskDescriptor\000"
.LASF36:
	.ascii	"queues\000"
.LASF22:
	.ascii	"parent\000"
.LASF8:
	.ascii	"STATE_SEND_BLOCKED\000"
.LASF25:
	.ascii	"nextRecv\000"
.LASF43:
	.ascii	"initScheduler\000"
.LASF42:
	.ascii	"TaskState\000"
.LASF18:
	.ascii	"rval\000"
.LASF21:
	.ascii	"priority\000"
.LASF35:
	.ascii	"head\000"
.LASF9:
	.ascii	"STATE_RECV_BLOCKED\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"obtQueueTail\000"
.LASF33:
	.ascii	"long long unsigned int\000"
.LASF38:
	.ascii	"active\000"
.LASF28:
	.ascii	"nextObt\000"
.LASF40:
	.ascii	"src/kernel/scheduler.c\000"
.LASF41:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF32:
	.ascii	"sizetype\000"
.LASF4:
	.ascii	"Buffer\000"
.LASF13:
	.ascii	"STATE_RESPOND_BLOCKED\000"
.LASF10:
	.ascii	"STATE_REPL_BLOCKED\000"
.LASF17:
	.ascii	"cpsr\000"
.LASF20:
	.ascii	"next\000"
.LASF6:
	.ascii	"STATE_ACTIVE\000"
.LASF7:
	.ascii	"STATE_ZOMBIE\000"
.LASF11:
	.ascii	"STATE_SHARE_BLOCKED\000"
.LASF29:
	.ascii	"share\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
