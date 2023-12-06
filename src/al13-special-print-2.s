* AL13-SPECIAL PRINT 2 from Assembly Lines, pg. 107

	ORG $300

PTR	EQU $06
COUT	EQU $FDED

ENTRY	JSR PRINT
E0	HEX 84		; CTRL-D to invoke DOS
	ASC "CATALOG"
	HEX 8D00
DONE	RTS

PRINT	PLA
	STA PTR
	PLA
	STA PTR+1
	LDY #$01	; PTR HOLDS E0-1 HERE

P0	LDA (PTR),Y
	BEQ FNSH
	JSR COUT
	INY
	BNE P0		; (MOST ALWAYS)

FNSH	CLC
	TYA
	ADC PTR
	STA PTR
	LDA PTR+1
	ADC #$00
	PHA
	LDA PTR
	PHA

EXIT	RTS
* WILL RTS TO DONE INSTEAD OF
* E0!
