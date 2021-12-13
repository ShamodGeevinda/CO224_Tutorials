@ ARM Assembly - exercise 7 
@ Group Number : 02

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE
@fib(n){
@	if (n<=1){
@		return n;
@	}
@	else{
@		return fib(n-2)+ fib(n-1);
@	}
@}	

@ ---------------------	
Fibonacci:
        sub sp, sp, #12 @ stack for 3 items
        
        str r2, [sp, #8]
        str r1, [sp, #4]
        str lr, [sp, #0]  @ return address

        mov r2, r0  @ r2= r0
		
		            
        cmp r0,#1
        ble label               @ r0 <= 1
        
        sub r0, r2, #2          @ r0 = r2 -2
        bl Fibonacci            @ branch link and calling rec function

        mov r1, r0              @ r1 = r0
        sub r0, r2, #1          @ r0 = r2 -1
        bl Fibonacci             @ branch link and calling rec function

        add r0, r0, r1          @ r0 = r0 + r1

        label:
        ldr lr, [sp, #0]      @ restore original values
        ldr r1, [sp,#4]
        ldr r2, [sp,#8]
        add sp, sp, #12
        mov pc,lr               @ return


@ ---------------------
	
	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8	@the value n

	@ calling the Fibonacci function
	mov r0, r4 	@the arg1 load
	bl Fibonacci
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
format: .asciz "F_%d is %d\n"

