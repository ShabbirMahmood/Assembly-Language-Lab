;Shabbir Mahmood ID: 14015139 Assembly Language Lab Problem-1a(Number Processsing(Series Summation))  Date: 07-03-2017
.MODEL SMALL
.STACK 100H
.DATA
      LF EQU 0AH
      CR EQU 0DH
      MSG1 DB 'Enter the Value of N: $'
      MSG2 DB CR,LF,'Summation of the Series from 0 to N is: $'
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
        
        CMP AL,03D           ; ******* CHECKING N>=3 ? 
        JLE OK               ; IN N IS <= 3 THEN OK
        
    WRONG_ENTRY: 
    
        LEA DX,MSG3
        MOV AH,09H
        INT 21H
        JMP EXIT
        
        
    OK:
        
        XOR CX,CX            ; CLEARING COUNT REGISTER ************* VERY IMPORTANT
        MOV CL,AL            ; INITIALIZE COUNT REGISTER BY THE AL(N)
         
        MOV BL,0D            ; SUMMATION WILL BE STORED HERE, INITIALLY 0
       
        JCXZ SKIP            ; IF WE ENTER 0 AS N VALUE THEN SKIP ************
        
       
        
    SUMMATION:
        
        ADD BL,CL
        LOOP  SUMMATION 
        
    SKIP:
        LEA DX,MSG2
        MOV AH,09H
        INT 21H 
        
        ADD BL,30H            ; CONVERTING TO CHARACTER
        MOV DL,BL
        
        MOV AH,02H            ; SUMMATION
        INT 21H        
        
        EXIT:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
    END MAIN