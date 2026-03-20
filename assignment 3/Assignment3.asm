.ORIG x3000

        LD R0, USERDATA 
        JSR isPrime
        HALT

isPrime
        AND R5, R5, #0
        LEA R5, PRIMES ; Load address of the prime array into R5

        ADD R3, R0, #0
        NOT R3, R3
        ADD R3, R3, #1 ; Make the input negative once before the loop

LOOP1   LDR R2, R5, #0 ; Load current prime number from the array
        BRz NOTPRIME   ; If end of array is reached, number is not prime

        ADD R4, R2, R3 ; Compare current prime with input value

        BRz PRIME      ; If result is 0, the number is prime
        BRp NOTPRIME   ; If current prime is bigger than input, it is not prime

        ADD R5, R5, #1 ; Move to the next prime number in the array
        BRnzp LOOP1

PRIME   AND R0, R0, #0
        ADD R0, R0, #1  ; Return 1 if the number is prime
        RET

NOTPRIME
        AND R0, R0, #0  ; Return 0 if the number is not prime
        RET

USERDATA .FILL #11

PRIMES  .FILL #2
        .FILL #3
        .FILL #5
        .FILL #7
        .FILL #11
        .FILL #13
        .FILL #17
        .FILL #19
        .FILL #23
        .FILL #29
        .FILL #31
        .FILL #37
        .FILL #41
        .FILL #43
        .FILL #47
        .FILL #53
        .FILL #59
        .FILL #61
        .FILL #67
        .FILL #71
        .FILL #73
        .FILL #79
        .FILL #83
        .FILL #89
        .FILL #97
        .FILL #0             ; End marker

.END