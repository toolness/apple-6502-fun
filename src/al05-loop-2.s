* AL05-LOOP PROGRAM 2 from Assembly Lines, pg. 27

	ORG $300
HOME	EQU $FC58

START	JSR HOME
	LDX #$FF
LOOP	STX $700
	DEX
	BEQ END
	JMP LOOP

END	RTS
