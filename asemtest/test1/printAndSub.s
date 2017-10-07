@test for printf and sub function

@define
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
	.syntax	unified

@data
	.section	.rodata
	.align	2
.LC0:
	.asciz	"Hi THIS IS ARM CORTAX-%d!\n"

@code
	.text
	.align	2
	.global	main
	.type	main, %function

main:
	sub	sp, sp, 8
	str	fp, [sp, 0]
	str	lr, [sp, 4]
	add	fp, sp, 4

	mov	r5, 53
	mov	r0, r5

	bl	sub
	mov	r0, 0
	ldr	fp, [sp, 0]
	ldr	lr, [sp, 4]
	add	sp, sp, 8
	bx	lr


sub:
	sub	sp, sp, 8
	str	fp, [sp, 0]
	str	lr, [sp, 4]
	add	fp, sp, 4
	mov	r1, r0
	ldr	r0, msg
	bl	printf
	
	mov	r0, 0
	ldr	fp, [sp, 0]
	ldr	lr, [sp, 4]
	add	sp, sp, 8
	bx	lr


	.align	2
msg:
	.word	.LC0
	
