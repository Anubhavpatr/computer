  1|init:
  2|      MOV R8,#msg1
  3|      STR R8,.WriteString
  4|      MOV R7,#codemaker
  5|      STR R7,.ReadString ;reads in the codemaker
  6|      MOV R8,#msg2
  7|      STR R8,.WriteString
  8|      MOV R9,#codebreaker
  9|      STR R9,.ReadString ;reads in the codebreaker
 10|      MOV R8, #msg3
 11|      STR R8, .WriteString
 12|      LDR R10,.InputNum ;reads in the maximum number of choices
 13|      MOV R11, #secretcode
 14|      MOV R12, #querycode
 15|Main:
 16|      STR R7, .WriteString
 17|      MOV R8, #msg8
 18|      STR R8,.WriteString
 19|      MOV R6, R11
 20|      BL getcode
 21|Loop2:
 22|      STR R9, .WriteString
 23|      MOV R8,#msg9
 24|      STR R8,.WriteString
 25|      STR R10,.WriteUnsignedNum
 26|      MOV R6,R12
 27|      BL getcode
 ;code comparison is done here
 MOV R5,R11
 BL comparecodes
 28|      SUB R10,R10,#1
 29|      CMP R10,#0
 30|      BEQ Done
 31|      B Loop2
 32|Done:
 33|      MOV R8, #msg4
 34|      STR R8, .WriteString
 35|      STR R9, .WriteString
 36|      MOV R8, #msg5
 37|      STR R8, .WriteString
 38|      STR R7, .WriteString
 39|      MOV R8, #msg6
 40|      STR R8, .WriteString
 41|      STR R10,.WriteUnsignedNum
 42|      HALT
 43|getcode:
 44|      PUSH {R1,R7,R8,R9}
 45|start:
 46|      MOV R1,R6
 47|      MOV R9,#0
 48|      MOV R8,#msg7
 49|      STR R8,.WriteString
 50|      MOV R8,#choice
 51|      STR R8,.ReadString
 52|Loop1:
 53|      LDRB R1,[R8 + R9]
 54|      ORR R1,R1,#32
 55|      CMP R1,#0
 56|      BEQ start
 57|      CMP R1, #114      ;r
 58|      BEQ continue
 59|      CMP R1, #103      ;g
 60|      BEQ continue
 61|      CMP R1, #98
 62|      BEQ continue
 63|      CMP R1, #121      ;y
 64|      BEQ continue
 65|      CMP R1, #112      ;p
 66|      BEQ continue
 67|      CMP R1, #99       ;c
 68|      BEQ continue
 69|      B start
 70|continue:
 71|      ADD R9,R9,#1
 72|      ADD R1,R1,#4
 73|      CMP R9, #4
 74|      BNE Loop1
 75|      POP {R1,R7,R8,R9}
 76|      RET
 comparecodes:
 PUSH {R1,R2,R7,R8}
 MOV R1,R5 ;takes the code makers code
 MOV R2,R6 ;takes the code breaker's code
 LDRB R7,R1
 LDRB R8,R1
 CMP R7,R8
 
 POP {R1,R2,R7,R8}
 RET
 77|codemaker: .BLOCK 128
 78|codebreaker: .BLOCK 128
 79|choice: .BLOCK 32
 80|msg1: .ASCIZ "Please Enter the codemaker's name\n"
 81|msg2: .ASCIZ "Please Enter the codebreaker's name\n"
 82|msg3: .ASCIZ "Please Enter the maximum number of guesses\n"
 83|msg4: .ASCIZ "Codebreaker is "
 84|msg5: .ASCIZ "\nCodemaker is "
 85|msg6: .ASCIZ "\nMaximum number of guesses "
 86|msg7: .ASCIZ "\nEnter a code: "
 87|msg8: .ASCIZ ", Please enter a 4-character secret code\n"
 88|msg9: .ASCIZ ", this is a guess number: "
 89|secretcode: .Word 0
 90|      0
 91|      0
 92|      0
 93|querycode: .Word 0
 94|      0
 95|      0
 96|      0
