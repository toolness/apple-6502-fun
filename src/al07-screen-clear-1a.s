* AL07-SCREEN CLEAR PROGRAM 1A from Assembly Lines, pg. 50

	ORG $300

PTR	EQU $06		; Pointer to byte in screen

* Set PTR (6,7) to $400 (base of screen buffer)
ENTRY	LDA #$04
	STA PTR+1
	LDY #$00
	STY PTR

START	LDA #$A0	; ' ' character
LOOP	STA (PTR),Y
	INY
	BNE LOOP
NXT	INC PTR+1
	LDA PTR+1
	CMP #$08	; At end of screen buffer?
	BCC START
EXIT	RTS
