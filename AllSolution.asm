; 322751041, 50%
; 322645748, 50%
;Convention: Haifa/ 
.Orig x3C80
AllSolution:

	ADD R6 R6 #-6 ; Push for arguments
	STR R1 R6 #0
	STR R2 R6 #1
	STR R3 R6 #2

	STR R4 R6 #3
	STR R5 R6 #4
	STR R7 R6 #5

    	LDR R1 R6 #6 ; index the row
    	LDR R2 R6 #7 ; index the col

    	LDR R3 R6 #8 ; size the row & col
    	LDR R4 R6 #9 ; 
	ST R3,Size

    	LDR R5 R6 #10 ;ptr to matrix

	LD R5,Size
	NOT R5,R5
	ADD R5,R5,#1
	ST R5,MinSizeRow

FirstCheck:

	AND R5,R5,#0
	ADD R5,R5,R2

	NOT R5,R5
	ADD R5,R5,#1

	ADD R5 R5 R1 ; CHECK IF THE J-I=0
	BRZ IsEqual    
	BR GoRight

IsEqual:
	LD R5,MinSizeRow

	ADD R5 R5 R1 
	BRnp GoRight

	LD R5 ,KoKhavAssc

	STR R5 R4 #0  
	LDR R5 R6 #10 ; PTR To Matrix

	STR R3 R6 #-2 
	STR R5 R6 #-1 

	LD R5 ,PrintMatrixPTR

	ADD R6 R6 #-2  ; push
	JSRR R5        ; jump to print matrix
	ADD R6 R6 #2   ; pop

	BR AfterKreaot ; rekorsia

GoRight:

	LD R5,MinSizeRow

	ADD R5,R5,#0
	ADD R5,R5,R2 

	ADD R5 R5 #1 ; CHECK IF CURRET COL > N
	BRp Godown     

Continue:
	LDR R5 R4 #1 ; r5=a[i][j+1]
	ADD R5,R5,#0

	ADD R5 , R5 #-1 ; if right its one br continue
	BRz Cont
	BR Godown ; if right elemnt is zero go to thirdcheck

Cont:

	LD R5 ,KoKhavAssc ; R5 take a ascci value for "*"
	STR R5 R4 #0 ; store

	ADD R2 R2 #1 ; the index of col ++
	ADD R4 R4 #1 ; ptr++

	LDR R5 R6 #10 

	; kreaa rokersevet with a new value's of paratrames
	STR R1 R6 #-5 
	STR R2 R6 #-4 
	STR R3 R6 #-3
	STR R4 R6 #-2 
	STR R5 R6 #-1 


	ADD R6 R6 #-5 
	JSR AllSolution  
	ADD R6 R6 #5  
    
    	ADD R2 R2 #-1 ; j--
	ADD R4 R4 #-1 
     
	ADD R5 R0 #0 
	ADD R5,R5,#1 ; Check if this No
	BRz AfterKreaot


Godown:

	LD R5,MinSizeRow

	ADD R5 R1 R5 ; check if the r5 > the max index row
	ADD R5 R5 #1
	BRnz ContinueDown ; if the R5=MAT[N-1][J] and we dont can go to down and right , so go up
	BR GoUp

ContinueDown:

	ADD R5 R4 R3 
	LDR R5 R5 #0  
	ADD R5 R5 #-1 ; check if the down elemnt is one
	BRnp GoUp ; if down elemnt is zero return up

	LD R5 ,KoKhavAssc
	STR R5 R4 #0 

	ADD R1 ,R1, #1 ; i++;
	ADD R4 ,R4, R3 

	LDR R5 R6 #10 
; Kreaa rokersevet to down with a new parametrs

	STR R1 R6 #-5 
	STR R2 R6 #-4 
	STR R3 R6 #-3  
	STR R4 R6 #-2 
	STR R5 R6 #-1 

	ADD R6 R6 #-5 ; push
	JSR AllSolution  
	ADD R6 R6 #5  ; pop

  	ADD R1 R1 #-1 ;i--;

	NOT R5 R3
	ADD R5 R5 #1
	ADD R4 R4 R5
	
	ADD R5 R0 #1 
	BRz AfterKreaot

GoUp:

	LD R5,MinSizeRow
	ADD R5 R1 R5 

	ADD R5 R5 #-1
	BRp Goleft

	ADD R5,R3,#0
	NOT R5,R5
	ADD R5,R5,#1

	ADD R5,R4,R5
	LDR R5,R5 #0 ; CHECK IF THE UP ELEMENT IS 1

	ADD R5,R5 #-1
	BRnp Goleft

	LD R5 ,KoKhavAssc

	STR R5 R4 #0 

	ADD R1 R1 #-1 
	NOT R5 R3
	ADD R5 R5 #1
	ADD R4 R4 R5  ; matrix[i][j]->matrix[i-1][j]  ( because is 1 )

	LDR R5 R6 #10 ; PTR

; kreaa rekorsevet with a new  value's of paramaters
	STR R1 R6 #-5 
	STR R2 R6 #-4 
	STR R3 R6 #-3 
	STR R4 R6 #-2 
	STR R5 R6 #-1 


	ADD R6 R6 #-5 ;push

	JSR AllSolution 
	ADD R6 R6 #5  ; pop
	 
    	ADD R1 R1 #1 ; i++
	ADD R4 R4 R3 ; A[i-1][j]->A[i][j]

	ADD R5 R0 #1 
	BRz AfterKreaot

Goleft:

	LD R5,MinSizeRow
	ADD R5 R2 R5 ; CHECK THE INDEX OF COL

	ADD R5 R5 #-1
	BRp Last

	ADD R5 R2 #-2 
   	BRn Last

	LDR R5 R4 #-1 ; R5=A[i][j-1] if R5 = 1 
	ADD R5 R5 #-1
	BRnp Last

	LD R5 ,KoKhavAssc
	STR R5 R4 #0 

	ADD R2 R2 #-1 	
	ADD R4 R4 #-1 

	LDR R5 R6 #10 ;ptr to matrix
; new kreaa rokersevet with a new paramatrim to left

	STR R1 R6 #-5 
	STR R2 R6 #-4  
	STR R3 R6 #-3 
	STR R4 R6 #-2 
	STR R5 R6 #-1 


	ADD R6 R6 #-5 ; push
	JSR AllSolution  
	ADD R6 R6 #5  ; pop
    
   	ADD R2 R2 #1
	ADD R4 R4 #1

	ADD R5 R0 #1 ; check if the user want a new sol
	BRz AfterKreaot ; if dont want go to end

Last:
	ADD R5 R1 #-1 
	BRz secondcheck    
	BR AfterKreaot

secondcheck:

	ADD R5 R2 #-1  
	BRz Continue2   
	BR AfterKreaot

Continue2:

	ADD R0 R0 #-1      
	BRn We_donthaveanother_sol     
	BRn AfterKreaot
	
	ADD R0,R0,#1
	ADD R5 R0 #0

PRINTSTR_DontAnoSol:
	LEA R0 ,DontHaveAnotherSol
	PUTS

	AND R0,R0,#0
	ADD R0,R0,#10
	OUT

   	ADD R0 R5 #0
	BR AfterKreaot

We_donthaveanother_sol:
  	  ADD R5 R0 #0
	LEA R0, GameOverstr
	PUTS

	AND R0,R0,#0
	ADD R0,R0,#10
	OUT

    	ADD R0 R5 #0


AfterKreaot:		
	AND R5 R5 #0
	ADD R5 R5 #1  
	STR R5 R4 #0   

ENDFunc:

; LDR FOR THE REGISTEREM
	LDR R1 R6 #0  
	LDR R2 R6 #1
	LDR R3 R6 #2
	LDR R4 R6 #3
	LDR R5 R6 #4
	LDR R7 R6 #5
	ADD R6 R6 #6 ;POP


RET

Size .fill #0
MinSizeRow .fill #0
KoKhavAssc .fill #42
PrintMatrixPTR .fill x3B54
GameOverstr .stringz "OH NO! It seems the mouse has no luck in this maze."
DontHaveAnotherSol .stringz "OH NO! It seems the mouse could not find another solution for this maze."

.END