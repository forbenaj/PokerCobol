           INITIALIZE WK-PLAYS.
           INITIALIZE WK-STRAIGHT.
           INITIALIZE WK-PLAYSCPU.
           INITIALIZE WK-STRAIGHTCPU.
           INITIALIZE WK-WINNING.
           INITIALIZE WK-OUT.

           SET HOLDEM TO TRUE.

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
           DISPLAY BOX AT 2034 SIZE 6 LINES 5.
           DISPLAY WK-CARD1 AT 2135.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD1CPU.
           DISPLAY BOX AT 0334 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD2.
           DISPLAY BOX AT 2042 SIZE 6 LINES 5.
           DISPLAY WK-CARD2 AT 2143.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD2CPU.
           DISPLAY BOX AT 0342 SIZE 6 LINES 5.

      *Sorting and placing table cards

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE1.
           DISPLAY BOX AT 1122 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE2.
           DISPLAY BOX AT 1130 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE3.
           DISPLAY BOX AT 1138 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE4.
           DISPLAY BOX AT 1146 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE5.
           DISPLAY BOX AT 1154 SIZE 6 LINES 5.


      *First bet placing

       BET.

           INITIALIZE WK-BET.
           DISPLAY "        " AT 1865.

           DISPLAY "Jackpot:" AT 0662 UNDERLINE.
           DISPLAY "First bet:" AT 1854 UNDERLINE.
           ACCEPT WK-BET AT 1865 KEY IN WK-KEY.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION.
           IF WK-BET < WK-MINIMUM
              DISPLAY MESSAGE "Bet lower than bid ($" WK-MINIMUM ")"
              GO TO BET
           END-IF.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET
           END-IF.
           IF WK-PLAYERMONEY >= WK-BET
              SUBTRACT WK-BET FROM WK-PLAYERMONEY
              MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW
           END-IF.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY WK-JACKPOTSHOW AT 0762.

      *First table cards displaying

           DISPLAY WK-CARDTABLE1 AT 1223.
           DISPLAY WK-CARDTABLE2 AT 1231.

      *Second bet placing

       BET2.

           INITIALIZE WK-BET.
           DISPLAY "        " AT 2066.

           DISPLAY "Second bet:" AT 2054 UNDERLINE.
           ACCEPT WK-BET AT 2066 KEY IN WK-KEY.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET2
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

       CALCULATION.

           DISPLAY WK-CARDTABLE1 AT 1223.
           DISPLAY WK-CARDTABLE2 AT 1231.
           DISPLAY WK-CARDTABLE3 AT 1239.
           DISPLAY WK-CARDTABLE4 AT 1247.
           DISPLAY WK-CARDTABLE5 AT 1255.

           DISPLAY WK-CARD1CPU AT 0435.
           DISPLAY WK-CARD2CPU AT 0443.

           GO TO RESULT.