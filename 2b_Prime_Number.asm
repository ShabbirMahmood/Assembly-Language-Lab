;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-2b(Number Processsing(Prime Number Testing))  Date: 12-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Value of N: $'
      MSG2 DB CR,LF,'Prime Number $' 
      MSG3 DB CR,LF,'Not Prime Number $'
      MSG4 DB CR,LF,'WRONG ENTRY(0<=N<=9)$'
      DIVIDEND DB ?
      
      
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ;ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR INPUT
        
        MOV AH,01H
        INT 21H
       
        CMP AL,'0'
        JGE OK               ; JUMP GREATER EQUAL >= 0
        
    WRONG_ENTRY: 
    
        LEA DX,MSG4
        MOV AH,09H
        INT 21H
        JMP EXIT
               
    OK:
        SUB AL,30H           ; CONVERTING TO DECIMAL FROM CHARACTER  
        MOV DIVIDEND,AL
        CALL CHECK_PRIME_NUMBER
                 
        EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    
    ;CHECK_PRIME_NUMBER PROCEDURE
    CHECK_PRIME_NUMBER PROC
       
        CMP AL,0
        JE NOT_PRIME
        
        CMP AL,1
        JE NOT_PRIME
        
        MOV CL,2          ; Divisor in CL
        XOR AX,AX         ; CLEARING AX 
        
        MOV AL,DIVIDEND
        DIV CL            ; UNSIGNED DIVISION
        
        CMP AL,1          ; *****CHECKING FOR 2 AND 3 (PRIME NUMBER )
        JE PRIME
        
        MOV CL,AL         ; QUOTIENT(AL) IN CL , (NOW CALCULATION IS N/2)
        
    TOP:
        XOR AX,AX         ; CLEARING AX
        MOV AL,DIVIDEND
        DIV CL            ; UNSIGNED DIVISION
        
        CMP AH,0          ; REMAINDER IN AH
        JZ NOT_PRIME 
        DEC CL
        CMP CL,1
        JNE TOP
        
        JMP PRIME   
        
    NOT_PRIME:
    
        LEA DX,MSG3
        MOV AH,09H
        INT 21H
     
        RET
        
    PRIME: 
        
        LEA DX,MSG2
        MOV AH,09H
        INT 21H
        
        RET 
        
        CHECK_PRIME_NUMBER ENDP
    
    END MAIN
