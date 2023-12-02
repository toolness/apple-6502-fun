* AL10-ADC SAMPLE PROGRAM 5B from Assembly Lines, pg. 70

	ORG $300

N1	EQU $06
N2	EQU $08
RSLT	EQU $0A

START	CLC
	LDA N1
	ADC N2
	STA RSLT

* Commenting out the following line b/c we need to set RSLT+1,
* or else it'll have a stale value from a previous run!
*	BCC END

	LDA N1+1
	ADC #$00
	STA RSLT+1

END	RTS
