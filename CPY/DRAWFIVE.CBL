           INITIALIZE WK-PLAYS.
           INITIALIZE WK-STRAIGHT.
           INITIALIZE WK-PLAYSCPU.
           INITIALIZE WK-STRAIGHTCPU.
           INITIALIZE WK-WINNING.
           INITIALIZE WK-OUT.

           SET DRAWFIVE TO TRUE.

           DISPLAY " " ERASE.
           DISPLAY BOX AT 1105 SIZE 6 LINES 5.
           DISPLAY BOX AT 1206 SIZE 6 LINES 5.
           DISPLAY "     " AT 1206.
           DISPLAY "    " AT 1306.
           DISPLAY "    " AT 1406.
           DISPLAY " " AT 1506.

           MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.


      *Sorting and displaying player and CPU cards

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD1.
           DISPLAY BOX AT 1822 SIZE 6 LINES 5.
           DISPLAY WK-CARD1 AT 1923.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD1CPU.
           DISPLAY BOX AT 0422 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD2.
           DISPLAY BOX AT 1830 SIZE 6 LINES 5.
           DISPLAY WK-CARD2 AT 1931.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD2CPU.
           DISPLAY BOX AT 0430 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD3.
           DISPLAY BOX AT 1838 SIZE 6 LINES 5.
           DISPLAY WK-CARD3 AT 1939.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD3CPU.
           DISPLAY BOX AT 0438 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD4.
           DISPLAY BOX AT 1846 SIZE 6 LINES 5.
           DISPLAY WK-CARD4 AT 1947.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD4CPU.
           DISPLAY BOX AT 0446 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD5.
           DISPLAY BOX AT 1854 SIZE 6 LINES 5.
           DISPLAY WK-CARD5 AT 1955.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD5CPU.
           DISPLAY BOX AT 0454 SIZE 6 LINES 5.

           GO TO BET3.


      *First bet placing

       BET3.

           INITIALIZE WK-BET.
           DISPLAY "        " AT 1865.

           DISPLAY "Jackpot:" AT 0664 UNDERLINE.
           DISPLAY "First bet:" AT 1664 UNDERLINE.
           ACCEPT WK-BET AT 1865 KEY IN WK-KEY.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION2.
           IF WK-BET < WK-MINIMUM
              DISPLAY MESSAGE "Bet lower than bid ($" WK-MINIMUM ")"
              GO TO BET3
           END-IF.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET3
           END-IF.
           IF WK-PLAYERMONEY >= WK-BET
              SUBTRACT WK-BET FROM WK-PLAYERMONEY
              MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW
           END-IF.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY WK-JACKPOTSHOW AT 0764.

      *Discarding

           COPY "CPY/DISCARD.CBL".

      *Second bet placing

       BET4.

           INITIALIZE WK-BET.

           DISPLAY "Second bet:" AT 1664 UNDERLINE.
           DISPLAY "        " AT 1865.
           ACCEPT WK-BET AT 1865 KEY IN WK-KEY.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION2.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET4
           END-IF.
           IF WK-PLAYERMONEY >= WK-BET
              SUBTRACT WK-BET FROM WK-PLAYERMONEY
              MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW
           END-IF.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY "          " AT 0762.
           DISPLAY WK-JACKPOTSHOW AT 0762.

       CALCULATION2.

           DISPLAY WK-CARD1CPU AT 0523.
           DISPLAY WK-CARD2CPU AT 0531.
           DISPLAY WK-CARD3CPU AT 0539.
           DISPLAY WK-CARD4CPU AT 0547.
           DISPLAY WK-CARD5CPU AT 0555.

           GO TO RESULT.