* AL13-DATA-TYPE PRINT 1 from Assembly Lines, pg. 105

	ORG $300

COUT	EQU $FDED

ENTRY	LDX #$00
LOOP	LDA DATA,X
	BEQ DONE
	JSR COUT
	INX
	BNE LOOP	; BNE enforces 255 char max length

DONE	RTS

DATA	HEX 84		; CTRL-D, to invoke DOS
	ASC "CATALOG"
	HEX 8D		; Carriage return, I think
	HEX 00		; Null terminator for string
