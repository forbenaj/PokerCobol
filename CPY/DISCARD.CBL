           DISPLAY "Discard" AT 2008.
           DISPLAY "1       2       3       4       5" AT 2324.

           INITIALIZE TRIGGERS.
           INITIALIZE WK-KEY.
           INITIALIZE WK-CARDDIS.
           PERFORM UNTIL WK-KEY = 13
              ACCEPT WK-DISCARD AT 0101 KEY IN WK-KEY
              EVALUATE WK-DISCARD
                 WHEN "1"
                    IF TRIGGER1 = 1 SET TRIGGER1 TO 0
                    ELSE SET TRIGGER1 TO 1 END-IF
                    EVALUATE TRIGGER1
                       WHEN 1 
                          DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                          MOVE 1 TO WK-FIRSTDIS
                       WHEN 0
                          DISPLAY BOX AT 1822 SIZE 6 LINES 5
                          MOVE 0 TO WK-FIRSTDIS
                    END-EVALUATE
                 WHEN "2"
                    IF TRIGGER2 = 1 SET TRIGGER2 TO 0
                    ELSE SET TRIGGER2 TO 1 END-IF
                    EVALUATE TRIGGER2
                       WHEN 1 
                          DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                          MOVE 1 TO WK-SECONDDIS
                       WHEN 0
                          DISPLAY BOX AT 1830 SIZE 6 LINES 5
                          MOVE 0 TO WK-SECONDDIS
                    END-EVALUATE
                 WHEN "3"
                    IF TRIGGER3 = 1 SET TRIGGER3 TO 0
                    ELSE SET TRIGGER3 TO 1 END-IF
                    EVALUATE TRIGGER3
                       WHEN 1 
                          DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                          MOVE 1 TO WK-THIRDDIS
                       WHEN 0
                          DISPLAY BOX AT 1838 SIZE 6 LINES 5
                          MOVE 0 TO WK-THIRDDIS
                    END-EVALUATE
                 WHEN "4"
                    IF TRIGGER4 = 1 SET TRIGGER4 TO 0
                    ELSE SET TRIGGER4 TO 1 END-IF
                    EVALUATE TRIGGER4
                       WHEN 1 
                          DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                          MOVE 1 TO WK-FOURTHDIS
                       WHEN 0
                          DISPLAY BOX AT 1846 SIZE 6 LINES 5
                          MOVE 0 TO WK-FOURTHDIS
                    END-EVALUATE
                 WHEN "5"
                    IF TRIGGER5 = 1 SET TRIGGER5 TO 0
                    ELSE SET TRIGGER5 TO 1 END-IF
                    EVALUATE TRIGGER5
                       WHEN 1 
                          DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                          MOVE 1 TO WK-FIFTHDIS
                       WHEN 0
                          DISPLAY BOX AT 1854 SIZE 6 LINES 5
                          MOVE 0 TO WK-FIFTHDIS
                    END-EVALUATE
              END-EVALUATE
           END-PERFORM.

       DISCARD.

           IF WK-FIRSTDIS = 1
              PERFORM SORT1
              MOVE WK-CARD TO WK-CARD1
              DISPLAY BOX AT 1822 SIZE 6 LINES 5
              DISPLAY WK-CARD1 AT 1923
           END-IF.
           IF WK-SECONDDIS = 1
              PERFORM SORT1
              MOVE WK-CARD TO WK-CARD2
              DISPLAY BOX AT 1830 SIZE 6 LINES 5
              DISPLAY WK-CARD2 AT 1931
           END-IF.
           IF WK-THIRDDIS = 1
              PERFORM SORT1
              MOVE WK-CARD TO WK-CARD3
              DISPLAY BOX AT 1838 SIZE 6 LINES 5
              DISPLAY WK-CARD3 AT 1939
           END-IF.
           IF WK-FOURTHDIS = 1
              PERFORM SORT1
              MOVE WK-CARD TO WK-CARD4
              DISPLAY BOX AT 1846 SIZE 6 LINES 5
              DISPLAY WK-CARD4 AT 1947
           END-IF.
           IF WK-FIFTHDIS = 1
              PERFORM SORT1
              MOVE WK-CARD TO WK-CARD5
              DISPLAY BOX AT 1854 SIZE 6 LINES 5
              DISPLAY WK-CARD5 AT 1955
           END-IF.

           DISPLAY "       " AT 2008.