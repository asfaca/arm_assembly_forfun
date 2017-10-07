@desc a+b=c program
@date 2017.10.02

@define
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
	.syntax	unified

@const data
	.section	.rodata
	.align	2
.LC0:
	.asciz	"%d + %d = %d\n"
@text
	.text
	.align	2
	.global	main
	.type	main, %function

main:
	sub	sp, sp, 8
	str	fp, [sp, 0]
	str	lr, [sp, 4]
	add	fp, sp, 4

	mov	r1, 5
	ldr	r2, .L3+4
	add	r3, r1, r2
	sub	sp, sp, 8
	str	r3, [fp, 8]
	ldr	r0, .L3
	bl	printf

	mov	r3, 0
	mov	r0, r3
	ldr	fp, [sp, 8]
	ldr	lr, [sp, 12]
	add	sp, sp, 16
	bx	lr

	.align	2
.L3:
	.word	.LC0
	.word	22

