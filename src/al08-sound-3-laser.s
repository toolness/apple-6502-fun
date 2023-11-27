* This is based on al08-sound-3.s but plays a laser-beam
* like sound comprised of short notes of increasing
* pitch.

	ORG $300

PITCH	EQU $06
DUR	EQU $07		; Duration of note
SPKR	EQU $C030
DURSIZE	EQU $FF		; Loops per DUR
RND	EQU $EFAE
FAC	EQU $A1		; Near end of FAC, seems random.
PRBYTE	EQU $FDDA
MAXPITC	EQU $9F		; Maximum pitch to end at

MYDUR	EQU 5		; Lower values = faster notes!

START	LDA #0
	STA PITCH

NXTNOTE	LDX PITCH
	INX
	STX PITCH
	TXA
	CMP #MAXPITC
	BCS END
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

END	RTS
