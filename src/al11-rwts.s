* AL11-GENERAL PURPOSE RWTS DOS UTILITY from Assembly Lines,
* pg. 83

* I modified this program to read in the disk volume name
* and print it out, based on what's described in page 86.

	ORG $300

CTRK	EQU $06
CSCT	EQU $07
UDRIV	EQU $08
USLOT	EQU $09
BP	EQU $0A		; BUFFER PTR.
UERR	EQU $0C
UCMD	EQU $E3		; USER SETS THIS TO THEIR CMD

RWTS	EQU $3D9
PRBYTE	EQU $FDDA
COUT	EQU $FDED

* BELOW ARE LOCS IN IOB
SLOT	EQU $B7E9
DRIV	EQU $B7EA
VOL	EQU $B7EB
TRACK	EQU $B7EC
SECTOR	EQU $B7ED
BUFR	EQU $B7F0
CMD	EQU $B7F4
ERR	EQU $B7F5
OSLOT	EQU $B7F7
ODRIV	EQU $B7F8

* These are command codes for RWTS.
READ	EQU $01
WRITE	EQU $02

* Configure our program to read from Track 2, Sector 2, which
* contains the volume name of the disk.
START	LDA #$02	; Track 2
	STA CTRK
	LDA #$02	; Sector 2
	STA CSCT
	LDA #$01	; Disk 1
	STA UDRIV
	LDA #$60	; Slot 6 (multiplied by 16)
	STA USLOT
	LDA #$00	; Low byte of buffer
	STA BP
	LDA #$10	; High byte of buffer
	STA BP+1
	LDA #READ
	STA UCMD

* Clear the buffer that will be populated by the disk read,
* to ensure that we're not looking at the output of previous
* runs of this program.
	LDY #$FF
	LDA #0
NEXTDL	STA $1000,Y
	DEY
	BNE NEXTDL

* Load the sector from disk into the buffer.
LOAD	JSR DISK
	BCC PRINT	; Carry flag will be set if an error occurred.

SHOWERR	LDA UERR
	JSR PRBYTE
	RTS

* Print the volume name.
PRINT	LDY #11
NEXTCH	LDA $10AF,Y	; Location of disk volume name in reverse
	JSR COUT
	DEY
	BNE NEXTCH

EXIT	RTS

* Below are the original instructions from Assembly Lines, which
* we're basically using as a subroutine.

* ENTRY CONDITIONS: SET
* TRACK, SECTOR, SLOT, DRIVE,
* BUFFER, AND COMMAND.

DISK	LDA #$00	; This means any volume number is acceptable.
	STA VOL

	LDA USLOT
	STA SLOT

	LDA UDRIV
	STA DRIV

	LDA CTRK
	STA TRACK

	LDA CSCT
	STA SECTOR

	LDA UCMD
	STA CMD

	LDA BP
	STA BUFR
	LDA BP+1
	STA BUFR+1

	LDA #$B7	; Low-order byte of IOB table
	LDY #$E8	; High-order byte of IOB table
	JSR RWTS
	BCC RETURN

ERRHAND	LDA ERR
	STA UERR	; Set error info

RETURN	RTS
