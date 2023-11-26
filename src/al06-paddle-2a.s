* AL05-PADDLE PROGRAM 2A from Assembly Lines, pg. 3

* Note that running this on Virtual ][ requries paddle config.
* Easiest way to do this is to use the pull-down menu option
* "Quick settings -> Use Arrows as Joystick".
* This isn't ideal because it only sends 3 discrete values,
* but it's better than nothing.

* Note that the original program displayed only when the
* paddle's value was within the ASCII range, but because
* the Virtual ]['s arrows->joystick emulation only allows
* the paddle to be 0, 127, or 255, I modified the original
* to display 'L' when the user is pressing the left arrow,
* and 'R' when they are pressing the right arrow.

	ORG $300
PREAD	EQU $FB1E
HOME	EQU $FC58
COUT	EQU $FDED

START	JSR HOME
	LDX #$00
LOOP	JSR PREAD
	CPY #127
	BCC LEFT
	CPY #128
	BCS RIGHT
	JMP LOOP
LEFT
	LDA #$CC		; 'L' (for 'Left')
	JMP PRINT
RIGHT
	LDA #$D2		; 'R' (for 'Right')
PRINT
	JSR COUT
	JMP LOOP

* INFINITE LOOP (Press "Reset" in Virtaul ][ to abort)
