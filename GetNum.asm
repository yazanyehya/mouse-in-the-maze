; 322751041, 50%
; 322645748, 50%
; Convention: Haifa
.Orig x38FC
GetNum:
	ADD R6,R6,#-6
 	STR R7,R6,#0
 	STR R1,R6,#1
 	STR R2,R6,#2
 	STR R3,R6,#3
 	STR R4,R6,#4
 	STR R5,R6,#5
 	AND R1,R1,#0
			
Get_Again:	LD R3,Space		; Minous The Ascci Space 

		GETC			;GET A CHARACTER
		OUT

		ADD R3,R0,R3		;CHECK IF INPUT IS 'SPACE'
		BRz Get_Again

		LD R2,NUM_0		;NEG VALUE OF ASCII NUMBER OF '0'
		ADD R1,R2,R0	
			
Step2:

		GETC
		OUT

		LD R3,Space ; R3 =Minous The Value Assci Space
		ADD R3,R0,R3
		BRz END2

		ADD R2,R0,#-10		;Check If we entried enter
		BRZ END2

		LD R2,NUM_0		; R2 = Minous Value Ascci Of ZERO
		ADD R2,R2,R0		;SAVE THE LAST INPUT DIGIT TO R2
		
		;CALCULATE THE NUMBER
		
		AND R3,R3,#0
		ADD R3,R3,#10		;R3=10

	; pushing arguments
		ADD R6,R6,#-2
		STR R3,R6,#0		;y=10
		STR R1,R6,#1		

	; calling Mult function
		LD R3,MultPtrAdd
		JSRR R3		; go to mult and return the 10 * r1

	; getting the return value
		ADD R3,R0,#0 ; the value that return by r0 , save it in R3

	
		ADD R6, R6, #2	; pop	
 		
		ADD R1,R2,R3	; R1 = the result that return mult and first digit

		BR Step2		

		
END2:	ADD R0,R1,#0 ; Save the Finall Result In R0
		LDR R7,R6,#0
		LDR R1,R6,#1
 		LDR R2,R6,#2
 		LDR R3,R6,#3
	 	LDR R4,R6,#4
 		LDR R5,R6,#5
		ADD R6,R6,#6	
			

RET
 
NUM_0 .fill #-48
Num0  .fill #48
Flag .fill #0
Space .fill #-32
NumS .fill #0
Space_Ascii_GetNum .fill #-32
Zero_Ascii_GetNum .fill #-48
Minus_Ascii_GetNum .fill #-45
Ten_GetNum .fill #10 
Enter_Ascii_GetNum .fill #-10
MultPtrAdd .fill X3898
.END