;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1b(String Reversal Using Stack)  Date: 01-03-2017
TITLE P1B: REVERSING INPUT STRING
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Input String: $'
      MSG2 DB CR,LF,'Reversed Output String is: $'  
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ;ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR INPUT 
        
        XOR CX,CX            ;INITIALIZE COUNT REGISTER CX TO 0
        
        MOV AH,01H
        
    WHILE:                    
        INT 21H              ; READ A CHARACTER
        CMP AL,0DH           ; CHECKING FOR NEW LINE
        JE END_WHILE 
        PUSH AX              ; PUSH IT TO STACK
        INC CX
        JMP WHILE
        
    END_WHILE:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR OUTPUT 
        
        JCXZ EXIT            ; IF WE PRESS ENTER FIRST TIME ************
   
    TOP: 
        MOV AH,02H           ; CHARACTER DISPLAYING SERVICE ROUTINE**********
        POP DX
        INT 21H
        LOOP TOP             ;TOP: DEC CX, CMP CX,00H, JNZ TOP 
         
    EXIT:    
        
        MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN