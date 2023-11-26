* AL07-SCREEN CLEAR PROGRAM 1B from Assembly Lines, pg. 51

* Note that my solution differs from the one in the book
* because I derived it myself, instead of copying from
* the book.

* You can try running 'GR' or 'TEXT' before running this
* program to see different kinds of effects based on
* graphics or text mode, respectively.

	ORG $300

KYBD	EQU $C000
STROBE	EQU $C010
PTR	EQU $06		; Pointer to byte in screen
CHAR	EQU $08

* Set PTR (6,7) to $400 (base of screen buffer)
ENTRY	LDA #$04
	STA PTR+1
	LDY #$00
	STY PTR
GETCHAR	LDA KYBD
	CMP #$80	; Is key an ASCII character?
	BCC GETCHAR
	STA CHAR
START	LDA CHAR
LOOP	STA (PTR),Y
	INY
	BNE LOOP
NXT	INC PTR+1
	LDA PTR+1
	CMP #$08	; At end of screen buffer?
	BCC START
	LDA STROBE
	JMP ENTRY

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
