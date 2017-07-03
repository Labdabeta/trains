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
	.file	"track.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	2
.LC0:
	.byte	5
	.byte	15
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTrack, %function
initTrack:
.LFB0:
	.file 1 "src/util/trains/track.c"
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
	.loc 1 9 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	.loc 1 10 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r2, .L4
.LPIC0:
	add	r2, pc, r2
	lsl	r3, r3, #1
	add	r3, r1, r3
	ldrh	r2, [r2]	@ movhi
	strh	r2, [r3]	@ movhi
	.loc 1 11 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, .L4+4
.LPIC1:
	add	r2, pc, r2
	ldrh	r2, [r2]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	.loc 1 12 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, .L4+8
.LPIC2:
	add	r2, pc, r2
	ldrh	r2, [r2]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	.loc 1 13 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #46
	lsl	r3, r3, #2
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3, #4]
	.loc 1 14 0 discriminator 3
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	add	r2, r2, #78
	mvn	r1, #0
	str	r1, [r3, r2, lsl #2]
	.loc 1 15 0 discriminator 3
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #108
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 16 0 discriminator 3
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	add	r2, r2, #636
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	.loc 1 18 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #684
	mov	r2, #0
	str	r2, [r3]
	.loc 1 19 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #688
	mov	r2, #0
	str	r2, [r3]
	.loc 1 20 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #692
	mov	r2, #0
	str	r2, [r3]
	.loc 1 21 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #696
	mov	r2, #0
	str	r2, [r3]
	.loc 1 22 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #700
	mov	r2, #0
	str	r2, [r3]
	.loc 1 23 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #704
	mov	r2, #0
	str	r2, [r3]
	.loc 1 24 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #708
	mov	r2, #0
	str	r2, [r3]
	.loc 1 25 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #712
	mov	r2, #0
	str	r2, [r3]
	.loc 1 26 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #716
	mov	r2, #0
	str	r2, [r3]
	.loc 1 27 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #720
	mov	r2, #0
	str	r2, [r3]
	.loc 1 28 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #724
	mov	r2, #0
	str	r2, [r3]
	.loc 1 29 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #728
	mov	r2, #0
	str	r2, [r3]
	.loc 1 30 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #732
	mov	r2, #0
	str	r2, [r3]
	.loc 1 31 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #736
	mov	r2, #0
	str	r2, [r3]
	.loc 1 32 0 discriminator 3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	add	r3, r3, #740
	mov	r2, #0
	str	r2, [r3]
	.loc 1 9 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	.loc 1 9 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #30
	ble	.L3
	.loc 1 35 0 is_stmt 1
	ldr	r3, [fp, #-16]
	mvn	r2, #0
	str	r2, [r3, #2668]
	.loc 1 36 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LC0-(.LPIC0+8)
	.word	.LC0-(.LPIC1+8)
	.word	.LC0-(.LPIC2+8)
	.cfi_endproc
.LFE0:
	.size	initTrack, .-initTrack
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getNextLocation, %function
getNextLocation:
.LFB1:
	.loc 1 41 0
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
	strh	r1, [fp, #-28]	@ movhi
	.loc 1 43 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2668]
	mov	r1, r3
	ldr	r0, [fp, #-28]
	bl	getNextSensor(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [fp, #-16]	@ movhi
	.loc 1 46 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L7
.L12:
	.loc 1 47 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L8
	.loc 1 47 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #7]
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	cmp	r2, r3
	bne	.L8
	.loc 1 47 0 discriminator 3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #5
	bne	.L9
.L8:
	.loc 1 48 0 is_stmt 1 discriminator 5
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r2, [r3, #64]	@ zero_extendqisi2
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	.loc 1 47 0 discriminator 5
	cmp	r2, r3
	bne	.L10
	.loc 1 48 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #65]
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-15]
	and	r3, r3, #15
	and	r3, r3, #255
	cmp	r2, r3
	bne	.L10
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L10
.L9:
	.loc 1 49 0 is_stmt 1
	ldr	r3, .L14
.LPIC3:
	add	r3, pc, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-12]	@ movhi
	b	.L13
.L10:
	.loc 1 46 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L7:
	.loc 1 46 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #30
	ble	.L12
	.loc 1 52 0 is_stmt 1
	ldrh	r3, [fp, #-16]	@ movhi
	strh	r3, [fp, #-12]	@ movhi
.L13:
	mov	r3, #0
	ldrb	r2, [fp, #-12]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #255
	orr	r3, r2, r3
	ldrb	r2, [fp, #-11]	@ zero_extendqisi2
	and	r2, r2, #255
	bic	r3, r3, #65280
	lsl	r2, r2, #8
	orr	r3, r2, r3
	.loc 1 53 0 discriminator 1
	mov	r0, r3	@ movhi
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC0-(.LPIC3+8)
	.cfi_endproc
.LFE1:
	.size	getNextLocation, .-getNextLocation
	.global	__aeabi_idiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	doSensorHit, %function
doSensorHit:
.LFB2:
	.loc 1 56 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	.loc 1 57 0
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #2668]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r2, [r3]
	mov	r3, #0
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	ror	r3, r3, #16
	mov	r0, r3
	bl	getDistanceToNext(PLT)
	str	r0, [fp, #-16]
	.loc 1 58 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #46
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	.loc 1 60 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	add	r2, r2, #636
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	beq	.L17
	.loc 1 62 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #108
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r4, [r3, #4]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv(PLT)
.LVL0:
	mov	r3, r0
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	add	r3, r3, r4
	add	r3, r3, #170
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r0, [r3, #4]
	.loc 1 63 0
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r0, r3
	lsl	r2, r2, #1
	add	r2, r1, r2
	ldrh	r3, [r3, #6]	@ movhi
	strh	r3, [r2]	@ movhi
	.loc 1 64 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	add	r2, r2, #14
	lsl	r4, r2, #2
	add	r4, r3, r4
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r2, [r3]
	mov	r3, #0
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	ror	r3, r3, #16
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	getNextLocation(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [r4, #6]	@ movhi
	.loc 1 65 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	add	r2, r2, #14
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldrh	r2, [r2, #6]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	.loc 1 66 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #46
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	str	r2, [r3, #4]
	.loc 1 71 0
	b	.L19
.L17:
	.loc 1 69 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	add	r2, r2, #636
	mov	r1, #1
	str	r1, [r3, r2, lsl #2]
.L19:
	.loc 1 71 0
	nop
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	doSensorHit, .-doSensorHit
	.align	2
	.global	initTrackA
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTrackA, %function
initTrackA:
.LFB3:
	.loc 1 74 0
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
	.loc 1 75 0
	bl	init_tracka(PLT)
	.loc 1 76 0
	mov	r0, #1
	bl	setSensorTrack(PLT)
	.loc 1 77 0
	ldr	r0, [fp, #-8]
	bl	initTrack(PLT)
	.loc 1 78 0
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
.LFE3:
	.size	initTrackA, .-initTrackA
	.align	2
	.global	initTrackB
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTrackB, %function
initTrackB:
.LFB4:
	.loc 1 81 0
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
	.loc 1 82 0
	bl	init_trackb(PLT)
	.loc 1 83 0
	mov	r0, #0
	bl	setSensorTrack(PLT)
	.loc 1 84 0
	ldr	r0, [fp, #-8]
	bl	initTrack(PLT)
	.loc 1 85 0
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
.LFE4:
	.size	initTrackB, .-initTrackB
	.align	2
	.global	addTrain
	.syntax unified
	.arm
	.fpu softvfp
	.type	addTrain, %function
addTrain:
.LFB5:
	.loc 1 88 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	strh	r2, [fp, #-32]	@ movhi
	.loc 1 89 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 1 91 0
	b	.L23
.L24:
	.loc 1 91 0 is_stmt 0 discriminator 2
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L23:
	.loc 1 91 0 discriminator 1
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	add	r2, r2, #78
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	blt	.L24
	.loc 1 93 0 is_stmt 1
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	add	r2, r2, #78
	ldr	r1, [fp, #-28]
	str	r1, [r3, r2, lsl #2]
	.loc 1 94 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r2, [fp, #-32]	@ movhi
	strh	r2, [r3]	@ movhi
	.loc 1 95 0
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	add	r2, r2, #14
	lsl	r4, r2, #2
	add	r4, r3, r4
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-24]
	bl	getNextLocation(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [r4, #6]	@ movhi
	.loc 1 96 0
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	add	r2, r2, #14
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldrh	r2, [r2, #6]	@ movhi
	strh	r2, [r3, #64]	@ movhi
	.loc 1 98 0
	ldr	r3, [fp, #-16]
	.loc 1 99 0
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
	.cfi_endproc
.LFE5:
	.size	addTrain, .-addTrain
	.align	2
	.global	saveSensorFlip
	.syntax unified
	.arm
	.fpu softvfp
	.type	saveSensorFlip, %function
saveSensorFlip:
.LFB6:
	.loc 1 102 0
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
	strh	r1, [fp, #-20]	@ movhi
	str	r2, [fp, #-24]
	.loc 1 105 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L27
.L31:
	.loc 1 106 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r2, [r3, #6]	@ zero_extendqisi2
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L28
	.loc 1 106 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #7]
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-19]
	and	r3, r3, #15
	and	r3, r3, #255
	cmp	r2, r3
	bne	.L28
	.loc 1 106 0 discriminator 2
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #6]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L28
	.loc 1 107 0 is_stmt 1
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-16]
	bl	doSensorHit(PLT)
	.loc 1 108 0
	ldr	r3, [fp, #-8]
	b	.L29
.L28:
	.loc 1 109 0
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r2, [r3, #64]	@ zero_extendqisi2
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L30
	.loc 1 109 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #65]
	and	r3, r3, #15
	and	r2, r3, #255
	ldrb	r3, [fp, #-19]
	and	r3, r3, #15
	and	r3, r3, #255
	cmp	r2, r3
	bne	.L30
	.loc 1 109 0 discriminator 2
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L30
	.loc 1 110 0 is_stmt 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #2
	add	r2, r1, r2
	ldrh	r2, [r2, #64]	@ movhi
	strh	r2, [r3, #6]	@ movhi
	.loc 1 111 0
	ldr	r3, [fp, #-8]
	b	.L29
.L30:
	.loc 1 105 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L27:
	.loc 1 105 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	cmp	r3, #30
	ble	.L31
	.loc 1 115 0 is_stmt 1
	mvn	r3, #0
.L29:
	.loc 1 116 0
	mov	r0, r3
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
	.size	saveSensorFlip, .-saveSensorFlip
	.align	2
	.global	saveSwitchFlip
	.syntax unified
	.arm
	.fpu softvfp
	.type	saveSwitchFlip, %function
saveSwitchFlip:
.LFB7:
	.loc 1 119 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #8
	.cfi_def_cfa 11, 4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	.loc 1 121 0
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L33
	.loc 1 122 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2668]
	mov	r1, #1
	ldr	r2, [fp, #-28]
	lsl	r2, r1, r2
	orr	r2, r3, r2
	ldr	r3, [fp, #-24]
	str	r2, [r3, #2668]
	b	.L34
.L33:
	.loc 1 124 0
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2668]
	mov	r1, #1
	ldr	r2, [fp, #-28]
	lsl	r2, r1, r2
	mvn	r2, r2
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #2668]
.L34:
	.loc 1 126 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L35
.L36:
	.loc 1 127 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #2668]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	add	r2, r2, #14
	lsl	r4, r2, #2
	add	r4, r3, r4
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrh	r2, [r3, #6]
	mov	r3, #0
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	ror	r3, r3, #16
	mov	r0, r3
	bl	getNextSensor(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [r4, #6]	@ movhi
	.loc 1 128 0 discriminator 3
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #2668]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	lsl	r4, r2, #2
	add	r4, r3, r4
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrh	r2, [r3, #64]
	mov	r3, #0
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	orr	r3, r3, r2
	ror	r3, r3, #16
	mov	r0, r3
	bl	getNextSensor(PLT)
	mov	r3, r0	@ movhi
	strh	r3, [r4, #64]	@ movhi
	.loc 1 126 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L35:
	.loc 1 126 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-16]
	cmp	r3, #30
	ble	.L36
	.loc 1 130 0 is_stmt 1
	nop
	sub	sp, fp, #8
	.cfi_def_cfa 13, 12
	@ sp needed
	pop	{r4, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE7:
	.size	saveSwitchFlip, .-saveSwitchFlip
	.align	2
	.global	saveSpeedChange
	.syntax unified
	.arm
	.fpu softvfp
	.type	saveSpeedChange, %function
saveSpeedChange:
.LFB8:
	.loc 1 133 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	.loc 1 134 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #108
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	.loc 1 135 0
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r2, r2, #140
	ldr	r1, [fp, #-20]
	str	r1, [r3, r2, lsl #2]
	.loc 1 136 0
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	add	r2, r2, #636
	mov	r1, #0
	str	r1, [r3, r2, lsl #2]
	.loc 1 137 0
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE8:
	.size	saveSpeedChange, .-saveSpeedChange
	.align	2
	.global	getTrainPosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	getTrainPosition, %function
getTrainPosition:
.LFB9:
	.loc 1 140 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 1 143 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	.loc 1 145 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #46
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-36]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	.loc 1 146 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #108
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r0, [r3, #4]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, #170
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	mul	r3, r2, r3
	ldr	r2, .L40
	smull	r1, r2, r3, r2
	asr	r2, r2, #5
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 1 147 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #14
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrh	r3, [r3, #6]	@ movhi
	strh	r3, [fp, #-18]	@ movhi
	.loc 1 148 0
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldrh	r3, [r3, #64]	@ movhi
	strh	r3, [fp, #-16]	@ movhi
	.loc 1 150 0
	ldr	r3, [fp, #-24]
	mov	ip, r3
	sub	r3, fp, #20
	ldm	r3, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	.loc 1 151 0
	ldr	r0, [fp, #-24]
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
.L41:
	.align	2
.L40:
	.word	1374389535
	.cfi_endproc
.LFE9:
	.size	getTrainPosition, .-getTrainPosition
	.align	2
	.global	getTrainVelocity
	.syntax unified
	.arm
	.fpu softvfp
	.type	getTrainVelocity, %function
getTrainVelocity:
.LFB10:
	.loc 1 154 0
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
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	.loc 1 157 0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #108
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r0, [r3, #4]
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	add	r3, r3, r0
	add	r3, r3, #170
	lsl	r3, r3, #2
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	.loc 1 158 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE10:
	.size	getTrainVelocity, .-getTrainVelocity
.Letext0:
	.file 2 "src/util/trains/track_data.h"
	.file 3 "src/util/trains/switches.h"
	.file 4 "src/util/trains/sensors.h"
	.file 5 "src/util/trains/track.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5eb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0xc
	.4byte	.LASF61
	.4byte	.LASF62
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
	.4byte	.LASF63
	.byte	0x2
	.byte	0x29
	.4byte	0x140
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x3
	.byte	0x5
	.4byte	0x166
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.4byte	0x56
	.byte	0x4
	.byte	0x8
	.4byte	0x1a2
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x5
	.byte	0
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x4
	.byte	0x8
	.4byte	0x16d
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x2
	.byte	0x4
	.byte	0xa
	.4byte	0x1d4
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x4
	.byte	0xb
	.4byte	0x1a2
	.byte	0
	.uleb128 0x10
	.ascii	"id\000"
	.byte	0x4
	.byte	0xc
	.4byte	0x166
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF29
	.2byte	0xa70
	.byte	0x5
	.byte	0xa
	.4byte	0x254
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x5
	.byte	0xb
	.4byte	0x259
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x5
	.byte	0xd
	.4byte	0x269
	.byte	0x3e
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x5
	.byte	0xe
	.4byte	0x27f
	.byte	0xbc
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x5
	.byte	0xf
	.4byte	0x27f
	.2byte	0x138
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x5
	.byte	0x10
	.4byte	0x27f
	.2byte	0x1b4
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x5
	.byte	0x11
	.4byte	0x27f
	.2byte	0x230
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x5
	.byte	0x12
	.4byte	0x28f
	.2byte	0x2ac
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x5
	.byte	0x13
	.4byte	0x27f
	.2byte	0x9f0
	.uleb128 0x12
	.4byte	.LASF38
	.byte	0x5
	.byte	0x14
	.4byte	0x15b
	.2byte	0xa6c
	.byte	0
	.uleb128 0xb
	.4byte	0x1d4
	.uleb128 0xc
	.4byte	0x1ad
	.4byte	0x269
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.4byte	0x1ad
	.4byte	0x27f
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1e
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	0x110
	.4byte	0x28f
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1e
	.byte	0
	.uleb128 0xc
	.4byte	0x110
	.4byte	0x2a5
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1e
	.uleb128 0xd
	.4byte	0x139
	.byte	0xe
	.byte	0
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0xc
	.byte	0x5
	.byte	0x17
	.4byte	0x2d6
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x5
	.byte	0x18
	.4byte	0x1ad
	.byte	0
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x5
	.byte	0x19
	.4byte	0x2d6
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x5
	.byte	0x1a
	.4byte	0x110
	.byte	0x8
	.byte	0
	.uleb128 0xc
	.4byte	0x1ad
	.4byte	0x2e6
	.uleb128 0xd
	.4byte	0x139
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x1
	.byte	0x99
	.4byte	0x110
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32a
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x99
	.4byte	0x32a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x99
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x99
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x254
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.byte	0x8b
	.4byte	0x2a5
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x390
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x8b
	.4byte	0x32a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x8b
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x8b
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x2a5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF48
	.byte	0x1
	.byte	0x91
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF49
	.byte	0x1
	.byte	0x84
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3de
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x84
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x84
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x1
	.byte	0x84
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x84
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x1d4
	.uleb128 0x18
	.4byte	.LASF50
	.byte	0x1
	.byte	0x76
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x42f
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x76
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.ascii	"sw\000"
	.byte	0x1
	.byte	0x76
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x76
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF52
	.byte	0x1
	.byte	0x65
	.4byte	0x110
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47f
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x65
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x65
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x65
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x67
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF54
	.byte	0x1
	.byte	0x57
	.4byte	0x110
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ce
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x57
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.ascii	"id\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x1
	.byte	0x57
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF56
	.byte	0x1
	.byte	0x50
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f2
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x50
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF57
	.byte	0x1
	.byte	0x49
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x516
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x49
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF64
	.byte	0x1
	.byte	0x37
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x572
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x37
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x37
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x37
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x16
	.4byte	.LASF58
	.byte	0x1
	.byte	0x39
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x1
	.byte	0x3a
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF65
	.byte	0x1
	.byte	0x28
	.4byte	0x1ad
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c2
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x28
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x1
	.byte	0x28
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x110
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x1ad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF66
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0x5
	.4byte	0x3de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x110
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
	.uleb128 0x10
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
.LASF46:
	.ascii	"getTrainVelocity\000"
.LASF66:
	.ascii	"initTrack\000"
.LASF12:
	.ascii	"track_edge\000"
.LASF4:
	.ascii	"NODE_ENTER\000"
.LASF33:
	.ascii	"realId\000"
.LASF60:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF59:
	.ascii	"duration\000"
.LASF57:
	.ascii	"initTrackA\000"
.LASF56:
	.ascii	"initTrackB\000"
.LASF44:
	.ascii	"train\000"
.LASF41:
	.ascii	"nextSensor\000"
.LASF42:
	.ascii	"distanceFromLast\000"
.LASF47:
	.ascii	"getTrainPosition\000"
.LASF7:
	.ascii	"track_node\000"
.LASF65:
	.ascii	"getNextLocation\000"
.LASF20:
	.ascii	"SG_A\000"
.LASF61:
	.ascii	"src/util/trains/track.c\000"
.LASF63:
	.ascii	"track_nodes\000"
.LASF58:
	.ascii	"distance\000"
.LASF13:
	.ascii	"dest\000"
.LASF15:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"reverse\000"
.LASF21:
	.ascii	"SG_B\000"
.LASF22:
	.ascii	"SG_C\000"
.LASF23:
	.ascii	"SG_D\000"
.LASF24:
	.ascii	"SG_E\000"
.LASF38:
	.ascii	"switches\000"
.LASF40:
	.ascii	"lastSensor\000"
.LASF3:
	.ascii	"NODE_MERGE\000"
.LASF52:
	.ascii	"saveSensorFlip\000"
.LASF28:
	.ascii	"group\000"
.LASF25:
	.ascii	"SG_N\000"
.LASF5:
	.ascii	"NODE_EXIT\000"
.LASF2:
	.ascii	"NODE_BRANCH\000"
.LASF55:
	.ascii	"location\000"
.LASF27:
	.ascii	"Sensor\000"
.LASF29:
	.ascii	"Track\000"
.LASF19:
	.ascii	"unsigned int\000"
.LASF39:
	.ascii	"Position\000"
.LASF16:
	.ascii	"char\000"
.LASF18:
	.ascii	"switch_state\000"
.LASF48:
	.ascii	"dtime\000"
.LASF54:
	.ascii	"addTrain\000"
.LASF1:
	.ascii	"NODE_SENSOR\000"
.LASF45:
	.ascii	"time\000"
.LASF14:
	.ascii	"dist\000"
.LASF32:
	.ascii	"lastRegister\000"
.LASF34:
	.ascii	"speed\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF11:
	.ascii	"edge\000"
.LASF62:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF64:
	.ascii	"doSensorHit\000"
.LASF6:
	.ascii	"node_type\000"
.LASF8:
	.ascii	"name\000"
.LASF0:
	.ascii	"NODE_NONE\000"
.LASF37:
	.ascii	"isData\000"
.LASF9:
	.ascii	"type\000"
.LASF50:
	.ascii	"saveSwitchFlip\000"
.LASF31:
	.ascii	"nextLocation\000"
.LASF51:
	.ascii	"isCurved\000"
.LASF53:
	.ascii	"sensor\000"
.LASF36:
	.ascii	"velocity\000"
.LASF49:
	.ascii	"saveSpeedChange\000"
.LASF35:
	.ascii	"whenSpeed\000"
.LASF30:
	.ascii	"lastLocation\000"
.LASF43:
	.ascii	"track\000"
.LASF26:
	.ascii	"SensorGroup\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
