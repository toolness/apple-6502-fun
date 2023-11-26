* AL05-PADDLE PROGRAM 1A from Assembly Lines, pg. 34

* Note that running this on Virtual ][ requries paddle config.
* Easiest way to do this is to use the pull-down menu option
* "Quick settings -> Use Arrows as Joystick".
* This isn't ideal because it only sends 3 discrete values,
* but it's better than nothing.

	ORG $300
PREAD	EQU $FB1E
HOME	EQU $FC58
COUT	EQU $FDED

START	JSR HOME
	LDX #$00	; Can change to 1 and use up/down arrows!
LOOP	JSR PREAD
	TYA
	JSR COUT
	JMP LOOP

* INFINITE LOOP (Press "Reset" in Virtaul ][ to abort)
