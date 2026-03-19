.ORIG x3000

        JSR readS ; Call subroutine
        HALT ; stop program after returning

readS
        LEA R0, PROMPT
        PUTS ; Print message asking for input

        GETC
        OUT
        LD R1, OFFSET
        ADD R2, R0, R1 ; Read first digit and convert it from ASCII to its actual numerical value

        GETC
        OUT
        ADD R0, R0, R1 ; Read second digit and convert it from ASCII to its actual numerical value 
     
       ; Multiply first digit by 10 using repeated addition
        ADD R2, R2, R2     ; 2 * first digit
        ADD R3, R2, R2     ; 4 * first digit
        ADD R3, R3, R3     ; 8 * first digit
        ADD R4, R3, R2     ; 10 * first digit
        ADD R0, R4, R0     ; Add second digit to 10 * first digit, final result in R0

        RET ; return to main 

OFFSET  .FILL #-48 ;  ASCII offset for converting a character digit into an integer
PROMPT  .STRINGZ "Input a 2 digit decimal number:"
.END