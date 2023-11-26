* AL06-KEYBOARD PROGRAM 1A from Assembly Lines, pg. 42

* Note that in Virtual ][, you need to enable caps lock
* (or hold shift) when pressing keys, otherwise they will
* show up as punctuation or numbers, which is super weird.

	ORG $300

KYBD	EQU $C000
STROBE	EQU $C010
COUT	EQU $FDED
HOME	EQU $FC58

START	JSR HOME
LOOP	LDA KYBD
	CMP #$80
	BCC LOOP
	JSR COUT
	JMP LOOP

* INFINITE LOOP (Press "Reset" in Virtaul ][ to abort)
