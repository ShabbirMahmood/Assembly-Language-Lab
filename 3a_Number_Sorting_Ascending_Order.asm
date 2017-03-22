;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-3a(Sorting Ascending Order)  Date: 17-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Input Numbers: $'
      MSG2 DB CR,LF,'Sorted(Ascending Order)Output is: $'
      N DW ?
      ARRAY DB 100 DUP (?)   ; INPUT ARRAY OF Number
      
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
        JE CALCULATE
        
        MOV ARRAY[BX],AL     ; STORING CHARACTER INTO ARRAY
        INC BX
        JMP WHILE           ;UNCODITIONAL JUMP TO WHILE LOOP 
    
    CALCULATE:
        MOV N,BX             ; Conter N
        
        MOV CX,N            ; BOTH BX & CX CONTAINS TOTAL NUMBER OF NUMBERS (N)
        DEC CX              ; N-1
        
                
    SCAN: 
        MOV BX,CX           ; BOTH BX & CX CONTAINS (N-1)
        MOV SI,0
        
    COMPARE:
        MOV AL, ARRAY[SI]
        MOV DL, ARRAY[SI+1]
        CMP AL,DL
        JC NO_SWAP          ; Ascending Order
        
       SWAP:
        MOV ARRAY[SI],DL  
        MOV ARRAY[SI+1],AL
        
    NO_SWAP:
        INC SI
        DEC BX
        JNZ COMPARE         ; INNER LOOP (BX)
        LOOP SCAN           ; OUTER LOOP (CX)
   
    SHOW_OUTPUT:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR OUTPUT  
        
        MOV BX,0
        MOV AH,02H  
        
    TOP:
        MOV DL,ARRAY[BX] 
        INT 21H 
        MOV DL,' '
        INT 21H
        INC BX
        CMP BX,N
        JNE TOP 
        
    EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN
    