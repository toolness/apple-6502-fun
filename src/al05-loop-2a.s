* AL05-LOOP PROGRAM 2A from Assembly Lines, pg. 28

	ORG $300
HOME	EQU $FC58

START	JSR HOME
	JMP SETX
END	RTS

SETX	LDX #$FF
LOOP	STX $700
	DEX
	BEQ END
	JMP LOOP