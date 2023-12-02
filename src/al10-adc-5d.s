* AL10-ADC SAMPLE PROGRAM 5D from Assembly Lines, pg. 71

	ORG $300

N1	EQU $06

* Note that the original program started with
* CLC, but that doesn't seem to actually be
* needed, so I'm leaving it out.

START	INC N1
	BNE END
	INC N1+1
END	RTS
