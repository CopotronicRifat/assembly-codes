.MODEL SMALL

.STACK 100H

.DATA 

 MSG1 DB 'ENTER A HEX DIGIT: $'
 MSG2 DB 0DH,0AH,'IN DECIMAL IT IS: $'

.CODE

MAIN PROC

 MOV AX,@DATA
 MOV DS,AX

 LEA DX,MSG1
 MOV AH,9
 INT 21H

 MOV AH,1
INT 21H 
 MOV BL,AL
 
 LEA DX,MSG2
 MOV AH,9
 INT 21H

 MOV AH,2
 MOV DL,31H
 INT 21H

 MOV AH,2 
 
 CMP BL,'A'
 JE DISPLAY1

 CMP BL,'B'
 JE DISPLAY2
 
 CMP BL,'C'
 JE DISPLAY3
  
 CMP BL,'D'
 JE DISPLAY4

 CMP BL,'E'
 JE DISPLAY5

 CMP BL,'F'
 JE DISPLAY6

 JMP END_CASE

DISPLAY1:
         MOV DL,30H
         JMP END_

DISPLAY2:
         MOV DL,31H
         JMP END_

DISPLAY3:
         MOV DL,32H
         JMP END_
DISPLAY4:
         MOV DL,33H
         JMP END_
DISPLAY5:
         MOV DL,34H
         JMP END_
DISPLAY6:
         MOV DL,35H
         JMP END_
 END_:
        INT 21H
END_CASE:

         MOV AH,4CH
         INT 21H

MAIN ENDP
     END MAIN  
       

         
       

 