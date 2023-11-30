* AL10-ADC SAMPLE PROGRAM 4 from Assembly Lines, pg. 68

* I added some extra stuff to init the variables and
* print the final result. I also made PTR point at
* the data table TBL, instead of using $300.

	ORG $300

PRBYTE	EQU $FDDA
N1	EQU $06
INDX	EQU $08
RSLT	EQU $0A
PTR	EQU $1E

* Init numbers to add.
SETUP	LDA #$01
	STA N1
	LDA #$01
	STA INDX

START	LDA #<TBL	; Low byte of TBL address
	STA PTR
	LDA #>TBL	; High byte of TBL address
	STA PTR+1
	LDA N1
	LDY INDX
	CLC
	ADC (PTR),Y	
	STA RSLT
	JSR PRBYTE	; Print out the final result
END	RTS

TBL	HEX 0102FF
