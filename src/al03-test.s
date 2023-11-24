* AL03-TEST PROGRAM 1 from Assembly Lines, pg. 19

	ORG $300
HOME	EQU $FC58

START	JSR HOME	; Clear the screen.
	LDA #$C1	; 'A'
	STA $700
	LDA #$D0	; 'P'
	STA $701
	STA $702
	LDA #$CC	; 'L'
	STA $703
	LDA #$C5        ; 'E'
	STA $704

END	RTS
