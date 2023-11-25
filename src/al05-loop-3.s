* AL05-LOOP PROGRAM 3 from Assembly Lines, pg. 31

	ORG $300
CTR	EQU $06		; Location of counter in zero page
HOME	EQU $FC58
COUT	EQU $FDED

START	JSR HOME
	LDA #$0
	STA CTR		; Set CTR to 0

LOOP	LDA CTR
	JSR COUT
	INC CTR
	BEQ END
	JMP LOOP

END	RTS