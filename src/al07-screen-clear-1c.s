* This is based on AL07-SCREEN CLEAR PROGRAM 1B from
* Assembly Lines, pg. 51, but modified to work in the hi-res
* screen, as suggested at the end of the chapter.

* Make sure you run 'HGR' before running this program.
* Once done, type 'TEXT' to go back to text mode.

	ORG $300

KYBD	EQU $C000
STROBE	EQU $C010
PTR	EQU $06		; Pointer to byte in screen
CHAR	EQU $08

* Set PTR (6,7) to $2000 (base of hi-res screen buffer)
ENTRY	LDA #$20
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
	CMP #$40	; At end of hi-res screen buffer?
	BCC START
	LDA STROBE
	JMP ENTRY

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
