* AL09-BYTE DISPLAY PROGRAM 1 from Assembly Lines, pg. 61

	ORG $300

CHR	EQU $06
PRBYTE	EQU $FDDA
COUT	EQU $FDED
PREAD	EQU $FB1E
HOME	EQU $FC58

START	JSR HOME
GETCHR	LDX #$00
	JSR PREAD
	STY CHR
	TYA
	JSR PRBYTE
	LDA #$A0	; SPACE
	JSR COUT
	LDA CHR
	JSR COUT
	LDA #$8D	; RETURN
	JSR COUT
	JMP GETCHR
