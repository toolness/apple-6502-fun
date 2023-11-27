* AL08-SOUND ROUTINE 2 from Assembly Lines, pg. 56

* (Note that routine 1 is entered directly into Monitor,
* so there's no file for it.)

	ORG $300

PITCH	EQU $06
SPKR	EQU $C030

ENTRY	LDY PITCH
	LDA SPKR
LOOP	DEY
	BNE LOOP
	JMP ENTRY

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
