	ORG $300

START	LDA #$D     ; Just a random value to print out.
	JSR $FDDA   ; PRBYTE, print hex of 'A' register.

END	RTS
