* AL09-BYTE DISPLAY PROGRAM 2 from Assembly Lines, pg. 63

	ORG $300

PRBYTE	EQU $FDDA
COUT	EQU $FDED
PREAD	EQU $FB1E
HOME	EQU $FC58

START	JSR HOME
GETCHR	LDX #$00
	JSR PREAD
	TYA
	PHA
	JSR PRBYTE
	LDA #$A0	; SPACE
	JSR COUT
	PLA
	JSR COUT
	LDA #$8D	; RETURN
	JSR COUT
	JMP GETCHR