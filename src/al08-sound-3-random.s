* This is based on al08-sound-3.s but infinitely plays
* random notes of equal length.

	ORG $300

PITCH	EQU $06
DUR	EQU $07		; Duration of note
SPKR	EQU $C030
DURSIZE	EQU $FF		; Loops per DUR
RND	EQU $EFAE
FAC	EQU $A1		; Near end of FAC, seems random.
PRBYTE	EQU $FDDA

MYDUR	EQU 10		; Lower values = faster notes!

NXTNOTE	JSR RND
	LDA FAC
	STA PITCH
	JSR PRBYTE
	LDA #MYDUR
	STA DUR

NOTE	LDX #DURSIZE
INNER	LDY PITCH
	LDA SPKR
LOOP	DEX
	BEQ NXTDUR
	DEY
	BNE LOOP
	JMP INNER
NXTDUR	LDX DUR
	DEX
	STX DUR
	BNE NOTE
	JMP NXTNOTE

* INFINITE LOOP (Press "Reset" in Virtual ][ to abort)
