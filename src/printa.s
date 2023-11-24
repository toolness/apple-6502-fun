    ORG $300
    LDA #$D
    JSR $FDDA   ; PRBYTE, print a hexadecimal byte
    JMP $3D0    ; see pg 35 of assembly lines
