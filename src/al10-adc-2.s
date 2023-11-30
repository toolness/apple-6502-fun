* AL10-ADC SAMPLE PROGRAM 2 from Assembly Lines, pg. 67

* I added some extra stuff to init the variables and
* print the final result.

	ORG $300

PRBYTE	EQU $FDDA
N1	EQU $06
RSLT	EQU $0A

* Init numbers to add.
SETUP	LDA #$01
	STA N1

START	LDA N1
	CLC
	ADC #$80
	STA RSLT
	JSR PRBYTE	; Print out the final result
END	RTS
