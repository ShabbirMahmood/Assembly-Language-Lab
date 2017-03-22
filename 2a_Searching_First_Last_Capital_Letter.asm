;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1b Finding First & Last Capital Letter Date: 03-03-2017  
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      
      MSG1 DB       'Enter the Input String: $'
      MSG2 DB CR,LF,'First Capital Letter(Alphabatical Order)is: $' 
      MSG3 DB CR,LF,'Last Capital Letter(Alphabatical Order)is : $'
      MSG4 DB CR,LF,'No Capitals $' 
      
      FIRST DB '['
      LAST  DB '@'
         
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX            ; ADJUSTING PROGRAM SEGMENT PREFIX(PSP)
        
        MOV AH,09H
        LEA DX,MSG1
        INT 21H   
        
       
        
    TOP: 
        MOV AH,01H
        INT 21H
        CMP AL,0DH           ; NEW LINE CHARACTER
        JE OUTPUT
        
        CMP AL,'A'           ; INPUT CHARACTER IS LESS THAN 'A' (ASCII VALUE)
        JL TOP  
        
        CMP AL,'Z'           ; INPUT CHARACTER IS GREATER THAN 'Z' (ASCII VALUE)
        JG TOP  
        
        CMP AL,FIRST         ; INPUT CHARACTER IS LESS THAN 'FIRST' (ASCII VALUE) SO UPDATE THE FIRST CAPITAL LETTER
        JG CHECK_LAST
        MOV FIRST,AL
        ;JMP TOP         ;***********  NOT NEED/ BECAUSE, IF ONE ENTERs ONLY ONE CAPITAL LETTER, IT WILL ALSO THE LAST LETTER 
        
    CHECK_LAST:
    
        CMP AL,LAST         ; INPUT CHARACTER IS GREATER THAN 'LAST' (ASCII VALUE) SO UPDATE THE LAST CAPITAL LETTER
        JL  TOP
        MOV LAST,AL 
        JMP TOP         ;*********** 
        
    OUTPUT:
        CMP FIRST,'['
        JNE  MAIN_OUTPUT
        
        MOV AH,09H
        LEA DX,MSG4
        INT 21H
        JMP EXIT
        
    MAIN_OUTPUT:
    
        MOV AH,09H
        LEA DX,MSG2
        INT 21H 
        
        MOV AH,02H
        MOV DL,FIRST        ; FIRST CAPITAL LETTER
        INT 21H 
        
        MOV AH,09H
        LEA DX,MSG3
        INT 21H
        
        MOV AH,02H
        MOV DL,LAST         ; LAST CAPITAL LETTER
        INT 21H
        
        JMP EXIT

    EXIT:    
        
        MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN