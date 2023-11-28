* AL08-SOUND ROUTINE 4 from Assembly Lines, pg. 58

* Like the original but press 'Q' to exit.

	ORG $300

KYBD	EQU $C000
STROBE	EQU $C010
SPKR	EQU $C030

ENTRY	LDA KYBD
	STA STROBE
	CMP #$F1	; 'Q' on Virtual ][
	BEQ EXIT
	TAY
LOOP	LDA SPKR
DELAY	DEY
	BNE DELAY
	JMP ENTRY

EXIT	RTS