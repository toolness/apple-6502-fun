* AL08-SOUND ROUTINE 5 from Assembly Lines, pg. 59

* Note that running this on Virtual ][ requries paddle config.
* Easiest way to do this is to use the pull-down menu option
* "Quick settings -> Use Arrows as Joystick".
* This isn't ideal because it only sends 3 discrete values,
* but it's better than nothing.

	ORG $300

PDL	EQU $FB1E
SPKR	EQU $C030

ENTRY	LDX #$00	; Left/right arrows on Virtual ][
	JSR PDL
	LDA SPKR
	LDX #$01	; Up/down arrows on Virtual ][
	JSR PDL
	LDA SPKR
	JMP ENTRY

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
