; 322751041, 50%
; 322645748, 50%
; Convention: Haifa
.Orig x39C4
GetMatrix:
	ADD R6,R6,#-6
 	STR R7,R6,#0
 	STR R1,R6,#1
 	STR R2,R6,#2
 	STR R3,R6,#3
 	STR R4,R6,#4
 	STR R5,R6,#5

	LDR R1,R6,#7 ; R1=N
	LDR R2,R6,#6 ; R2=Pointer
	ST R2,PTRToMatrix
	LDR R3,R6,#7 ; R1=N
	LDR R2,R6,#6

LOOP:
	LDR R1,R6,#7 ; R1=N
	ADD R3,R3,#-1	
	BRn ENDGet
LOOP2:
	LD R4,GetNumPtr
	JSRR R4
	BR CheckingTheNumber
Cont:
	
	STR R0,R2,#0 ; Store 
	ADD R2,R2,#1
	ADD R1,R1,#-1
	BRz LOOP
	BR LOOP2

CheckingTheNumber:

	ADD R0,R0,#0 ; if the number is zero is okey 
	BRz Cont

	ADD R0,R0,#-1 ; if the number is one is okey
	BRz UptadeR0AndCon

	BR Illegal ; else this error

UptadeR0AndCon:

	ADD R0,R0,#1
	BR Cont

Illegal:

	AND R0,R0,#0
	ADD R0,R0,#1

	ST R0,Flag; Flag=1 ; if entried num not one not zero , flag -> 1
	BR Cont

ENDGet:

	LD R0,Flag
	ADD R0,R0,#0 ; check if the flag 1 , if this 1 --> error

	BRp PrintIllegal
	BR ChekcingTheFirst	

ChekcingTheFirst: ; checking the first elemit

	LD R2,PTRToMatrix
	LDR R0,R2,#0
	ADD R0,R0,#-1

	BRz CheckTheLast
	BR PrintIllegal

CheckTheLast: ; check if the last elemit ( n-1, n-1 ) 
	LDR R1,R6,#7
	LDR R3,R6,#7
	AND R4,R4,#0

LOOPM: ; loop to reached to last elemet

	ADD R4,R4,R3
	ADD R1,R1,#-1
	BRp LOOPM

	ADD R4,R4,#-1
	LD R2,PTRToMatrix
	ADD R2,R2,R4

	LDR R0,R2,#0
	ADD R0,R0,#0

	BRz PrintIllegal ; if last num is zero go to print error
	BR Legal  ; else ,this legal

PrintIllegal: ; print error and jump to getmatrix

	LEA R0,Error
	PUTS

	LD R2,PTRToMatrix
	LDR R1,R6,#7

	AND R0,R0,#0
	ST R0,Flag
	ADD R3,R1,#0

	BR LOOP	

Legal: 

	LDR R7,R6,#0
 	LDR R1,R6,#1
 	LDR R2,R6,#2
 	LDR R3,R6,#3
 	LDR R4,R6,#4
 	LDR R5,R6,#5
	ADD R6,R6,#6
		

RET 

PTRToMatrix .fill #0
Flag .fill #0
Error .STRINGZ "Illegal maze! Please try again:\n"
enter  .FILL #10
GetNumPtr .fill x38FC

.END