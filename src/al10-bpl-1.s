* AL10-BPL KEYTEST PROGRAM 1 from Assembly Lines, pg. 75

	ORG $300

KYBD	EQU $C000
STROBE	EQU $C010
PRBYTE	EQU $FDDA

CHECK	LDA KYBD
	CMP #$80
	BCC CHECK	; NO KEYPRESS
	JSR PRBYTE

CLR	STA STROBE
END	RTS
