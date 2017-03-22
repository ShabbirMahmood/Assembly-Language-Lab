;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-2a(Number Processsing(Odd & Even Number Testing))  Date: 08-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Value of N: $'
      MSG2 DB CR,LF,'Odd Number $' 
      MSG3 DB CR,LF,'Even Number $'
      MSG4 DB CR,LF,'WRONG ENTRY(0<=N<=9)$'
      
      
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
        
        ;CMP AL,'9'             ; ******* CHECKING N>=9 ? 
        ;JLE OK               ; IN N IS <= 9 THEN OK 
       
        
    WRONG_ENTRY: 
    
        LEA DX,MSG4
        MOV AH,09H
        INT 21H
        JMP EXIT
        
        
    OK:
        SUB AL,30H           ; CONVERTING TO DECIMAL FROM CHARACTER 
        CALL CHECK_ODD_EVEN
        
        JC ODD
        JNC EVEN

    ODD:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H
        JMP EXIT 
    EVEN:
        LEA DX,MSG3
        MOV AH,09H
        INT 21H
        JMP EXIT
                 
        EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    
    ;CHECK_ODD_EVEN PROCEDURE
    CHECK_ODD_EVEN PROC
       
        RCR AL,1              ; ROTATE CARRY RIGHT *****
        RET 
        
        CHECK_ODD_EVEN ENDP
    END MAIN