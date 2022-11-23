//Assignment 2 - Shafi Uzman
      MOV R0, #codes
      BL getcode
      halt
getcode:                //function 
      PUSH {R1,R2,R3,R4}
loopCode:
      LDRB R4, [R2 + R1]
      CMP R4, #114      //testing r - red code
      BEQ testCode
      CMP R4, #103      //testing g - green code
      BEQ testCode
      CMP R4, #98       //testing b - blue code
      BEQ testCode
      CMP R4, #121      //testing y - yellow code
      BEQ testCode
      CMP R4, #112      //testing p - purple code
      BEQ testCode
      CMP R4, #99       //testing c - cyan code
      BEQ testCode
      CMP R4, #0        //testing a null value
      BEQ testCode
      B wrongCode
wrongCode:
      MOV R1, #0 
      MOV R3, #t1
      STR R3, .WriteString
      MOV R2, R0
      STR R2, .ReadString
testCode:
      ADD R1, R1, #1    //increase index to loop via an array
      CMP R4, #0
      BNE loopCode
      CMP R1, #5 
      BNE wrongCode
      POP {R1,R2,R3,R4}
      RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;labels;;;;;;;;;;;;;;;;;;;;;;;;;;;;
t1:   .ASCIZ "Enter a code: \n"
codes: .BLOCK 8
