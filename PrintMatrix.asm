; 322751041, 50%
; 322645748, 50%
; Convention: Haifa
.Orig x3B54
PrintMatrix:

	ADD R6 R6 #-6 ;PUSH FOR ARGUMENTS

	STR R1 R6 #0
	STR R2 R6 #1
	STR R3 R6 #2

	STR R4 R6 #3
	STR R5 R6 #4
	STR R7 R6 #5

	ADD R1 R0 #0 ; so know if the user want another solution

PrintTheString:

	LEA R0 ,FirstStr	; PRINT THE STRING
	PUTS
	AND R0,R0,#0
	ADD R0,R0,#10 ; RO NOW EQUAL TO ENTER ASCCI

	OUT ; PRINT ENTER

	LDR R3 R6 #6 ; LOAD THE LENGTH OF N IN R3
	ST R3,N ; SAVE THE LENGTH OF ROW IN LABLE

	LDR R4 R6 #7 ; PTR
	LD R2,N ; LOAD THE LENGTH OF ROW IN R2
	LD R5,N ; LOAD THE LENGTH OF ROW IN R5


INNERLOOP:
	LD R5 , KOHAV
	LDR R0 R4 #0  ; R0 = M[I][J] 
                
	ADD R5 R5 R0    ; "*"+M[I][J]=0 -> PRINT *     
	BRz Continue

	LD R5,Zero  ; IF THE ELEMENT NOT * , THAT SAY THE ELEMEMNT 0 OR 1
	ADD R0 R0 R5 ; ADD THE " 48 " FOR PRINTNING

	Continue: ; PRINT THE ELEMNT
	OUT 

	LD R0 , Space ; RO EQUAL TO SPACE ASSCI
	OUT ; PRINT ASSCI

	ADD R4 R4 #1  ; PTR++:    
	ADD R3 R3 #-1   ; COUNTERLOOP--;                      
	BRp INNERLOOP

LOOPOUT:
 
	AND R0,R0,#0 
	ADD R0,R0,#10 ; RO EQUAL TO ENTER ASSCI 
	OUT             ; PRINT ENTER
         
	LDR R3 R6 #6    ; UPTADE THE INNERLOOP COUNTER  
	ADD R2 R2 #-1  ; J--             
	BRp INNERLOOP          

PrintStrAnother_Sol:

	LEA R0 ,Moresol 
	PUTS

GetYesOrNo:

	GETC ; enter Y / N
	OUT  ; print the input
	
	ADD R2 R0 #0 ; R2=Input
	
	GETC
	OUT
	
	LD R5 ,Y
	NOT R5,R5
	ADD R5,R5,#1

	ADD R5 R2 R5    ; If r2+r5=0 -> the user want another solution
	BRnp EndLoop

	ADD R0 R1 #0   
	ADD R0 R0 #1  ; R0 = R0 +1
	BR ENDF

EndLoop:
	AND R0 R0 #0    
	ADD R0 R0 #-1

ENDF:

LDR R1 R6 #0
LDR R2 R6 #1
LDR R3 R6 #2
LDR R4 R6 #3
LDR R5 R6 #4
LDR R7 R6 #5
ADD R6 R6 #6 ; pop

RET 

Zero .fill #48
KOHAV .fill #-42
N .fill #0
Y .fill #89
Space .fill #32
Moresol .stringz "Would you like to see another solution? "
FirstStr .stringz "Yummy! The mouse has found the cheese!"

.END