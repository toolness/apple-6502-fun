0 REM AL10-ADC 5A ADDITION ROUTINE from Assembly Lines, pg. 70
1 REM Modified to work with program 5C
10 HOME
15 PRINT "PRESS CTRL-C THEN ENTER TO QUIT."
16 PRINT "NOTE THAT N2 MUST BE LESS THAN 256."
20 INPUT "N1,N2?"; N1,N2
30 N1 = ABS(N1): N2 = ABS(N2)
40 POKE 6, N1 - INT (N1 / 256) * 256: POKE 7, INT (N1 / 256)
50 POKE 8, N2
60 CALL 768
70 PRINT: PRINT "RESULT IS "; PEEK (10) + 256 * PEEK (11)
80 PRINT: GOTO 20
