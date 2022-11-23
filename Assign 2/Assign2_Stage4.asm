//Assignment 2 - Shafi Uzman  
      MOV R3, #t1 
      STR R3, .WriteString 
      MOV R0, #codemaker 
      STR R0, .ReadString 
      MOV R3, #t2
      STR R3, .WriteString
      MOV R1, #codebreaker
      STR R1, .ReadString
      MOV R3, #t3
      STR R3, .WriteString
      LDR R11, .InputNum
      MOV R3, #output1
      STR R3, .WriteString
      STR R1, .WriteString
      MOV R3, #output2
      STR R3, .WriteString
      STR R0, .WriteString
      MOV R3, #output3
      STR R3, .WriteString
      STR R11, .WriteUnsignedNum
      MOV R3, #output4
      MOV R4, #output5
      STR R4, .WriteString
      STR R0, .WriteString
      STR R3, .WriteString
      MOV R0, #secretcode 
      BL getcode
loopQuery:
      STR R1, .WriteString
      MOV R3, #output6
      STR R3, .WriteString
      STR R11, .WriteUnsignedNum
      MOV R0, #querycode
      BL getcode
      SUB R11, R11,#1
      CMP R11, #0
      BGT loopQuery 
      halt
getcode:
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
      MOV R3, #t4
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
;;;;;;;;;;;;;;;; || labels || ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
t1:   .ASCIZ "Enter the codemaker's name:\n"
t2:   .ASCIZ "Enter the codebreaker's name:\n"
t3:   .ASCIZ "Enter number of queries guess:\n"
t4:   .ASCIZ "\nEnter a code: \n"
output1: .ASCIZ "\nCodebreaker is "
output2: .ASCIZ "\nCodemaker is "
output3: .ASCIZ "\nMaximum number of guesses:"
output4: .ASCIZ " , please enter a 4-character secret code"
output5: .ASCIZ "\n"
output6: .ASCIZ " , this is guess number : "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; || arrays labels holding names and code || ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
codemaker: .BLOCK 8
codebreaker: .BLOCK 8
secretcode: .BLOCK 8
querycode: .BLOCK 8
