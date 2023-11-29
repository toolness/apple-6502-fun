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
; in Virtual ]['s disassembly, though it will
; show up as two consecutive BRKs in Apple's
; disassembler. It's confusing; BRK may actually be a
; two-byte instruction, it seems. More details here:
; https://retrocomputing.stackexchange.com/q/12291
; Also, see pg. 356 of Assembly Lines.
;
; My hope was that using BRK would be similar to
; using `debugger` in JavaScript, but it seems
; a lot more complex than that (specifically, I
; haven't figured out how to make it resume from
; where it paused execution). It seems like just
; using Virtual ]['s breakpoint functionality
; will be easier for now.
DATA	HEX 0000

	RTS
