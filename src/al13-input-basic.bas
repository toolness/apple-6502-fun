10 IN$ = "X"
20 PRINT "ENTER THE STRING OR TYPE 'END': ";
30 CALL 768

34 REM We are just copying the string from $0200 to BASIC's memory here.
35 IN$ = MID$(IN$, 1)

40 IF IN$ = "END" THEN END
50 PRINT IN$: PRINT: GOTO 20
