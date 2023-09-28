; 322751041, 50%
; 322645748, 50%
; Convention:Haifa
.Orig x3000
main:

	LEA R0 ,GetNumStr
	PUTS

	LD R3 ,GetNumPTR
	LD R6 STACKADD
 
	JSRR R3    

	LD R4 ,GetMatrixPTR
	ST R0,N ; Save the N

	LEA R3 ,MatrixMaze
	LD R0,N


	STR R3 R6 #-2 ; R3= Matrix ADDRESS
	STR R0 R6 #-1 ; R0= N

	LEA R0 , GetMatStr ; Print the Getmatrix stirng
	PUTS
 
	AND R0,R0,#0
	ADD R0,R0,#10
	OUT

	ADD R6 R6 #-2 ; PUSH
	JSRR R4      ; jump to the getmatrix function

	ADD R6 R6 #2  ; POP
 
	LEA R0,StringSec ; print the second string
	PUTS

	AND R0,R0,#0 
	ADD R0,R0,#10 ; R0 EQUAL TO 10 ASSCI FOR PRINT ENTER
	OUT

	LD R4,N ; LOAD TO R4 THE LENGTH OF ROW
	LD R1,One
	
	AND R2,R2,#0
	ADD R2,R2,#1 ; R2=1
 
	LD R0,Zeroo

	LEA R3 ,MatrixMaze
	LD R5 ,AllSolutionPTR

	ADD R6 R6 #-5  ; PUSH FOR ARGUMENTS
 
	STR R1 ,R6 #0 
	STR R2 ,R6 #1  
	STR R4 ,R6 #2 
	STR R3 ,R6 #3 
	STR R3 ,R6 #4 

	JSRR R5       
	ADD R6 ,R6 #5 ; POP 
 
HALT

Zeroo .fill #0
One .fill #1
GetNumPTR  .fill x38FC
AllSolutionPTR .fill x3C80
GetMatrixPTR .fill x39C4
STACKADD .fill XBFFF
N .fill #0
GetNumStr .stringz "Please enter a number between 2 to 20: "
GetMatStr .stringz "Please enter the maze matrix: "
StringSec .stringz "The mouse is hopeful he will find his cheese."
MatrixMaze .blkw #400 #-1

.END