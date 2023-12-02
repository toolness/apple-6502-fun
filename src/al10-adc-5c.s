* AL10-ADC SAMPLE PROGRAM 5C from Assembly Lines, pg. 71

	ORG $300

N1	EQU $06
N2	EQU $08
RSLT	EQU $0A

START	CLC
	LDA N1
	ADC N2
	STA RSLT

* There was originally a BCC END here but I moved it
* down, as we need to write to RSLT+1 or else it
* will effectively be uninitialized.

	LDA N1+1
	STA RSLT+1
	BCC END
	INC RSLT+1
END	RTS
