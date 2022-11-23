  1|//Assignment 2 - Shafi Uzman  
  2|      MOV R3, #t1 
  3|      STR R3, .WriteString 
  4|      MOV R0, #codemaker 
  5|      STR R0, .ReadString 
  6|      MOV R3, #t2
  7|      STR R3, .WriteString
  8|      MOV R1, #codebreaker
  9|      STR R1, .ReadString
 10|      MOV R3, #t3
 11|      STR R3, .WriteString
 12|      LDR R11, .InputNum
 13|      MOV R3, #output1
 14|      STR R3, .WriteString
 15|      STR R1, .WriteString
 16|      MOV R3, #output2
 17|      STR R3, .WriteString
 18|      STR R0, .WriteString
 19|      MOV R3, #output3
 20|      STR R3, .WriteString
 21|      STR R11, .WriteUnsignedNum
 22|      MOV R3, #output4
 23|      MOV R4, #output5
 24|      STR R4, .WriteString
 25|      STR R0, .WriteString
 26|      STR R3, .WriteString
 27|      MOV R0, #secretcode 
 28|      BL getcode
 29|      STR R0, .WriteString
 30|      halt
 31|getcode:
 32|      PUSH {R1,R2,R3,R4}
 33|loopCode:
 34|      LDRB R4, [R2 + R1]
 35|      CMP R4, #114      //testing r - red code
 36|      BEQ testCode
 37|      CMP R4, #103      //testing g - green code
 38|      BEQ testCode
 39|      CMP R4, #98       //testing b - blue code
 40|      BEQ testCode
 41|      CMP R4, #121      //testing y - yellow code
 42|      BEQ testCode
 43|      CMP R4, #112      //testing p - purple code
 44|      BEQ testCode
 45|      CMP R4, #99       //testing c - cyan code
 46|      BEQ testCode
 47|      CMP R4, #0        //testing a null value
 48|      BEQ testCode
 49|      B wrongCode
 50|wrongCode:
 51|      MOV R1, #0 
 52|      MOV R3, #t4
 53|      STR R3, .WriteString
 54|      MOV R2, R0
 55|      STR R2, .ReadString
 56|testCode:
 57|      ADD R1, R1, #1    //increase index to loop via an array
 58|      CMP R4, #0
 59|      BNE loopCode
 60|      CMP R1, #5 
 61|      BNE wrongCode
 62|      POP {R1,R2,R3,R4}
 63|      RET
 64|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 65|;;;;;;;;;;;;;;;; || labels || ;;;;;;;;;;;;;;;;;;;;;
 66|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 67|t1:   .ASCIZ "Enter the codemaker's name:\n"
 68|t2:   .ASCIZ "Enter the codebreaker's name:\n"
 69|t3:   .ASCIZ "Enter number of queries guess:\n"
 70|t4:   .ASCIZ "\nEnter a code: \n"
 71|output1: .ASCIZ "\nCodebreaker is "
 72|output2: .ASCIZ "\nCodemaker is "
 73|output3: .ASCIZ "\nMaximum number of guesses:"
 74|output4: .ASCIZ " , please enter a 4-character secret code"
 75|output5: .ASCIZ "\n"
 76|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 77|;;;; || arrays labels holding names and code || ;;;
 78|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 79|codemaker: .BLOCK 8
 80|codebreaker: .BLOCK 8
 81|secretcode: .BLOCK 8
