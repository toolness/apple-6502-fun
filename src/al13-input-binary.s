* AL13-INPUT ROUTINE FOR BINARY from Assembly Lines, pg. 108

* I modified the original source by hard-coding
* PTR to be at PTRVAL. To actually see the "output"
* of the program you'll need to activate Virtual ]['s
* inspector and go to the memory location of PTRVAL
* to see the string stored there.

	ORG $300

GETLN	EQU $FD6F
BUFF	EQU $200	; Where GETLN puts user input
PTR	EQU $06		; Points to where we put string
PTRVAL	EQU $8000	; Where we'll set PTR to

SETUP	LDA #<PTRVAL
	STA PTR
	LDA #>PTRVAL
	STA PTR+1

ENTRY	LDX #$00
	JSR GETLN

CLEAR	TXA		; X=LEN OF STRING (set by GETLN)
	TAY
	LDA #$00
	STA (PTR),Y	; PUT END-OF-STRING MARKER
	DEY		; Y-1 FOR PROPER INDEXING
C2	LDA BUFF,Y
	AND #$7F	; CLEAR HIGH BIT
	STA (PTR),Y	; PUT IN NEW LOC
	DEY
	CPY #$FF	; Did Y just decrement past 0?
	BNE C2

DONE	RTS
