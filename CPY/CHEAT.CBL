           INITIALIZE WK-PLAYS.
           INITIALIZE WK-STRAIGHT.
           INITIALIZE WK-PLAYSCPU.
           INITIALIZE WK-STRAIGHTCPU.
           INITIALIZE WK-WINNING.
           INITIALIZE WK-OUT.

           SET CHEAT TO TRUE.

           DISPLAY " " ERASE.
           DISPLAY BOX AT 1810 SIZE 6 LINES 5.
           DISPLAY BOX AT 1911 SIZE 6 LINES 5.
           DISPLAY "     " AT 1911.
           DISPLAY "    " AT 2011.
           DISPLAY "    " AT 2111.
           DISPLAY " " AT 2211.

           MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.


      *Sorting and displaying player and CPU cards

           ACCEPT WK-CARD1 AT 2135.
           DISPLAY BOX AT 2034 SIZE 6 LINES 5.

           ACCEPT WK-CARD1CPU AT 0435
           DISPLAY BOX AT 0334 SIZE 6 LINES 5.

           ACCEPT WK-CARD2 AT 2143.
           DISPLAY BOX AT 2042 SIZE 6 LINES 5.

           ACCEPT WK-CARD2CPU AT 0443.
           DISPLAY BOX AT 0342 SIZE 6 LINES 5.

      *Sorting and placing table cards

           ACCEPT WK-CARDTABLE1 AT 1223.
           DISPLAY BOX AT 1122 SIZE 6 LINES 5.

           ACCEPT WK-CARDTABLE2 AT 1231.
           DISPLAY BOX AT 1130 SIZE 6 LINES 5.

           ACCEPT WK-CARDTABLE3 AT 1239.
           DISPLAY BOX AT 1138 SIZE 6 LINES 5.

           ACCEPT WK-CARDTABLE4 AT 1247.
           DISPLAY BOX AT 1146 SIZE 6 LINES 5.

           ACCEPT WK-CARDTABLE5 AT 1255.
           DISPLAY BOX AT 1154 SIZE 6 LINES 5.


      *First bet placing

       BET5.

           INITIALIZE WK-BET.
           DISPLAY "        " AT 1865.

           DISPLAY "Jackpot:" AT 0662 UNDERLINE.
           DISPLAY "First bet:" AT 1854 UNDERLINE.
           ACCEPT WK-BET AT 1865 KEY IN WK-KEY.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION3.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET5
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

       BET6.

           INITIALIZE WK-BET.
           DISPLAY "        " AT 2066.

           DISPLAY "Second bet:" AT 2054 UNDERLINE.
           ACCEPT WK-BET AT 2066.
           IF WK-KEY = 27 MOVE 1 TO WK-OUT GO TO CALCULATION3.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET6
           END-IF.
           IF WK-PLAYERMONEY > WK-BET
              SUBTRACT WK-BET FROM WK-PLAYERMONEY
              MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW
           END-IF.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY "          " AT 0762.
           DISPLAY WK-JACKPOTSHOW AT 0762.

       CALCULATION3.

           DISPLAY WK-CARDTABLE3 AT 1239.
           DISPLAY WK-CARDTABLE4 AT 1247.
           DISPLAY WK-CARDTABLE5 AT 1255.

           DISPLAY WK-CARD1CPU AT 0435.
           DISPLAY WK-CARD2CPU AT 0443.

           GO TO RESULT.