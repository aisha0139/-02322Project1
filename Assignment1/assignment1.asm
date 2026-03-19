.ORIG x3000
        LD    R0,A
        LD    R1,B
X       NOT   R2, R0 ; Negate A
        ADD   R2, R2, #1 ; Add 1 to the negated value
        ADD   R2, R2, R1 ;  Compute R1 - R0 to compare them
        BRz   DONE ; Branch if result is 
        
        ADD   R1, R1, #-1 ; Otherwise decrease 1
        ADD   R0, R0, #1 ; #Increase R0
        BRnzp X 
DONE    ST    R1, C
        TRAP  x25
A       .FILL 2
B       .FILL 8
C       .BLKW 1
        .END

