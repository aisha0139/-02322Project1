.ORIG x3000

LD R0, USERDATA
JSR resultS
HALT

resultS
ADD R0, R0, #0  ; Set condition codes based on R0

BRz NOTPRIME        
LEA R0, PRIME_MSG
PUTS
RET

NOTPRIME
LEA R0, NOTPRIME_MSG
PUTS
RET

PRIME_MSG      .STRINGZ "The number is prime"
NOTPRIME_MSG   .STRINGZ "The number is not prime"

USERDATA       .FILL #1

.END