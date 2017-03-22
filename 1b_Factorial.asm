;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1b(Number Processsing(Factorial))  Date: 08-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Value of N: $'
      MSG2 DB CR,LF,'Factorial of N is(N!): $'
      MSG3 DB CR,LF,'WRONG ENTRY(0<=N<=3)$'
      
      
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ;ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR INPUT
        
        MOV AH,01H
        INT 21H
        SUB AL,30H           ; CONVERTING TO DECIMAL FROM CHARACTER 
        
        CMP AL,3           ; ******* CHECKING N>=3 ? 
        JLE OK               ; IN N IS <= 3 THEN OK
        
    WRONG_ENTRY: 
    
        LEA DX,MSG3
        MOV AH,09H
        INT 21H
        JMP EXIT
        
        
    OK:
        CALL FACTORIAL
        


        LEA DX,MSG2
        MOV AH,09H
        INT 21H 
        
        ADD BX,30H            ; CONVERTING TO CHARACTER
        MOV DX,BX
        
        MOV AH,02H            ; MULTIPLICATION(FACTORIAL)
        INT 21H        
        
        EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    
    ; FACTORIAL PROCEDURE
    FACTORIAL PROC
       
        XOR CX,CX             ; CLEARING COUNT REGISTER ************* VERY IMPORTANT
        MOV CL,AL 
        
        MOV AX,1              ; LOAD AX WITH 1 FOR MULTIPLICATION *****
        CMP CL,0              ; IF WE ENTER 0 AS N VALUE THEN SKIP ************ 
        JE SKIP               ; 0! = 1 (BX=AX=1)
      
    TOP:
        
        MUL CX                ; DX:AX = AX * CX
        LOOP TOP
    SKIP:
        MOV BX,AX             ; STORE THE REJULT IN BX
        RET
        
        FACTORIAL ENDP
    END MAIN