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
	.file	"fuzzy.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	__aeabi_uidiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoInverse, %function
ztoInverse:
.LFB0:
	.file 1 "src/util/math/zto.h"
	.loc 1 14 0
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
	.loc 1 15 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L2
	.loc 1 15 0 is_stmt 0 discriminator 1
	mvn	r3, #0
	b	.L3
.L2:
	.loc 1 16 0 is_stmt 1
	ldr	r1, [fp, #-8]
	mvn	r0, #0
	bl	__aeabi_uidiv(PLT)
.LVL0:
	mov	r3, r0
.L3:
	.loc 1 17 0
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
.LFE0:
	.size	ztoInverse, .-ztoInverse
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoAdd, %function
ztoAdd:
.LFB1:
	.loc 1 20 0
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
	.loc 1 22 0
	sub	r2, fp, #8
	mov	r0, #0
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r1, r3
	ldr	r1, [fp, #-16]
	cmp	r3, r1
	bcs	.L5
	mov	r0, #1
.L5:
	str	r3, [r2]
	mov	r3, r0
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L7
	.loc 1 23 0
	mvn	r3, #0
	b	.L9
.L7:
	.loc 1 24 0
	ldr	r3, [fp, #-8]
.L9:
	.loc 1 25 0 discriminator 1
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE1:
	.size	ztoAdd, .-ztoAdd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoSub, %function
ztoSub:
.LFB2:
	.loc 1 28 0
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
	.loc 1 30 0
	sub	r2, fp, #8
	mov	r0, #0
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r1, r3
	ldr	r1, [fp, #-16]
	cmp	r3, r1
	bls	.L11
	mov	r0, #1
.L11:
	str	r3, [r2]
	mov	r3, r0
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L13
	.loc 1 31 0
	mov	r3, #0
	b	.L15
.L13:
	.loc 1 32 0
	ldr	r3, [fp, #-8]
.L15:
	.loc 1 33 0 discriminator 1
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE2:
	.size	ztoSub, .-ztoSub
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoMul, %function
ztoMul:
.LFB3:
	.loc 1 36 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, fp}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 11, -4
	add	fp, sp, #20
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	.loc 1 37 0
	ldr	r3, [fp, #-32]
	mov	r5, r3
	mov	r6, #0
	ldr	r3, [fp, #-36]
	mov	r1, r3
	mov	r2, #0
	mul	r0, r1, r6
	mul	r3, r5, r2
	add	r0, r0, r3
	umull	r3, r4, r5, r1
	add	r2, r0, r4
	mov	r4, r2
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	.loc 1 38 0
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	mov	r7, r4
	mov	r8, #0
	mov	r3, r7
	.loc 1 39 0
	mov	r0, r3
	sub	sp, fp, #20
	.cfi_def_cfa 13, 24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp}
	.cfi_restore 11
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE3:
	.size	ztoMul, .-ztoMul
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoTimes, %function
ztoTimes:
.LFB6:
	.loc 1 54 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, fp}
	.cfi_def_cfa_offset 24
	.cfi_offset 4, -24
	.cfi_offset 5, -20
	.cfi_offset 6, -16
	.cfi_offset 7, -12
	.cfi_offset 8, -8
	.cfi_offset 11, -4
	add	fp, sp, #20
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	.loc 1 55 0
	ldr	r3, [fp, #-32]
	mov	r5, r3
	mov	r6, #0
	ldr	r3, [fp, #-36]
	mov	r1, r3
	mov	r2, #0
	mul	r0, r1, r6
	mul	r3, r5, r2
	add	r0, r0, r3
	umull	r3, r4, r5, r1
	add	r2, r0, r4
	mov	r4, r2
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	.loc 1 56 0
	sub	r4, fp, #28
	ldmia	r4, {r3-r4}
	mov	r7, r4
	mov	r8, #0
	mov	r3, r7
	.loc 1 57 0
	mov	r0, r3
	sub	sp, fp, #20
	.cfi_def_cfa 13, 24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp}
	.cfi_restore 11
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE6:
	.size	ztoTimes, .-ztoTimes
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoMultiply, %function
ztoMultiply:
.LFB7:
	.loc 1 60 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	.loc 1 62 0
	sub	r0, fp, #16
	mov	r5, #0
	ldr	lr, [fp, #-24]
	ldr	ip, [fp, #-28]
	umull	r1, r2, lr, ip
	mov	r3, r2
	mov	r4, #0
	cmp	r3, #0
	beq	.L21
	mov	r5, #1
.L21:
	mov	r3, r1
	str	r3, [r0]
	mov	r3, r5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L23
	.loc 1 63 0
	mvn	r3, #0
	b	.L25
.L23:
	.loc 1 64 0
	ldr	r3, [fp, #-16]
.L25:
	.loc 1 65 0 discriminator 1
	mov	r0, r3
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE7:
	.size	ztoMultiply, .-ztoMultiply
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoInvert, %function
ztoInvert:
.LFB8:
	.loc 1 68 0
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
	.loc 1 69 0
	ldr	r3, [fp, #-8]
	mvn	r3, r3
	.loc 1 70 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE8:
	.size	ztoInvert, .-ztoInvert
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoMin, %function
ztoMin:
.LFB9:
	.loc 1 73 0
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
	.loc 1 74 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	movcc	r3, r2
	movcs	r3, r3
	.loc 1 75 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE9:
	.size	ztoMin, .-ztoMin
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoMax, %function
ztoMax:
.LFB10:
	.loc 1 78 0
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
	.loc 1 79 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	movcs	r3, r2
	movcc	r3, r3
	.loc 1 80 0
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
	.size	ztoMax, .-ztoMax
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ztoAddSub, %function
ztoAddSub:
.LFB11:
	.loc 1 83 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 11, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	.loc 1 84 0
	ldr	r3, [fp, #-16]
	mov	r1, r3
	mov	r2, #0
	ldr	r3, [fp, #-20]
	mov	r4, #0
	adds	r3, r3, r1
	adc	r4, r4, r2
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	.loc 1 85 0
	ldr	r3, [fp, #-24]
	mov	r4, #0
	sub	r2, fp, #12
	ldmia	r2, {r1-r2}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	str	r3, [fp, #-12]
	str	r4, [fp, #-8]
	.loc 1 86 0
	ldr	r3, [fp, #-12]
	.loc 1 87 0
	mov	r0, r3
	sub	sp, fp, #4
	.cfi_def_cfa 13, 8
	@ sp needed
	pop	{r4, fp}
	.cfi_restore 11
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE11:
	.size	ztoAddSub, .-ztoAddSub
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	calculateMembership, %function
calculateMembership:
.LFB12:
	.file 2 "src/util/ai/fuzzy.c"
	.loc 2 8 0
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
	str	r1, [fp, #-12]
	.loc 2 9 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L35
	.loc 2 10 0
	mov	r3, #0
	b	.L36
.L35:
	.loc 2 11 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L37
	.loc 2 13 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	sub	r3, r2, r3
	.loc 2 12 0
	mov	r0, r3
	bl	ztoInverse(PLT)
	.loc 2 14 0
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	.loc 2 12 0
	mov	r1, r3
	bl	ztoMultiply(PLT)
	mov	r3, r0
	b	.L36
.L37:
	.loc 2 15 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L38
	.loc 2 16 0
	mvn	r3, #0
	b	.L36
.L38:
	.loc 2 17 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L39
	.loc 2 19 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	.loc 2 18 0
	mov	r0, r3
	bl	ztoInverse(PLT)
	.loc 2 20 0
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	.loc 2 18 0
	mov	r1, r3
	bl	ztoMultiply(PLT)
	mov	r3, r0
	b	.L36
.L39:
	.loc 2 22 0
	mov	r3, #0
.L36:
	.loc 2 23 0
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
.LFE12:
	.size	calculateMembership, .-calculateMembership
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	calculateMembershipRange, %function
calculateMembershipRange:
.LFB13:
	.loc 2 26 0
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
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	.loc 2 27 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L41
	.loc 2 28 0
	ldr	r3, [fp, #-20]
	b	.L42
.L41:
	.loc 2 29 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L43
	.loc 2 30 0
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	ztoSub(PLT)
	mov	r4, r0
	.loc 2 33 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r2, r3
	.loc 2 30 0
	mov	r0, r3
	bl	ztoInverse(PLT)
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	ztoMul(PLT)
	.loc 2 34 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [fp, #-28]
	sub	r3, r2, r3
	.loc 2 30 0
	mov	r1, r3
	bl	ztoMultiply(PLT)
	mov	r3, r0
	b	.L42
.L43:
	.loc 2 35 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L44
	.loc 2 36 0
	ldr	r3, [fp, #-24]
	b	.L42
.L44:
	.loc 2 37 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L45
	.loc 2 38 0
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	ztoSub(PLT)
	mov	r4, r0
	.loc 2 41 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	sub	r3, r2, r3
	.loc 2 38 0
	mov	r0, r3
	bl	ztoInverse(PLT)
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	ztoMul(PLT)
	.loc 2 42 0
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	sub	r3, r2, r3
	.loc 2 38 0
	mov	r1, r3
	bl	ztoMultiply(PLT)
	mov	r3, r0
	b	.L42
.L45:
	.loc 2 44 0
	ldr	r3, [fp, #-20]
.L42:
	.loc 2 45 0
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
.LFE13:
	.size	calculateMembershipRange, .-calculateMembershipRange
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fuzzy_snorm, %function
fuzzy_snorm:
.LFB14:
	.loc 2 48 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, r2
	strb	r3, [fp, #-13]
	.loc 2 49 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L47
.L49:
	b	.L48
	b	.L50
	b	.L51
	b	.L52
	.p2align 1
.L48:
	.loc 2 51 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoMax(PLT)
	mov	r3, r0
	b	.L53
.L50:
	.loc 2 53 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoMul(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoAddSub(PLT)
	mov	r3, r0
	b	.L53
.L51:
	.loc 2 55 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoAdd(PLT)
	mov	r3, r0
	b	.L53
.L52:
	.loc 2 57 0
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L54
	.loc 2 58 0
	ldr	r3, [fp, #-8]
	b	.L53
.L54:
	.loc 2 59 0
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L55
	.loc 2 60 0
	ldr	r3, [fp, #-12]
	b	.L53
.L55:
	.loc 2 62 0
	mvn	r3, #0
	b	.L53
.L47:
	.loc 2 64 0
	mvn	r3, #0
.L53:
	.loc 2 65 0
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
.LFE14:
	.size	fuzzy_snorm, .-fuzzy_snorm
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fuzzy_tnorm, %function
fuzzy_tnorm:
.LFB15:
	.loc 2 68 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, r2
	strb	r3, [fp, #-13]
	.loc 2 69 0
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L57
.L59:
	b	.L58
	b	.L60
	b	.L61
	b	.L62
	.p2align 1
.L58:
	.loc 2 71 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoMin(PLT)
	mov	r3, r0
	b	.L63
.L60:
	.loc 2 73 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoMul(PLT)
	mov	r3, r0
	b	.L63
.L61:
	.loc 2 75 0
	mvn	r2, #0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	ztoAddSub(PLT)
	mov	r3, r0
	b	.L63
.L62:
	.loc 2 77 0
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L64
	.loc 2 78 0
	ldr	r3, [fp, #-8]
	b	.L63
.L64:
	.loc 2 79 0
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L65
	.loc 2 80 0
	ldr	r3, [fp, #-12]
	b	.L63
.L65:
	.loc 2 82 0
	mov	r3, #0
	b	.L63
.L57:
	.loc 2 85 0
	mov	r3, #0
.L63:
	.loc 2 86 0
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
.LFE15:
	.size	fuzzy_tnorm, .-fuzzy_tnorm
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	calculateRule, %function
calculateRule:
.LFB16:
	.loc 2 89 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-17]
	.loc 2 91 0
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L67
.L69:
	b	.L68
	b	.L70
	b	.L71
	b	.L72
	.p2align 1
.L68:
	.loc 2 93 0
	ldr	r3, [fp, #-16]
	add	r2, r3, #4
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	mov	r1, r3
	mov	r0, r2
	bl	calculateMembership(PLT)
	mov	r3, r0
	b	.L73
.L70:
	.loc 2 95 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	str	r0, [fp, #-8]
	.loc 2 96 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	str	r0, [fp, #-12]
	.loc 2 97 0
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	fuzzy_snorm(PLT)
	mov	r3, r0
	b	.L73
.L71:
	.loc 2 99 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	str	r0, [fp, #-8]
	.loc 2 100 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	str	r0, [fp, #-12]
	.loc 2 101 0
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	fuzzy_tnorm(PLT)
	mov	r3, r0
	b	.L73
.L72:
	.loc 2 103 0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	mov	r3, r0
	mov	r0, r3
	bl	ztoInvert(PLT)
	mov	r3, r0
	b	.L73
.L67:
	.loc 2 106 0
	mov	r3, #0
.L73:
	.loc 2 107 0
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
.LFE16:
	.size	calculateRule, .-calculateRule
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	mamdani_fuzzy, %function
mamdani_fuzzy:
.LFB17:
	.loc 2 112 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 2 115 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L75
.L76:
	.loc 2 117 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 2 118 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 2 121 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-28]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 2 122 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 2 125 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	add	r3, r1, r3
	str	r3, [r4, #8]
	.loc 2 126 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	mov	r5, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r3, r0
	sub	r3, r5, r3
	str	r3, [r4, #12]
	.loc 2 115 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L75:
	.loc 2 115 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L76
	.loc 2 128 0 is_stmt 1
	nop
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE17:
	.size	mamdani_fuzzy, .-mamdani_fuzzy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	larsen_fuzzy, %function
larsen_fuzzy:
.LFB18:
	.loc 2 131 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	.cfi_def_cfa_offset 4
	.cfi_offset 11, -4
	add	fp, sp, #0
	.cfi_def_cfa_register 11
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	.loc 2 134 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L78
.L79:
	.loc 2 136 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 2 137 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 2 140 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-20]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 2 141 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	.loc 2 144 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
	.loc 2 145 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r2, [r2, #12]
	str	r2, [r3, #12]
	.loc 2 134 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L78:
	.loc 2 134 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L79
	.loc 2 147 0 is_stmt 1
	nop
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE18:
	.size	larsen_fuzzy, .-larsen_fuzzy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	zadeh_fuzzy, %function
zadeh_fuzzy:
.LFB19:
	.loc 2 150 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #12
	.cfi_def_cfa 11, 4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	.loc 2 153 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L81
.L82:
	.loc 2 155 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	ztoInvert(PLT)
	mov	r3, r0
	str	r3, [r4]
	.loc 2 156 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-28]
	add	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 2 159 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #8]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	add	r3, r1, r3
	str	r3, [r4]
	.loc 2 160 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	add	r3, r1, r3
	str	r3, [r4, #4]
	.loc 2 163 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	add	r3, r1, r3
	str	r3, [r4, #8]
	.loc 2 164 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	mov	r5, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r3, r0
	sub	r3, r5, r3
	str	r3, [r4, #12]
	.loc 2 153 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L81:
	.loc 2 153 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L82
	.loc 2 166 0 is_stmt 1
	nop
	sub	sp, fp, #12
	.cfi_def_cfa 13, 16
	@ sp needed
	pop	{r4, r5, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE19:
	.size	zadeh_fuzzy, .-zadeh_fuzzy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dienes_rascher_fuzzy, %function
dienes_rascher_fuzzy:
.LFB20:
	.loc 2 169 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
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
	str	r3, [fp, #-36]
	.loc 2 172 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L84
.L85:
	.loc 2 174 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	ztoInvert(PLT)
	mov	r3, r0
	str	r3, [r4]
	.loc 2 177 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3]
	.loc 2 180 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #8]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	add	r3, r1, r3
	str	r3, [r4]
	.loc 2 181 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	add	r3, r1, r3
	str	r3, [r4, #4]
	.loc 2 184 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
	.loc 2 185 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	lsl	r2, r2, #4
	ldr	r1, [fp, #-32]
	add	r2, r1, r2
	ldr	r2, [r2, #12]
	str	r2, [r3, #12]
	.loc 2 172 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L84:
	.loc 2 172 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L85
	.loc 2 187 0 is_stmt 1
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
.LFE20:
	.size	dienes_rascher_fuzzy, .-dienes_rascher_fuzzy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lukasiewicz_fuzzy, %function
lukasiewicz_fuzzy:
.LFB21:
	.loc 2 190 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
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
	str	r3, [fp, #-36]
	.loc 2 193 0
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L87
.L88:
	.loc 2 195 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	ztoInvert(PLT)
	mov	r3, r0
	str	r3, [r4]
	.loc 2 198 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3]
	.loc 2 201 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #8]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	add	r3, r1, r3
	str	r3, [r4]
	.loc 2 202 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #12]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	add	r3, r1, r3
	str	r3, [r4, #4]
	.loc 2 205 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3]
	add	r3, r1, r3
	str	r3, [r4, #8]
	.loc 2 206 0 discriminator 3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r1, [fp, #-32]
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	sub	r3, r2, r3
	mov	r1, r3
	bl	ztoTimes(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	sub	r3, r1, r3
	str	r3, [r4, #12]
	.loc 2 193 0 discriminator 3
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L87:
	.loc 2 193 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L88
	.loc 2 208 0 is_stmt 1
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
.LFE21:
	.size	lukasiewicz_fuzzy, .-lukasiewicz_fuzzy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fuzzy_union, %function
fuzzy_union:
.LFB22:
	.loc 2 217 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	.loc 2 219 0
	mov	r3, #-2147483648
	str	r3, [fp, #-12]
	.loc 2 220 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 221 0
	ldr	r3, [fp, #12]
	mov	r2, #0
	str	r2, [r3]
.L99:
.LBB2:
	.loc 2 225 0
	mvn	r3, #-2147483648
	str	r3, [fp, #-20]
	.loc 2 226 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L90
.L95:
	.loc 2 227 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L91
	.loc 2 227 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L91
	.loc 2 228 0 is_stmt 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
.L91:
	.loc 2 229 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L92
	.loc 2 229 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L92
	.loc 2 230 0 is_stmt 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
.L92:
	.loc 2 231 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L93
	.loc 2 231 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L93
	.loc 2 232 0 is_stmt 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
.L93:
	.loc 2 233 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L94
	.loc 2 233 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L94
	.loc 2 234 0 is_stmt 1
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
.L94:
	.loc 2 226 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L90:
	.loc 2 226 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L95
	.loc 2 237 0 is_stmt 1
	ldr	r3, [fp, #-20]
	cmn	r3, #-2147483647
	beq	.L100
	.loc 2 237 0 is_stmt 0 discriminator 1
	ldr	r3, [fp, #-20]
	cmp	r3, #-2147483648
	beq	.L100
	.loc 2 239 0 is_stmt 1
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	.loc 2 242 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 243 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L97
.L98:
.LBB3:
	.loc 2 244 0 discriminator 3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-36]
	add	r0, r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	bl	calculateMembershipRange(PLT)
	str	r0, [fp, #-24]
	.loc 2 245 0 discriminator 3
	ldrb	r3, [fp, #16]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	fuzzy_snorm(PLT)
	str	r0, [fp, #-16]
.LBE3:
	.loc 2 243 0 discriminator 3
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L97:
	.loc 2 243 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L98
	.loc 2 248 0 is_stmt 1
	ldr	r3, [fp, #12]
	ldr	r3, [r3]
	lsl	r3, r3, #2
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	.loc 2 249 0
	ldr	r3, [fp, #12]
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r2, [fp, #12]
	str	r1, [r2]
	lsl	r3, r3, #2
	ldr	r2, [fp, #8]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3]
.LBE2:
	.loc 2 223 0
	b	.L99
.L100:
	.loc 2 251 0
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
.LFE22:
	.size	fuzzy_union, .-fuzzy_union
	.global	__aeabi_idiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	mean_of_max, %function
mean_of_max:
.LFB23:
	.loc 2 254 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	.loc 2 257 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 2 258 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 259 0
	mov	r3, #0
	str	r3, [fp, #-20]
	.loc 2 261 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L102
.L105:
	.loc 2 262 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L103
	.loc 2 263 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	.loc 2 264 0
	mov	r3, #1
	str	r3, [fp, #-16]
	.loc 2 265 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	b	.L104
.L103:
	.loc 2 266 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L104
	.loc 2 267 0
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	.loc 2 268 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
.L104:
	.loc 2 261 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L102:
	.loc 2 261 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L105
	.loc 2 272 0 is_stmt 1
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv(PLT)
.LVL1:
	mov	r3, r0
	.loc 2 273 0
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
.LFE23:
	.size	mean_of_max, .-mean_of_max
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	min_of_max, %function
min_of_max:
.LFB24:
	.loc 2 276 0
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
	.loc 2 278 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 2 279 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 281 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L108
.L110:
	.loc 2 282 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bls	.L109
	.loc 2 283 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	.loc 2 284 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-12]
.L109:
	.loc 2 281 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L108:
	.loc 2 281 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L110
	.loc 2 288 0 is_stmt 1
	ldr	r3, [fp, #-12]
	.loc 2 289 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE24:
	.size	min_of_max, .-min_of_max
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	max_of_max, %function
max_of_max:
.LFB25:
	.loc 2 292 0
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
	.loc 2 294 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 2 295 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 297 0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L113
.L115:
	.loc 2 298 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcc	.L114
	.loc 2 299 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	.loc 2 300 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-12]
.L114:
	.loc 2 297 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L113:
	.loc 2 297 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L115
	.loc 2 304 0 is_stmt 1
	ldr	r3, [fp, #-12]
	.loc 2 305 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE25:
	.size	max_of_max, .-max_of_max
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	centroid, %function
centroid:
.LFB26:
	.loc 2 308 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #4
	.cfi_def_cfa 11, 4
	sub	sp, sp, #56
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	.loc 2 310 0
	mov	r3, #0
	str	r3, [fp, #-12]
	.loc 2 311 0
	mov	r3, #0
	str	r3, [fp, #-16]
	.loc 2 312 0
	ldr	r3, [fp, #-52]
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	.loc 2 316 0
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L118
.L121:
.LBB4:
	.loc 2 317 0
	ldr	r3, [fp, #-8]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	.loc 2 318 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r1, [fp, #-48]
	add	r3, r1, r3
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	.loc 2 319 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L119
.LBB5:
	.loc 2 320 0
	ldr	r3, [fp, #-28]
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	ztoTimes(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	.loc 2 321 0
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 2 322 0
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 2 323 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	ztoSub(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-28]
	mov	r1, r3
	mov	r0, r2
	bl	ztoTimes(PLT)
	mov	r3, r0
	lsr	r2, r3, #1
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
.LBE5:
	b	.L120
.L119:
.LBB6:
	.loc 2 325 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	movcs	r3, r2
	movcc	r3, r3
	str	r3, [fp, #-36]
	.loc 2 326 0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	movcc	r3, r2
	movcs	r3, r3
	str	r3, [fp, #-40]
	.loc 2 327 0
	ldr	r3, [fp, #-28]
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	ztoTimes(PLT)
	mov	r3, r0
	lsr	r2, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	.loc 2 328 0
	ldr	r3, [fp, #-28]
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	ztoTimes(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-24]
	mul	r2, r3, r2
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	.loc 2 329 0
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-36]
	bl	ztoSub(PLT)
	mov	r2, r0
	ldr	r3, [fp, #-28]
	mov	r1, r3
	mov	r0, r2
	bl	ztoTimes(PLT)
	mov	r3, r0
	lsr	r2, r3, #1
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
.L120:
.LBE6:
.LBE4:
	.loc 2 316 0 discriminator 2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L118:
	.loc 2 316 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L121
	.loc 2 333 0 is_stmt 1
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L122
	.loc 2 334 0
	ldr	r3, [fp, #-56]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	b	.L123
.L122:
	.loc 2 335 0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-16]
	bl	__aeabi_idiv(PLT)
.LVL2:
	mov	r3, r0
.L123:
	.loc 2 336 0
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
.LFE26:
	.size	centroid, .-centroid
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	center_of_area, %function
center_of_area:
.LFB27:
	.loc 2 339 0
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
	.loc 2 340 0
	mov	r3, #0
	.loc 2 341 0
	mov	r0, r3
	add	sp, fp, #0
	.cfi_def_cfa_register 13
	@ sp needed
	ldr	fp, [sp], #4
	.cfi_restore 11
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE27:
	.size	center_of_area, .-center_of_area
	.align	2
	.global	fuzzy
	.syntax unified
	.arm
	.fpu softvfp
	.type	fuzzy, %function
fuzzy:
.LFB28:
	.loc 2 349 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	add	fp, sp, #32
	.cfi_def_cfa 11, 4
	sub	sp, sp, #172
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	strb	r3, [fp, #-105]
	.loc 2 349 0
	mov	r3, sp
	str	r3, [fp, #-184]
	.loc 2 351 0
	ldr	r2, [fp, #-96]
	sub	r3, r2, #1
	str	r3, [fp, #-44]
	mov	r3, r2
	mov	r4, #0
	lsl	r6, r4, #5
	orr	r6, r6, r3, lsr #27
	lsl	r5, r3, #5
	mov	r3, r2
	mov	r4, #0
	lsl	r8, r4, #5
	orr	r8, r8, r3, lsr #27
	lsl	r7, r3, #5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-48]
	.loc 2 352 0
	ldr	r2, [fp, #-96]
	sub	r3, r2, #1
	str	r3, [fp, #-52]
	mov	r3, r2
	mov	r4, #0
	lsl	r10, r4, #7
	orr	r10, r10, r3, lsr #25
	lsl	r9, r3, #7
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #7
	str	r1, [fp, #-112]
	ldr	r1, [fp, #-112]
	orr	r1, r1, r3, lsr #25
	str	r1, [fp, #-112]
	lsl	r3, r3, #7
	str	r3, [fp, #-116]
	mov	r3, r2
	lsl	r3, r3, #4
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-56]
	.loc 2 353 0
	ldr	r2, [fp, #-96]
	sub	r3, r2, #1
	str	r3, [fp, #-60]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-120]
	ldr	r1, [fp, #-120]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-120]
	lsl	r3, r3, #5
	str	r3, [fp, #-124]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-128]
	ldr	r1, [fp, #-128]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-128]
	lsl	r3, r3, #5
	str	r3, [fp, #-132]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-64]
	.loc 2 354 0
	ldr	r2, [fp, #-96]
	sub	r3, r2, #1
	str	r3, [fp, #-68]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-136]
	ldr	r1, [fp, #-136]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-136]
	lsl	r3, r3, #5
	str	r3, [fp, #-140]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-144]
	ldr	r1, [fp, #-144]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-144]
	lsl	r3, r3, #5
	str	r3, [fp, #-148]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-72]
	.loc 2 356 0
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L127
.L128:
	.loc 2 357 0 discriminator 3
	ldr	r2, [fp, #-40]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-100]
	add	r3, r3, r2
	ldrb	r2, [fp, #-105]	@ zero_extendqisi2
	mov	r1, r2
	mov	r0, r3
	bl	calculateRule(PLT)
	mov	r1, r0
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-40]
	str	r1, [r3, r2, lsl #2]
	.loc 2 356 0 discriminator 3
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L127:
	.loc 2 356 0 is_stmt 0 discriminator 1
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	blt	.L128
	.loc 2 359 0 is_stmt 1
	ldrb	r3, [fp, #4]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L129
.L131:
	b	.L130
	b	.L132
	b	.L133
	b	.L134
	b	.L135
	.p2align 1
.L130:
	.loc 2 361 0
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-96]
	bl	mamdani_fuzzy(PLT)
	.loc 2 362 0
	b	.L129
.L132:
	.loc 2 364 0
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-96]
	bl	larsen_fuzzy(PLT)
	.loc 2 365 0
	b	.L129
.L133:
	.loc 2 367 0
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-96]
	bl	zadeh_fuzzy(PLT)
	.loc 2 368 0
	b	.L129
.L134:
	.loc 2 370 0
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-96]
	bl	dienes_rascher_fuzzy(PLT)
	.loc 2 371 0
	b	.L129
.L135:
	.loc 2 373 0
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-56]
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-72]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [fp, #-104]
	ldr	r0, [fp, #-96]
	bl	lukasiewicz_fuzzy(PLT)
	.loc 2 374 0
	nop
.L129:
	.loc 2 377 0
	ldr	r3, [fp, #-96]
	lsl	r2, r3, #2
	mov	r3, sp
	mov	r5, r3
	sub	r3, r2, #1
	str	r3, [fp, #-76]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-152]
	ldr	r1, [fp, #-152]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-152]
	lsl	r3, r3, #5
	str	r3, [fp, #-156]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-160]
	ldr	r1, [fp, #-160]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-160]
	lsl	r3, r3, #5
	str	r3, [fp, #-164]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-80]
	.loc 2 378 0
	ldr	r3, [fp, #-96]
	lsl	r2, r3, #2
	sub	r3, r2, #1
	str	r3, [fp, #-84]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-168]
	ldr	r1, [fp, #-168]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-168]
	lsl	r3, r3, #5
	str	r3, [fp, #-172]
	mov	r3, r2
	mov	r4, #0
	lsl	r1, r4, #5
	str	r1, [fp, #-176]
	ldr	r1, [fp, #-176]
	orr	r1, r1, r3, lsr #27
	str	r1, [fp, #-176]
	lsl	r3, r3, #5
	str	r3, [fp, #-180]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #16
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-88]
	.loc 2 379 0
	ldr	r3, [fp, #-96]
	lsl	r3, r3, #2
	str	r3, [fp, #-92]
	.loc 2 381 0
	ldr	r0, [fp, #-56]
	ldr	ip, [fp, #-64]
	ldr	lr, [fp, #-72]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-88]
	ldrb	r1, [fp, #-105]	@ zero_extendqisi2
	str	r1, [sp, #12]
	sub	r1, fp, #92
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, lr
	mov	r2, ip
	mov	r1, r0
	ldr	r0, [fp, #-96]
	bl	fuzzy_union(PLT)
	.loc 2 383 0
	ldrb	r3, [fp, #8]	@ zero_extendqisi2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L136
.L138:
	b	.L137
	b	.L139
	b	.L140
	b	.L141
	b	.L142
	.p2align 1
.L137:
	.loc 2 385 0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-92]
	mov	r0, r3
	bl	mean_of_max(PLT)
	mov	r3, r0
	b	.L143
.L139:
	.loc 2 387 0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-92]
	mov	r0, r3
	bl	min_of_max(PLT)
	mov	r3, r0
	b	.L143
.L140:
	.loc 2 389 0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-92]
	mov	r0, r3
	bl	max_of_max(PLT)
	mov	r3, r0
	b	.L143
.L141:
	.loc 2 391 0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-92]
	mov	r0, r3
	bl	centroid(PLT)
	mov	r3, r0
	b	.L143
.L142:
	.loc 2 393 0
	ldr	r3, [fp, #-80]
	ldr	r1, [fp, #-88]
	ldr	r2, [fp, #-92]
	mov	r0, r3
	bl	center_of_area(PLT)
	mov	r3, r0
	b	.L143
.L136:
	.loc 2 395 0
	mov	r3, #0
.L143:
	mov	sp, r5
	ldr	sp, [fp, #-184]
	.loc 2 396 0
	mov	r0, r3
	sub	sp, fp, #32
	.cfi_def_cfa 13, 36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.cfi_restore 14
	.cfi_restore 11
	.cfi_restore 10
	.cfi_restore 9
	.cfi_restore 8
	.cfi_restore 7
	.cfi_restore 6
	.cfi_restore 5
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	bx	lr
	.cfi_endproc
.LFE28:
	.size	fuzzy, .-fuzzy
.Letext0:
	.file 3 "src/util/ai/fuzzy.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xce3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0xc
	.4byte	.LASF94
	.4byte	.LASF95
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x3
	.byte	0x14
	.4byte	0x46
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x15
	.4byte	0x46
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x3
	.byte	0x16
	.4byte	0x46
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x3
	.byte	0x1a
	.4byte	0x6e
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x1b
	.4byte	0x46
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x3
	.byte	0x1c
	.4byte	0x46
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x10
	.byte	0x3
	.byte	0x12
	.4byte	0x93
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x3
	.byte	0x17
	.4byte	0x25
	.byte	0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x3
	.byte	0x1d
	.4byte	0x4d
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.4byte	0xbc
	.byte	0x3
	.byte	0x21
	.4byte	0xbc
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x14
	.byte	0x3
	.byte	0x28
	.4byte	0xe8
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x29
	.4byte	0x6e
	.byte	0
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x2a
	.4byte	0x46
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x8
	.byte	0x3
	.byte	0x2d
	.4byte	0x10d
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x3
	.byte	0x2e
	.4byte	0x12c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x3
	.byte	0x2f
	.4byte	0x12c
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x18
	.byte	0x3
	.byte	0x36
	.4byte	0x12c
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x37
	.4byte	0x93
	.byte	0
	.uleb128 0x9
	.4byte	0x14b
	.byte	0x4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x10d
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x3
	.byte	0x32
	.4byte	0x14b
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x33
	.4byte	0x12c
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x14
	.byte	0x3
	.byte	0x38
	.4byte	0x175
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.byte	0x39
	.4byte	0xe8
	.uleb128 0xd
	.ascii	"arg\000"
	.byte	0x3
	.byte	0x3a
	.4byte	0x132
	.uleb128 0xc
	.4byte	.LASF12
	.byte	0x3
	.byte	0x3b
	.4byte	0xc3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.4byte	0xbc
	.byte	0x3
	.byte	0x40
	.4byte	0x19e
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x3
	.byte	0
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x1
	.4byte	0xbc
	.byte	0x3
	.byte	0x48
	.4byte	0x1cd
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x1
	.4byte	0xbc
	.byte	0x3
	.byte	0x50
	.4byte	0x1fc
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0x4
	.byte	0
	.uleb128 0xe
	.ascii	"zto\000"
	.byte	0x1
	.byte	0x7
	.4byte	0x207
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF37
	.uleb128 0xf
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x157
	.4byte	0x46
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x308
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x157
	.4byte	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x10
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x158
	.4byte	0x12c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x159
	.4byte	0x308
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x15a
	.4byte	0x175
	.uleb128 0x3
	.byte	0x91
	.sleb128 -109
	.uleb128 0x10
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x15b
	.4byte	0x19e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x15c
	.4byte	0x1cd
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x15e
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x12
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x15f
	.4byte	0x30e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x160
	.4byte	0x328
	.uleb128 0x3
	.byte	0x91
	.sleb128 -60
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x161
	.4byte	0x33b
	.uleb128 0x4
	.byte	0x91
	.sleb128 -68
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x162
	.4byte	0x34e
	.uleb128 0x4
	.byte	0x91
	.sleb128 -76
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x179
	.4byte	0x362
	.uleb128 0x4
	.byte	0x91
	.sleb128 -84
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x17a
	.4byte	0x376
	.uleb128 0x4
	.byte	0x91
	.sleb128 -92
	.byte	0x6
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x17b
	.4byte	0x46
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x6e
	.uleb128 0x13
	.4byte	0x1fc
	.4byte	0x321
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.4byte	.LASF51
	.uleb128 0x13
	.4byte	0x6e
	.4byte	0x33b
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.4byte	0x1fc
	.4byte	0x34e
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.4byte	0x1fc
	.4byte	0x362
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.4byte	0x46
	.4byte	0x376
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x4
	.byte	0x91
	.sleb128 -80
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.4byte	0x1fc
	.4byte	0x38a
	.uleb128 0x14
	.4byte	0x321
	.uleb128 0x4
	.byte	0x91
	.sleb128 -88
	.byte	0x6
	.byte	0
	.uleb128 0x15
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x152
	.4byte	0x46
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d0
	.uleb128 0x16
	.ascii	"xs\000"
	.byte	0x2
	.2byte	0x152
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.ascii	"ys\000"
	.byte	0x2
	.2byte	0x152
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x152
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x46
	.uleb128 0xa
	.byte	0x4
	.4byte	0x1fc
	.uleb128 0x17
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x133
	.4byte	0x46
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c9
	.uleb128 0x16
	.ascii	"xs\000"
	.byte	0x2
	.2byte	0x133
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.ascii	"ys\000"
	.byte	0x2
	.2byte	0x133
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x133
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x135
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x136
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x137
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x138
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x12
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x13d
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x13e
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x49f
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x140
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x145
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x146
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x123
	.4byte	0x46
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x539
	.uleb128 0x16
	.ascii	"xs\000"
	.byte	0x2
	.2byte	0x123
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii	"ys\000"
	.byte	0x2
	.2byte	0x123
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x123
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x125
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"mx\000"
	.byte	0x2
	.2byte	0x126
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.ascii	"max\000"
	.byte	0x2
	.2byte	0x127
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x113
	.4byte	0x46
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a9
	.uleb128 0x16
	.ascii	"xs\000"
	.byte	0x2
	.2byte	0x113
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x16
	.ascii	"ys\000"
	.byte	0x2
	.2byte	0x113
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x113
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x115
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"mx\000"
	.byte	0x2
	.2byte	0x116
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x11
	.ascii	"max\000"
	.byte	0x2
	.2byte	0x117
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF64
	.byte	0x2
	.byte	0xfd
	.4byte	0x46
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x625
	.uleb128 0x1b
	.ascii	"xs\000"
	.byte	0x2
	.byte	0xfd
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii	"ys\000"
	.byte	0x2
	.byte	0xfd
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF50
	.byte	0x2
	.byte	0xfd
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x2
	.2byte	0x100
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.ascii	"max\000"
	.byte	0x2
	.2byte	0x101
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x12
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x102
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x103
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF71
	.byte	0x2
	.byte	0xd1
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x703
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0xd1
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0xd2
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0xd3
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0xd4
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1c
	.4byte	.LASF48
	.byte	0x2
	.byte	0xd5
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF49
	.byte	0x2
	.byte	0xd6
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1c
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd7
	.4byte	0x3d0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1c
	.4byte	.LASF41
	.byte	0x2
	.byte	0xd8
	.4byte	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0xda
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LASF67
	.byte	0x2
	.byte	0xdb
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LASF68
	.byte	0x2
	.byte	0xdc
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1f
	.4byte	.LASF69
	.byte	0x2
	.byte	0xe1
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1f
	.4byte	.LASF70
	.byte	0x2
	.byte	0xf4
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF72
	.byte	0x2
	.byte	0xbd
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x779
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0xbd
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x2
	.byte	0xbd
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF40
	.byte	0x2
	.byte	0xbd
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0xbd
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0xbd
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0xbd
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0xbf
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF73
	.byte	0x2
	.byte	0xa8
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ef
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0xa8
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x2
	.byte	0xa8
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF40
	.byte	0x2
	.byte	0xa8
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0xa8
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0xa8
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0xa8
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0xaa
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF74
	.byte	0x2
	.byte	0x95
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x865
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0x95
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x2
	.byte	0x95
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF40
	.byte	0x2
	.byte	0x95
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0x95
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0x95
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0x95
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0x97
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x20
	.4byte	.LASF75
	.byte	0x2
	.byte	0x82
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8db
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0x82
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x2
	.byte	0x82
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.4byte	.LASF40
	.byte	0x2
	.byte	0x82
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0x82
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0x82
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0x82
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0x84
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF76
	.byte	0x2
	.byte	0x6f
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x951
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x2
	.byte	0x6f
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x2
	.byte	0x6f
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.4byte	.LASF40
	.byte	0x2
	.byte	0x6f
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1c
	.4byte	.LASF45
	.byte	0x2
	.byte	0x6f
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.4byte	.LASF46
	.byte	0x2
	.byte	0x6f
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.4byte	.LASF47
	.byte	0x2
	.byte	0x6f
	.4byte	0x3d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.ascii	"r\000"
	.byte	0x2
	.byte	0x71
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF77
	.byte	0x2
	.byte	0x58
	.4byte	0x1fc
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x99f
	.uleb128 0x1c
	.4byte	.LASF17
	.byte	0x2
	.byte	0x58
	.4byte	0x12c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LASF41
	.byte	0x2
	.byte	0x58
	.4byte	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1e
	.ascii	"a\000"
	.byte	0x2
	.byte	0x5a
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.ascii	"b\000"
	.byte	0x2
	.byte	0x5a
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF78
	.byte	0x2
	.byte	0x43
	.4byte	0x1fc
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9df
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x2
	.byte	0x43
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x2
	.byte	0x43
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.4byte	.LASF41
	.byte	0x2
	.byte	0x43
	.4byte	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF79
	.byte	0x2
	.byte	0x2f
	.4byte	0x1fc
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa1f
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x2
	.byte	0x2f
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x2
	.byte	0x2f
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.4byte	.LASF41
	.byte	0x2
	.byte	0x2f
	.4byte	0x175
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF80
	.byte	0x2
	.byte	0x19
	.4byte	0x1fc
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa71
	.uleb128 0x1b
	.ascii	"set\000"
	.byte	0x2
	.byte	0x19
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"min\000"
	.byte	0x2
	.byte	0x19
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"max\000"
	.byte	0x2
	.byte	0x19
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii	"val\000"
	.byte	0x2
	.byte	0x19
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF81
	.byte	0x2
	.byte	0x7
	.4byte	0x1fc
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaa7
	.uleb128 0x1b
	.ascii	"set\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x308
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"val\000"
	.byte	0x2
	.byte	0x7
	.4byte	0x46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x21
	.4byte	.LASF82
	.byte	0x1
	.byte	0x52
	.4byte	0x1fc
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaf3
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.ascii	"c\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.ascii	"res\000"
	.byte	0x1
	.byte	0x54
	.4byte	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.4byte	.LASF83
	.uleb128 0x21
	.4byte	.LASF84
	.byte	0x1
	.byte	0x4d
	.4byte	0x1fc
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb2c
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x21
	.4byte	.LASF85
	.byte	0x1
	.byte	0x48
	.4byte	0x1fc
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb5e
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x21
	.4byte	.LASF86
	.byte	0x1
	.byte	0x43
	.4byte	0x1fc
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb84
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x21
	.4byte	.LASF87
	.byte	0x1
	.byte	0x3b
	.4byte	0x1fc
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc4
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x3b
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.ascii	"x\000"
	.byte	0x1
	.byte	0x3b
	.4byte	0x207
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x21
	.4byte	.LASF88
	.byte	0x1
	.byte	0x35
	.4byte	0x207
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc04
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x35
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.ascii	"x\000"
	.byte	0x1
	.byte	0x35
	.4byte	0x207
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.ascii	"res\000"
	.byte	0x1
	.byte	0x37
	.4byte	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x21
	.4byte	.LASF89
	.byte	0x1
	.byte	0x23
	.4byte	0x1fc
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc44
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x23
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1e
	.ascii	"res\000"
	.byte	0x1
	.byte	0x25
	.4byte	0xaf3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x21
	.4byte	.LASF90
	.byte	0x1
	.byte	0x1b
	.4byte	0x1fc
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc84
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x21
	.4byte	.LASF91
	.byte	0x1
	.byte	0x13
	.4byte	0x1fc
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcc4
	.uleb128 0x1b
	.ascii	"a\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.ascii	"b\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x1fc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x22
	.4byte	.LASF92
	.byte	0x1
	.byte	0xd
	.4byte	0x1fc
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.ascii	"x\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x207
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xc
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
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
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
.LASF63:
	.ascii	"min_of_max\000"
.LASF45:
	.ascii	"inferredTargets\000"
.LASF1:
	.ascii	"right\000"
.LASF4:
	.ascii	"FRT_VARIABLE\000"
.LASF96:
	.ascii	"fuzzy\000"
.LASF6:
	.ascii	"FRT_AND\000"
.LASF71:
	.ascii	"fuzzy_union\000"
.LASF51:
	.ascii	"sizetype\000"
.LASF56:
	.ascii	"lastVal\000"
.LASF89:
	.ascii	"ztoMul\000"
.LASF88:
	.ascii	"ztoTimes\000"
.LASF40:
	.ascii	"targets\000"
.LASF12:
	.ascii	"value\000"
.LASF77:
	.ascii	"calculateRule\000"
.LASF24:
	.ascii	"FTN_BASIC\000"
.LASF43:
	.ascii	"defuzzifier\000"
.LASF5:
	.ascii	"FRT_OR\000"
.LASF58:
	.ascii	"width\000"
.LASF78:
	.ascii	"fuzzy_tnorm\000"
.LASF73:
	.ascii	"dienes_rascher_fuzzy\000"
.LASF3:
	.ascii	"core\000"
.LASF83:
	.ascii	"long long unsigned int\000"
.LASF33:
	.ascii	"DF_MIN_OF_MAX\000"
.LASF35:
	.ascii	"DF_CENTROID\000"
.LASF48:
	.ascii	"xbuf\000"
.LASF92:
	.ascii	"ztoInverse\000"
.LASF87:
	.ascii	"ztoMultiply\000"
.LASF54:
	.ascii	"integral\000"
.LASF57:
	.ascii	"init\000"
.LASF13:
	.ascii	"FuzzyBinary\000"
.LASF36:
	.ascii	"DF_CENTER_OF_AREA\000"
.LASF17:
	.ascii	"rule\000"
.LASF28:
	.ascii	"FI_ZADEH\000"
.LASF44:
	.ascii	"ruleValues\000"
.LASF2:
	.ascii	"support\000"
.LASF42:
	.ascii	"implication\000"
.LASF67:
	.ascii	"xcoord\000"
.LASF94:
	.ascii	"src/util/ai/fuzzy.c\000"
.LASF8:
	.ascii	"unsigned char\000"
.LASF84:
	.ascii	"ztoMax\000"
.LASF30:
	.ascii	"FI_LUKASIEWICZ\000"
.LASF15:
	.ascii	"type\000"
.LASF20:
	.ascii	"FuzzyTNorm\000"
.LASF53:
	.ascii	"centroid\000"
.LASF37:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"args\000"
.LASF14:
	.ascii	"FuzzyRule\000"
.LASF55:
	.ascii	"cintegral\000"
.LASF70:
	.ascii	"membership\000"
.LASF95:
	.ascii	"/home/louis/csassignments/cs452/kernel/cs452_kernel"
	.ascii	"\000"
.LASF27:
	.ascii	"FI_LARSEN\000"
.LASF65:
	.ascii	"nummaxes\000"
.LASF68:
	.ascii	"ycoord\000"
.LASF10:
	.ascii	"FuzzyVariable\000"
.LASF82:
	.ascii	"ztoAddSub\000"
.LASF0:
	.ascii	"left\000"
.LASF80:
	.ascii	"calculateMembershipRange\000"
.LASF62:
	.ascii	"max_of_max\000"
.LASF26:
	.ascii	"FI_MAMDANI\000"
.LASF23:
	.ascii	"FTN_BOUNDED\000"
.LASF46:
	.ascii	"inferredMaxes\000"
.LASF29:
	.ascii	"FI_DIENES_RASCHER\000"
.LASF38:
	.ascii	"numRules\000"
.LASF61:
	.ascii	"smaller\000"
.LASF72:
	.ascii	"lukasiewicz_fuzzy\000"
.LASF66:
	.ascii	"maxsum\000"
.LASF41:
	.ascii	"tnorm\000"
.LASF69:
	.ascii	"found\000"
.LASF39:
	.ascii	"rules\000"
.LASF50:
	.ascii	"bufsize\000"
.LASF75:
	.ascii	"larsen_fuzzy\000"
.LASF19:
	.ascii	"FuzzyRuleType\000"
.LASF25:
	.ascii	"FuzzyImplication\000"
.LASF76:
	.ascii	"mamdani_fuzzy\000"
.LASF90:
	.ascii	"ztoSub\000"
.LASF9:
	.ascii	"FuzzySet\000"
.LASF49:
	.ascii	"ybuf\000"
.LASF60:
	.ascii	"height\000"
.LASF16:
	.ascii	"FuzzyUnary\000"
.LASF11:
	.ascii	"fuzzifier\000"
.LASF47:
	.ascii	"inferredMins\000"
.LASF31:
	.ascii	"Defuzzifier\000"
.LASF81:
	.ascii	"calculateMembership\000"
.LASF7:
	.ascii	"FRT_NOT\000"
.LASF93:
	.ascii	"GNU C11 6.3.1 20170215 (release) [ARM/embedded-6-br"
	.ascii	"anch revision 245512] -mcpu=arm920t -mtune=arm920t "
	.ascii	"-mfloat-abi=soft -g -fPIC\000"
.LASF74:
	.ascii	"zadeh_fuzzy\000"
.LASF64:
	.ascii	"mean_of_max\000"
.LASF86:
	.ascii	"ztoInvert\000"
.LASF79:
	.ascii	"fuzzy_snorm\000"
.LASF52:
	.ascii	"center_of_area\000"
.LASF22:
	.ascii	"FTN_ALGEBRAIC\000"
.LASF59:
	.ascii	"area\000"
.LASF85:
	.ascii	"ztoMin\000"
.LASF21:
	.ascii	"FTN_CLASSICAL\000"
.LASF91:
	.ascii	"ztoAdd\000"
.LASF34:
	.ascii	"DF_MAX_OF_MAX\000"
.LASF32:
	.ascii	"DF_MEAN_OF_MAX\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q1-update) 6.3.1 20170215 (release) [ARM/embedded-6-branch revision 245512]"
