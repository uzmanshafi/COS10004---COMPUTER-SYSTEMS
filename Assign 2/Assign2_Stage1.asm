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
 22|      halt
 23|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 24|;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 25|;;;;;;;;;;;;;;;;;labels;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 26|t1:   .ASCIZ "Enter the codemaker's name:\n"
 27|t2:   .ASCIZ "Enter the codebreaker's name:\n"
 28|t3:   .ASCIZ "Enter the maximum number of queries guesses allowed:\n"
 29|output1: .ASCIZ "Codebreaker is "
 30|output2: .ASCIZ "\nCodemaker is "
 31|output3: .ASCIZ "\nMaximum number of guesses:"
 32|codemaker: .BLOCK 8
 33|codebreaker: .BLOCK 8
