;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-3a(Counting)  Date: 18-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      
      MSG1 DB 'Enter the Input String: $'
      MSG2 DB CR,LF,'No. of Vowels     : $'
      MSG3 DB CR,LF,'No. of Consonants : $'
      MSG4 DB CR,LF,'No. of Digits     : $'
      MSG5 DB CR,LF,'No. of Spaces     : $'
      
      VOWEL DB 0
      CONSONANT DB 0
      DIGIT DB 0
      SPACE DB 0 
      
      
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ; ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        LEA DX,MSG1
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR INPUT 
      
        MOV AH,01H
        
    WHILE:
        INT 21H
        CMP AL,0DH           ; IF PRESS ENTER(0DH), BREAK
        JE SHOW_OUTPUT
        
    SPACES:
        CMP AL,20H           ; SPACE = 20H
        JNE VOWELS
        INC SPACE            ; **(1)** INC SPACE 
        JMP WHILE
        
    VOWELS:
        CMP AL,'A'
        JE INCREMENT_VOWEL
        
        CMP AL,'E' 
        JE INCREMENT_VOWEL
        
        CMP AL,'I' 
        JE INCREMENT_VOWEL
        
        CMP AL,'O' 
        JE INCREMENT_VOWEL
        
        CMP AL,'U' 
        JE INCREMENT_VOWEL
        
        CMP AL,'a'
        JE INCREMENT_VOWEL
        
        CMP AL,'e' 
        JE INCREMENT_VOWEL
        
        CMP AL,'i' 
        JE INCREMENT_VOWEL
        
        CMP AL,'o' 
        JE INCREMENT_VOWEL
        
        CMP AL,'u' 
        JE INCREMENT_VOWEL
        
        JMP DIGITS          ; JUMP FOR DIGIT CHECKING 
        
      INCREMENT_VOWEL:
        INC VOWEL           ; **(2)** INC VOWEL
        JMP WHILE 
        
    DIGITS:
    
        CMP AL,'0'
        JL CONSONANTS 
        
        CMP AL,'9'
        JG CONSONANTS
        
        INC DIGIT           ; **(3)** INC DIGIT
        JMP WHILE
        
    CONSONANTS:
    
        CMP AL,'A'
        JL LOWER
        
        CMP AL,'Z'
        JG LOWER
        
        INC CONSONANT      ; **(4)** INC CONSONANT(UPPER CASE)
        JMP WHILE   
        
      LOWER:
        CMP AL,'a'
        JL WHILE
        
        CMP AL,'z'
        JG WHILE
        
        INC CONSONANT      ; **(4)** INC CONSONANT(LOWER CASE)
        JMP WHILE
        
    SHOW_OUTPUT:
        
        ; VOWEL
        MOV AH,09H
        LEA DX,MSG2
        INT 21H
        
        MOV AH,02H
        MOV DL,VOWEL
        ADD DL,30H
        INT 21H   
        
        ; CONSONANT
        MOV AH,09H
        LEA DX,MSG3
        INT 21H
        
        MOV AH,02H
        MOV DL,CONSONANT
        ADD DL,30H
        INT 21H
        
        ; DIGIT
        MOV AH,09H
        LEA DX,MSG4
        INT 21H
        
        MOV AH,02H
        MOV DL,DIGIT
        ADD DL,30H
        INT 21H 
        
        ; SPACE
        MOV AH,09H
        LEA DX,MSG5
        INT 21H
        
        MOV AH,02H
        MOV DL,SPACE
        ADD DL,30H
        INT 21H

        
    EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN
    