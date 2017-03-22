;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1b(String Reversal Using Array)  Date: 01-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Input String: $'
      MSG2 DB CR,LF,'Converted Output String is: $'
      ARRAY DB 100 DUP (?)   ; INPUT ARRAY OF STRING
      
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ;ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR INPUT 
        
        MOV BX,00H
        MOV AH,01H
        
    WHILE:
        INT 21H
        CMP AL,0DH
        JE SHOW_OUTPUT
        
        MOV ARRAY[BX],AL     ; STORING CHARACTER INTO ARRAY
        INC BX
        JMP WHILE           ;UNCODITIONAL JUMP TO LOOP_1 
    
    SHOW_OUTPUT:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR OUTPUT  
        
        MOV AH,02H  
        
    TOP:
        MOV DL,ARRAY[BX] 
        INT 21H 
        DEC BX
        JGE TOP
        
    EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN
    