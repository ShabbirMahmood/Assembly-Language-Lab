.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Input String: $' 
      MSG2 DB CR,LF,'Enter the Input English Letter: $'
      MSG3 DB CR,LF,'Number of Input Case Letter: $'
      MSG4 DB CR,LF,'Number of Opposite Case Letter: $'
      MSG5 DB CR,LF,'Case Conversion is Impossible $' 

      ARRAY DB 100 DUP (?)   
      UP DB 0
      DOWN DB 0 
      LETT DB ? 
      N DW 0
      
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX       ; PSP
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H
        
        
        
        XOR BX,BX
        MOV AH,01H
        
    WHILE:              ; INPUT TEXT STRING
        INT 21H
        CMP AL,0DH
        JE LETTER_INPUT
        
        MOV ARRAY[BX],AL     
        INC BX
        JMP WHILE
        
    LETTER_INPUT:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H
        
        MOV AH,01H
        INT 21H
        
        CMP AL,'A'
        JL WRONG
        
        CMP AL,'Z'
        JG LOWER
        JMP OK ;************
    LOWER:
        CMP AL,'a'
        JL WRONG
        
        CMP AL,'z'
        JG WRONG
        JMP OK
        
    WRONG:
        LEA DX,MSG5
        MOV AH,09H
        INT 21H 
        JMP EXIT
    
    
    OK: 
        MOV LETT,AL
        XOR CX,CX
        MOV N,BX
        MOV CX,BX
        XOR BX,BX
        
    TOP1:
        MOV AL,LETT
        CMP AL,ARRAY[BX]
        JNE SKIP1 
        
        INC UP
      SKIP1:
        INC BX
        LOOP TOP1
        
        MOV AL,LETT
        XOR AL,20H ;*****************
        MOV LETT,AL
        XOR CX,CX
        MOV CX,N
        XOR BX,BX
    TOP2:
        MOV AL,LETT
        CMP AL,ARRAY[BX]
        JNE SKIP2 
        
        INC DOWN
      SKIP2:
        INC BX
        LOOP TOP2
        
    OUTPUT:
    
    MOV AH,09H
    LEA DX,MSG3
    INT 21H
    
    MOV AH,02H
    MOV DL,UP
    ADD DL,30H
    INT 21H  
    
    MOV AH,09H
    LEA DX,MSG4
    INT 21H
    
    MOV AH,02H
    MOV DL,DOWN
    ADD DL,30H
    INT 21H
        
       
        
        
                   
        
        
    EXIT:
    
        MOV AH,4CH
        INT 21H
        
        MAIN ENDP
    END MAIN
    