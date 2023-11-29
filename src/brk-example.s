* To use this with Virtual ]['s debugger, you
* need to go to "Machine -> Show Inspector",
* then click the gear, go to "Breakpoints..."
* and click "Break on 'BRK' instruction".
*
* Then you can run this program.
* 
* Once it breaks, you can click "Resume",
* and you'll be taken to the Monitor. At
* that point press CTRL-F12 (or click the
* Reset button). If you don't do that last
* step, and press CTRL-B or CTRL-C instead,
* it will look like you're in BASIC,
* but in fact running DOS commands like
* BLOAD will result in a syntax error.
* (Pressing Reset will always get you out
* of that "barebones" BASIC mode.)

	ORG $300

; Set up some stuff to inspect in the debugger.
SETUP	LDA #1
	LDX #2
	LDY #3
	PHA	; Push A onto the stack
	CLC	; Clear the carry flag

; The following DATA will show up as BRK $00
; in disassembly. Note that BRK is actually a
; two-byte instruction, it seems. More details here:
; https://retrocomputing.stackexchange.com/q/12291
DATA	HEX 0000

	RTS
