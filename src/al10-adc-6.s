* AL10-ADC SAMPLE PROGRAM 6 from Assembly Lines, pg. 72

	ORG $300

N1	EQU $06
N2	EQU $08
RSLT	EQU $0A

START	SEC
	LDA N1
	SBC N2
	STA RSLT
	LDA N1+1
	SBC N2+1
	STA RSLT+1

END	RTS
