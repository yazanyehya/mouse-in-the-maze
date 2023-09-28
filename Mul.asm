; 322751041, 50%
; 322645748, 50&
;conftion haifa
.ORIG X3898
Mult:					
	ADD R6,R6,#-5
   	STR R7,R6,#0
    	STR R1,R6,#1
	STR R2,R6,#2
    	STR R3,R6,#3
     	STR R4,R4,#4

	LDR R0,R6,#5
     	LDR R1,R6,#6

	
	AND R2,R2,#0		
	AND R3,R3,#0

	ADD R0,R0,#0
	BRz ENDM		 ; if R0=0 , The Result Is 0
	BRp POS_MUL		; if R0 > 0 The mul betwen 10 * positive

Negative: ; if R0<0 , R0 -> -R0
		ADD R0,R0,#-1
		NOT R0,R0
		ADD R3,R3,#1		

	POS_MUL:; Save R1 R0 Once In R2			
		ADD R2,R2,R1	
		ADD R0,R0,#-1
		BRz NEG
		BR POS_MUL	

	NEG:			
		ADD R3,R3,#0
		BRz ENDM
		NOT R2,R2
		ADD R2,R2,#1

	ENDM: ;store 
		
	ADD R0,R2,#0 ; Save The Return Value In R0	
	LDR R7,R6,#0
        LDR R1,R6,#1
	LDR R2,R6,#2
        LDR R3,R6,#3
        LDR R4,R6,#4
        ADD R6,R6,#5
RET

.END