@ ARM Assembly - exercise 6 
@ Group Number :

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	
fact:
	sub sp, sp, #16
	str r7, [sp, #12]
	str r6, [sp, #8]
	str r5, [sp, #4]
	str r4, [sp, #0]
	mov r5, #1
	mov r7, #1
	loop:
	cmp r7, r4
	bgt exit
	mul r6, r7, r5 
	mov r5, r6
	add r7,r7, #1
	b loop


exit:
mov r0,r6
ldr r4, [sp, #0]
	ldr r5, [sp, #4]
	ldr r6, [sp, #8]
	ldr r7, [sp, #12]
	add sp, sp, #16
	mov pc, lr




@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value n

	@ calling the fact function
	mov r0, r4 	@the arg1 load
	bl fact
	mov r5,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "Factorial of %d is %d\n"

