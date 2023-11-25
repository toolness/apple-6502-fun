* AL05-PADDLE PROGRAM 1 from Assembly Lines, pg. 32

* Note that running this on Virtual ][ requries paddle config.
* Easiest way to do this is to click "Setup" in toolbar, under
* "Built-in connections -> Game connector" choose
* "Use arrows as a joystick substitute".

	ORG $300
TEMP	EQU $06		; Address in zero-page for temp var
PREAD	EQU $FB1E
HOME	EQU $FC58
COUT	EQU $FDED

START	JSR HOME
	LDX #$00
LOOP	JSR PREAD
	STY TEMP
	LDA TEMP
	JSR COUT
	JMP LOOP

* INFINITE LOOP (Press "Reset" in Virtaul ][ to abort)
