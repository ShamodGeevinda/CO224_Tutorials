@ ARM Assembly - exercise 6 
@ Group Number :

	.text 	@ instruction memory
	
	
@ Write YOUR CODE HERE	

@ ---------------------	

fact:
	mov r1, #1  @ r1 = 1
	loop:
		cmp r0, #0
		bls exit @ if insigned r0 is lower than or equal to 0 then exit
		
		mul r1, r0, r1  @ multiply r0 and r1 and put result in r1
		sub r0, r0, #1	@ r0--	
		b loop			@ jump to loop

exit:	
	mov r0, r1   @ put r1 result to r0
	mov pc, lr   @ return


@ ---------------------	

.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #4	@the value n

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

