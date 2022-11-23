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
 29|loopQuery:
 30|      MOV R1, #codebreaker
 31|      STR R1, .WriteString
 32|      MOV R3, #output6
 33|      STR R3, .WriteString
 34|      STR R11, .WriteUnsignedNum
 35|      MOV R0, #querycode
 36|      BL getcode
 37|      BL comparecodes
 38|      SUB R11, R11,#1
 39|      CMP R11, #0
 40|      BGT loopQuery
 41|      MOV R2, #secretcode
 42|      halt
 43|getcode:
 44|      PUSH {R1,R2,R3,R4}
 45|loopCode:
 46|      LDRB R4, [R2 + R1]
 47|      CMP R4, #114      //testing r - red code
 48|      BEQ testCode
 49|      CMP R4, #103      //testing g - green code
 50|      BEQ testCode
 51|      CMP R4, #98       //testing b - blue code
 52|      BEQ testCode
 53|      CMP R4, #121      //testing y - yellow code
 54|      BEQ testCode
 55|      CMP R4, #112      //testing p - purple code
 56|      BEQ testCode
 57|      CMP R4, #99       //testing c - cyan code
 58|      BEQ testCode
 59|      CMP R4, #0        //testing a null value
 60|      BEQ testCode
 61|      B wrongCode
 62|wrongCode:
 63|      MOV R1, #0 
 64|      MOV R3, #t4
 65|      STR R3, .WriteString
 66|      MOV R2, R0
 67|      STR R2, .ReadString
 68|testCode:
 69|      ADD R1, R1, #1    //increase index to loop via an array
 70|      CMP R4, #0
 71|      BNE loopCode
 72|      CMP R1, #5 
 73|      BNE wrongCode
 74|      POP {R1,R2,R3,R4}
 75|      RET
 76|comparecodes:
 77|      PUSH {R2,R3,R4,R5,R7,R8,R9,R10}
 78|      MOV R1, #0
 79|      MOV R0, #-1
 80|      MOV R7, #0 
 81|      MOV R8, #0 
 82|      MOV R5, #0 
 83|      MOV R10, #0 
 84|      MOV R2, #secretcode 
 85|      MOV R3, #querycode 
 86|ArrayIteration:
 87|      MOV R10, #0
 88|      LDRB R4, [R3 + R5] 
 89|      LDRB R9, [R2+R5] 
 90|      CMP R4, R9
 91|      BNE CaseTwoSecond
 92|      BEQ CaseOneValidation
 93|CaseOneValidation:
 94|      ADD R0, R0, #1
 95|      B ArrayIterationConti
 96|CaseTwoSecond:
 97|      ADD R10, R10, #1
 98|      LDRB R9, [R2+R10]
 99|      CMP R4,R9
100|      BNE CaseThowThird
101|      BEQ CaseTwoValidation
102|CaseThowThird:
103|      ADD R10, R10, #1
104|      LDRB R9, [R2+R10]
105|      CMP R4,R9
106|      BNE CaseTwoFourth
107|      BEQ CaseTwoValidation
108|CaseTwoFourth:
109|      ADD R10, R10,#1
110|      LDRB R9, [R2+R10]
111|      CMP R4,R9
112|      BNE ArrayIterationConti
113|CaseTwoValidation:
114|      ADD R1, R1, #1
115|      B ArrayIterationConti
116|ArrayIterationConti:
117|      ADD R5, R5, #1
118|      CMP R4, #0
119|      BNE ArrayIteration
120|      POP {R2,R3,R4,R5,R7,R8,R9}
121|      RET
122|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
123|;;;;;;;;;;;;;;;; || labels || ;;;;;;;;;;;;;;;;;;;;;
124|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
125|t1:   .ASCIZ "Enter the codemaker's name:\n"
126|t2:   .ASCIZ "Enter the codebreaker's name:\n"
127|t3:   .ASCIZ "Enter number of queries guess:\n"
128|t4:   .ASCIZ "\nEnter a code: \n"
129|output1: .ASCIZ "\nCodebreaker is "
130|output2: .ASCIZ "\nCodemaker is "
131|output3: .ASCIZ "\nMaximum number of guesses:"
132|output4: .ASCIZ " , please enter a 4-character secret code"
133|output5: .ASCIZ "\n"
134|output6: .ASCIZ " , this is guess number : "
135|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
136|;;;; || arrays labels holding names and code || ;;;
137|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
138|codemaker: .BLOCK 8
139|codebreaker: .BLOCK 8
140|code: .BLOCK 8
141|secretcode: .BLOCK 8
142|querycode: .BLOCK 8
