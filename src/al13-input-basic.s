* AL13-INPUT ROUTINE FP BASIC from Assembly Lines, pg. 110

* IN$="" MUST BE FIRST VARIABLE
* DEFINED IN PROGRAM!

	ORG $300

GETLN	EQU $FD6F
VARTAB	EQU $69		; Ptr to start of BASIC's variable table
BUFF	EQU $200	; Where we store user input

ENTRY	LDX #$00
	JSR GETLN
	LDY #$02	; Offset of length byte in *VARTAB[0]
	TXA
	STA (VARTAB),Y	; Store len of str in *VARTAB[0]
	INY		; Y = 3
	LDA #<BUFF
	STA (VARTAB),Y
	INY		; Y = 4
	LDA #>BUFF
	STA (VARTAB),Y	; Point loc of str in *VARTAB[0] at BUFF
XFER	TXA
	TAY		; Y-REG = LEN NOW
X2	LDA BUFF,Y
	AND #$7F	; Remove high bit
	STA BUFF,Y
	DEY
	CPY #$FF	; Did Y just decrement past 0?
	BNE X2

DONE	RTS
