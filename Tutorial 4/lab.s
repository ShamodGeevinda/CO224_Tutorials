@ lab 4
@ Group 02

	.text	@ instruction memory

	
	.global main
main:
	
	@ push (store) lr to the stack, allocate space for 100 chars (scanf)
	
	sub	sp, sp, #4
	str	lr, [sp, #0]
	
    @allocate stack for input
	sub	sp, sp, #4

	@printf for string
	ldr	r0, =formatr
	bl	printf

    @scanf for num
	ldr	r0, =formats
	mov	r1, sp	
	bl	scanf	@scanf("%d",sp)

	@copy num from the stack to register r4
	ldr	r4, [sp]

	@release stack
	add	sp, sp, #4

    cmp r4, #0
    bge else
    @printf for string
	ldr	r0, =format1
	bl	printf
    b exit

    else:
    mov r5, #0 @ int i=0
        
        loop:
        cmp r5,r4
        beq exit

        mov r1, r5
        ldr	r0, =format2
	    bl	printf

        

//
        sub	sp, sp, #200
        @scanf for string
        ldr	r0, =formatst
        mov	r1, sp
        bl	scanf	@scanf("%s",sp)
//
        mov r0, r1
        mov r1, r5
        ldr	r0, =format3
	    bl	printf

        add r5,  r5, #1 @ i++
        //implement reverse string

        @print answer
        mov	r1, sp
        ldr	r0, =formatp
        bl	printf

        add	sp, sp, #200


        b loop




exit:
	
    @ stack handling (pop lr from the stack) and return
	mov	r0, #0		@return 0
	ldr	lr, [sp, #0]
	add	sp, sp, #4
	mov	pc, lr		





	.data	@ data memory
formatr:  .asciz "Enter the number of strings :\n"
formats:  .asciz "%d"
format1:  .asciz "Invalid Number\n"
format2:  .asciz "Enter input string %d\n"
formatp:  .asciz "%s\n"
formatst: .asciz " %[^\n]%*c"
format3:  .asciz "Output string %d is..\n"
format4:  .asciz ""
