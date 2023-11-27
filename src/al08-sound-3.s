* AL08-SOUND ROUTINE 3 from Assembly Lines, pg. 56

* This is different from the book because I derived
* it myself from ROUTINE 2. I also felt like a max
* duration of 255 still resulted in too short a
* note, so I set the "size" of each duration "unit"
* to a new DURSIZE constant so the total duration
* would effectively be DUR * DURSIZE.

	ORG $300

PITCH	EQU $06
DUR	EQU $07		; Duration of note
SPKR	EQU $C030
DURSIZE	EQU $FF		; Loops per DUR

MYPITCH	EQU 80
MYDUR	EQU 5

SETUP	LDA #MYPITCH
	STA PITCH
	LDA #MYDUR
	STA DUR

NOTE	LDX #DURSIZE
INNER	LDY PITCH
	LDA SPKR
LOOP	DEY
	BNE LOOP
	DEX
	BNE INNER
	LDX DUR
	DEX
	STX DUR
	BNE NOTE

END	RTS

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
