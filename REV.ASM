.MODEL SMALL

.STACK 100H

.DATA 

 MS1 DB 'TYPE A BINARY NUMBER,UP TO 8 DIGITS:$'
 MS2 DB 0DH,0AH,'THE BINARY REVERSE PATTERN IS  $'
 

.CODE


MAIN PROC

MOV AX,@DATA
MOV DS,AX

LEA DX,MS1
MOV AH,9
INT 21H

XOR BX,BX
MOV CX,8
MOV AH,1

INPUT1_:
        INT 21H
        CMP AL,0DH
        JE END1_
        AND AL,0FH
        SHL BL,1
        OR BL,AL
        LOOP INPUT1_

END1_:
     LEA DX,MS2
     MOV AH,9
     INT 21H

     XOR DX,DX
     MOV CX,8
REV:
    SHL BL,1
    RCR DL,1
    LOOP REV

    MOV BL,DL
    MOV CX,8
    MOV AH,2


F1_:
     
     SHL BL,1

     JNC F0_
     MOV DL,31H
     JMP DISPLAY_
     
F0_:
    MOV DL,30H

DISPLAY_:
         INT 21H
LOOP F1_   




MOV AH,4CH
INT 21H

MAIN ENDP
   END MAIN

