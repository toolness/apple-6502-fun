* AL10-ADC SAMPLE PROGRAM 3 from Assembly Lines, pg. 68

* I added some extra stuff to init the variables and
* print the final result. Also, in the original program
* TBL points at $300 but here I have it point at a
* data table.

	ORG $300

PRBYTE	EQU $FDDA
N1	EQU $06
INDX	EQU $08
RSLT	EQU $0A

* Init numbers to add.
SETUP	LDA #$01
	STA N1
	LDA #$01
	STA INDX

START	LDA N1
	LDX INDX
	CLC
	ADC TBL,X
	STA RSLT
	JSR PRBYTE	; Print out the final result
END	RTS

TBL	HEX 0102FF
