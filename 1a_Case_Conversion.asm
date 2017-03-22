; My First Git File
;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1a(Case Conversion of Input String)  Date: 25-02-2017
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
        
    LOOP_1:
        INT 21H
        CMP AL,0DH
        JE EXIT_LOOP_1
        
        MOV ARRAY[BX],AL     ; STORING CHARACTER INTO ARRAY
        INC BX
        JMP LOOP_1           ;UNCODITIONAL JUMP TO LOOP_1 
    
    EXIT_LOOP_1:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H              ; SHOWING MESSAGE FOR OUTPUT 
        
        MOV CX,BX            ; STORING TOTAL NUMBER OF CHARACTER INTO COUNT REGISTER CX
        MOV BX,00H           ; CLEARING BASE REGISTER BX
        
    CHECKING_LOOP:
        MOV DL,ARRAY[BX]     ; COPYING CHARACTER FROM THE ARRAY ONE BY ONE FOR CHECKING
        CMP DL,'a'           
        JL NOT_LOWERCASE     ;IF  ASCII VALE OF DL IS LESS(JL)  THAN 'a' THEN JUMP
        CMP DL,'z' 
        JG NOT_LOWERCASE     ;IF  ASCII VALE OF DL IS GREATER(JG)  THAN 'z' THEN JUMP
        
        ;******* LOWER_TO_UPPER_CASE_CONVERSION *******
        LOWER_TO_UPPER_CASE_CONVERSION:
        SUB DL,20H
        MOV AH,02H
        INT 21H
        
        INC BX
        CMP BX,CX
        JNZ CHECKING_LOOP    ; IF THE VALUE IS NOT ZERO THEN CHECK THE LOOP AGAIN 
        JMP TERMINATE
        
    NOT_LOWERCASE:
        CMP DL,'A'           
        JL NOT_UPPERCASE     ;IF  ASCII VALE OF DL IS LESS(JL)  THAN 'a' THEN JUMP
        CMP DL,'Z' 
        JG NOT_UPPERCASE     ;IF  ASCII VALE OF DL IS GREATER(JG)  THAN 'z' THEN JUMP
        
        ;******* UPPER_TO_LOWER_CASE_CONVERSION *******
        UPPER_TO_LOWER_CASE_CONVERSION:
        ADD DL,20H
        MOV AH,02H
        INT 21H
        
        INC BX
        CMP BX,CX
        JNZ CHECKING_LOOP    ; IF THE VALUE IS NOT ZERO THEN CHECK THE LOOP AGAIN 
        JMP TERMINATE        ; UNCONDITIONAL JUMP TO TERMINATE THE PROGRAM 
        
         ;******* NON CHARACTER (NOT A-Z & a-z) *******
    NOT_UPPERCASE:
        MOV AH,02H
        INT 21H
        
        INC BX 
        CMP BX,CX
        JNZ CHECKING_LOOP    ; IF THE VALUE IS NOT ZERO THEN CHECK THE LOOP AGAIN 
        JMP TERMINATE        ; UNCONDITIONAL JUMP TO TERMINATE THE PROGRAM 
       
    TERMINATE:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN
    
