* AL10-BPL BUTTON TEST from Assembly Lines, pg. 76

* Note that running this on Virtual ][ requries paddle config.
* Easiest way to do this is to use the pull-down menu option
* "Quick settings -> Use Arrows as Joystick". Then use the
* Command key to simulate a joystick/paddle button push.

	ORG $300

PB0	EQU $C061
PRBYTE	EQU $FDDA

CHECK	LDA PB0
	BPL CHECK	; NO BUTTON PUSH
	JSR PRBYTE

END	RTS
