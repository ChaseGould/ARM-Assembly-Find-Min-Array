	.equ SWI_Print_Int, 0x6B
	.equ SWI_Exit, 0x11

	.data
array:
	.word 7, 87, 2, 26, 14, -5
array_length:
	.word 6

	.text
	.global _start
_start:	
	;; TODO: write your code below this comment
	
	ldr r0,=array
	ldr r1,=array_length
	ldr r1, [r1] ;;stores int from array_length
	
	cmp r1,#0 ;; comparison: subtracts zero from r1(checking to see if zero bit gets set)
	beq end ;; if zero bit set go to end
	ldr r2,[r0] ;; loads value from array to r2
	mov r3, r2 ;; min value// value from r2 is copied to r3.
	add r0, r0, #4 ;; adding 4 shifts memory location by 4 BYTES which brings us to next memory location.
	sub r1, r1, #1
	
	
loop1: 
	cmp r1,#0 ;; comparison: subtracts zero from r1(checking to see if zero bit gets set)
	beq end ;; if zero bit set go to end
	ldr r2,[r0] ;; loads value from array to r2
	cmp r2, r3 ;; checking if r2 is less than r3(min)
	movmi r3,r2 ;; min value// if value from r2 is smaller its copied to r3 
	add r0, r0, #4 ;; adding 4 shifts memory location by 4 BYTES which brings us to next memory location.
	sub r1, r1, #1
	b loop1 ;; restart loop
	

end:
	
		
	mov r0, #1 ;;output mode
	mov r1, r3 ;; moves r3(min) to r1 for printing
	swi SWI_Print_Int ;;print int
	
	;; exit the program
	swi SWI_Exit
	.end
	