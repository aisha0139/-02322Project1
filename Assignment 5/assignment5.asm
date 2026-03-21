.ORIG x3000

START
LOOP        LEA   R0, MSG1
            PUTS
            JSR   readS
            JSR   isPrime
            JSR   resultS
            BRnzp LOOP
readS
            GETC
            OUT
            LD    R1, OFFSET
            ADD   R2, R0, R1

            GETC
            OUT
            ADD   R0, R0, R1

            ADD   R2, R2, R2
            ADD   R3, R2, R2
            ADD   R3, R3, R3
            ADD   R4, R3, R2
            ADD   R0, R4, R0
            RET


isPrime
            AND   R1, R1, #0
            AND   R2, R2, #0
            AND   R3, R3, #0
            AND   R4, R4, #0

            LD    R1, Array
            LEA   R2, PrimeNums

CheckPrime
            ADD   R1, R1, #-1
            BRn   NotPrime

            LDR   R3, R2, #0
            NOT   R4, R3
            ADD   R4, R4, #1
            ADD   R4, R4, R0
            BRz   Prime

            ADD   R2, R2, #1
            BRnzp CheckPrime

Prime
            AND   R0, R0, #0
            ADD   R0, R0, #1
            RET

NotPrime
            AND   R0, R0, #0
            RET


resultS
            ADD   R0, R0, #0
            BRz   ShowNotPrime

ShowPrime
            LEA   R0, MSG3
            PUTS
            RET

ShowNotPrime
            LEA   R0, MSG2
            PUTS
            RET


OFFSET      .FILL #-48
Array       .FILL #25

MSG1        .STRINGZ "\nInput a 2 digit decimal number:"
MSG2        .STRINGZ "\nThe number is not prime"
MSG3        .STRINGZ "\nThe number is prime"

PrimeNums   .FILL #2
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

.END