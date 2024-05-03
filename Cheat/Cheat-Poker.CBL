       IDENTIFICATION DIVISION.
       PROGRAM-ID. Operando.
       SECURITY.   Ejecución de operaciones matemáticas.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. PC.
       OBJECT-COMPUTER. PC.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.


       DATA DIVISION.
       FILE SECTION.


       WORKING-STORAGE SECTION.

       01 WK-PARA PIC X(01) VALUE SPACE.

      *Main deck

       01 WK-A  PIC X(01) VALUE "A".
       01 WK-2  PIC X(01) VALUE "2".
       01 WK-3  PIC X(01) VALUE "3".
       01 WK-4  PIC X(01) VALUE "4".
       01 WK-5  PIC X(01) VALUE "5".
       01 WK-6  PIC X(01) VALUE "6".
       01 WK-7  PIC X(01) VALUE "7".
       01 WK-8  PIC X(01) VALUE "8".
       01 WK-9  PIC X(01) VALUE "9".
       01 WK-10 PIC X(02) VALUE "10".
       01 WK-J  PIC X(01) VALUE "J".
       01 WK-Q  PIC X(01) VALUE "Q".
       01 WK-K  PIC X(01) VALUE "K".

      *Main card

       01 WK-CARD PIC X(02).

      *Player cards

       01 WK-CARD1 PIC X(02).
       01 WK-CARD2 PIC X(02).

      *CPU cards

       01 WK-CARD1CPU PIC X(02).
       01 WK-CARD2CPU PIC X(02).

      *Table cards

       01 WK-CARDTABLE1 PIC X(02).
       01 WK-CARDTABLE2 PIC X(02).
       01 WK-CARDTABLE3 PIC X(02).
       01 WK-CARDTABLE4 PIC X(02).
       01 WK-CARDTABLE5 PIC X(02).

       01 WK-TIME PIC 99.

       01 WK-NONE PIC X.

       01 WK-PLAYERMONEY PIC 9(08) VALUE 1000.
       01 WK-PLAYERMONEYSHOW PIC $$$$$$$9.
       01 WK-BET PIC 9(08).
       01 WK-JACKPOT PIC 9(08).
       01 WK-JACKPOTSHOW PIC $$$$$$$9.

      *Player hand calculation

       01 WK-APLAYS PIC 99.
       01 WK-2PLAYS PIC 99.
       01 WK-3PLAYS PIC 99.
       01 WK-4PLAYS PIC 99.
       01 WK-5PLAYS PIC 99.
       01 WK-6PLAYS PIC 99.
       01 WK-7PLAYS PIC 99.
       01 WK-8PLAYS PIC 99.
       01 WK-9PLAYS PIC 99.
       01 WK-10PLAYS PIC 99.
       01 WK-JPLAYS PIC 99.
       01 WK-QPLAYS PIC 99.
       01 WK-KPLAYS PIC 99.

       01 WK-ATO5 PIC 9.
       01 WK-2TO6 PIC 9.
       01 WK-3TO7 PIC 9.
       01 WK-4TO8 PIC 9.
       01 WK-5TO9 PIC 9.
       01 WK-6TO10 PIC 9.
       01 WK-7TOJ PIC 9.
       01 WK-8TOQ PIC 9.
       01 WK-9TOK PIC 9.
       01 WK-10TOA PIC 9.
       01 WK-JTO2 PIC 9.
       01 WK-QTO3 PIC 9.
       01 WK-KTO4 PIC 9.

      *CPU hand calculation

       01 WK-APLAYSCPU PIC 99.
       01 WK-2PLAYSCPU PIC 99.
       01 WK-3PLAYSCPU PIC 99.
       01 WK-4PLAYSCPU PIC 99.
       01 WK-5PLAYSCPU PIC 99.
       01 WK-6PLAYSCPU PIC 99.
       01 WK-7PLAYSCPU PIC 99.
       01 WK-8PLAYSCPU PIC 99.
       01 WK-9PLAYSCPU PIC 99.
       01 WK-10PLAYSCPU PIC 99.
       01 WK-JPLAYSCPU PIC 99.
       01 WK-QPLAYSCPU PIC 99.
       01 WK-KPLAYSCPU PIC 99.

       01 WK-ATO5CPU PIC 9.
       01 WK-2TO6CPU PIC 9.
       01 WK-3TO7CPU PIC 9.
       01 WK-4TO8CPU PIC 9.
       01 WK-5TO9CPU PIC 9.
       01 WK-6TO10CPU PIC 9.
       01 WK-7TOJCPU PIC 9.
       01 WK-8TOQCPU PIC 9.
       01 WK-9TOKCPU PIC 9.
       01 WK-10TOACPU PIC 9.
       01 WK-JTO2CPU PIC 9.
       01 WK-QTO3CPU PIC 9.
       01 WK-KTO4CPU PIC 9.

       01 WK-PLAYERWINS PIC 999.
       01 WK-CPUWINS PIC 999.

       01 WK-PLAYERDRAW PIC 99.
       01 WK-CPUDRAW PIC 99.


       LINKAGE SECTION.


       SCREEN SECTION.


       PROCEDURE DIVISION.


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

       BET.

           MOVE 0 TO WK-BET.
           DISPLAY "        " AT 1865.

           DISPLAY "Jackpot:" AT 0662 UNDERLINE.
           DISPLAY "First bet:" AT 1854 UNDERLINE.
           ACCEPT WK-BET AT 1865.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET
           END-IF.
           IF WK-PLAYERMONEY > WK-BET
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

           MOVE 0 TO WK-BET.
           DISPLAY "        " AT 2066.

           DISPLAY "Second bet:" AT 2054 UNDERLINE.
           ACCEPT WK-BET AT 2066.
           IF WK-BET > WK-PLAYERMONEY
              DISPLAY MESSAGE "You can't afford that!"
              GO TO BET2
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

           DISPLAY WK-CARDTABLE3 AT 1239.
           DISPLAY WK-CARDTABLE4 AT 1247.
           DISPLAY WK-CARDTABLE5 AT 1255.

           DISPLAY WK-CARD1CPU AT 0435.
           DISPLAY WK-CARD2CPU AT 0443.

      *Player and table hand calculation


           IF WK-CARD1 = "2"
              ADD 1 TO WK-2PLAYS
              MOVE 1 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "2"
              ADD 1 TO WK-2PLAYS
              MOVE 1 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.


           IF WK-CARD1 = "3"
              ADD 1 TO WK-3PLAYS
              MOVE 2 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "3"
              ADD 1 TO WK-3PLAYS
              MOVE 2 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.


           IF WK-CARD1 = "4"
              ADD 1 TO WK-4PLAYS
              MOVE 3 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "4"
              ADD 1 TO WK-4PLAYS
              MOVE 3 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.


           IF WK-CARD1 = "5"
              ADD 1 TO WK-5PLAYS
              MOVE 4 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "5"
              ADD 1 TO WK-5PLAYS
              MOVE 4 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.


           IF WK-CARD1 = "6"
              ADD 1 TO WK-6PLAYS
              MOVE 5 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "6"
              ADD 1 TO WK-6PLAYS
              MOVE 5 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.


           IF WK-CARD1 = "7"
              ADD 1 TO WK-7PLAYS
              MOVE 6 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "7"
              ADD 1 TO WK-7PLAYS
              MOVE 6 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.


           IF WK-CARD1 = "8"
              ADD 1 TO WK-8PLAYS
              MOVE 7 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "8"
              ADD 1 TO WK-8PLAYS
              MOVE 7 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.


           IF WK-CARD1 = "9"
              ADD 1 TO WK-9PLAYS
              MOVE 8 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "9"
              ADD 1 TO WK-9PLAYS
              MOVE 8 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.


           IF WK-CARD1 = "10"
              ADD 1 TO WK-10PLAYS
              MOVE 9 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "10"
              ADD 1 TO WK-10PLAYS
              MOVE 9 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARDTABLE2 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARDTABLE3 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARDTABLE4 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARDTABLE5 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.


           IF WK-CARD1 = "J"
              ADD 1 TO WK-JPLAYS
              MOVE 10 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "J"
              ADD 1 TO WK-JPLAYS
              MOVE 10 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARDTABLE2 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARDTABLE3 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARDTABLE4 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARDTABLE5 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.


           IF WK-CARD1 = "Q"
              ADD 1 TO WK-QPLAYS
              MOVE 11 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "Q"
              ADD 1 TO WK-QPLAYS
              MOVE 11 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARDTABLE2 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARDTABLE3 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARDTABLE4 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARDTABLE5 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.


           IF WK-CARD1 = "K"
              ADD 1 TO WK-KPLAYS
              MOVE 12 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "K"
              ADD 1 TO WK-KPLAYS
              MOVE 12 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARDTABLE2 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARDTABLE3 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARDTABLE4 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARDTABLE5 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.


           IF WK-CARD1 = "A"
              ADD 1 TO WK-APLAYS
              MOVE 13 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARD2 = "A"
              ADD 1 TO WK-APLAYS
              MOVE 13 TO WK-PLAYERDRAW
           END-IF.
           IF WK-CARDTABLE1 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARDTABLE2 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARDTABLE3 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARDTABLE4 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARDTABLE5 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.



           IF WK-CARD1 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARD2 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARDTABLE1 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARDTABLE2 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARDTABLE3 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARDTABLE4 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARDTABLE5 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.


       STRAIGHT2.


           IF WK-CARD1 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARD2 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARDTABLE1 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARDTABLE2 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARDTABLE3 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARDTABLE4 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARDTABLE5 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.


       STRAIGHT3.


           IF WK-CARD1 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARD2 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARDTABLE1 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARDTABLE2 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARDTABLE3 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARDTABLE4 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARDTABLE5 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.

       STRAIGHT4.


           IF WK-CARD1 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARD2 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARDTABLE1 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARDTABLE2 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARDTABLE3 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARDTABLE4 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARDTABLE5 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.


       STRAIGHT5.


           IF WK-CARD1 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARD2 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARDTABLE1 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARDTABLE2 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARDTABLE3 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARDTABLE4 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARDTABLE5 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.


       STRAIGHT6.


           IF WK-CARD1 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARD2 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARDTABLE1 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARDTABLE2 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARDTABLE3 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARDTABLE4 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARDTABLE5 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.

       STRAIGHT7.


           IF WK-CARD1 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARD2 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARDTABLE1 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARDTABLE2 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARDTABLE3 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARDTABLE4 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARDTABLE5 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.

       STRAIGHT8.


           IF WK-CARD1 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARD2 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARDTABLE1 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARDTABLE2 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARDTABLE3 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARDTABLE4 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARDTABLE5 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.

       STRAIGHT9.


           IF WK-CARD1 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARD2 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARDTABLE1 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARDTABLE2 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARDTABLE3 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARDTABLE4 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARDTABLE5 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.


       STRAIGHT10.


           IF WK-CARD1 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARD2 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARDTABLE1 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARDTABLE2 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARDTABLE3 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARDTABLE4 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARDTABLE5 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.


       STRAIGHTJ.


           IF WK-CARD1 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARD2 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARDTABLE1 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARDTABLE2 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARDTABLE3 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARDTABLE4 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARDTABLE5 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.


       STRAIGHTQ.


           IF WK-CARD1 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARD2 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARDTABLE1 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARDTABLE2 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARDTABLE3 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARDTABLE4 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARDTABLE5 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.


       STRAIGHTK.


           IF WK-CARD1 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARD2 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARDTABLE1 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARDTABLE2 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARDTABLE3 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARDTABLE4 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARDTABLE5 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.


       ENDSTRAIGHT.


      *CPU hand calculation


           IF WK-CARD1CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
              MOVE 1 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
              MOVE 1 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
              MOVE 2 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
              MOVE 2 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
              MOVE 3 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
              MOVE 3 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
              MOVE 4 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
              MOVE 4 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
              MOVE 5 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
              MOVE 5 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
              MOVE 6 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
              MOVE 6 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
              MOVE 7 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
              MOVE 7 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
              MOVE 8 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
              MOVE 8 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
              MOVE 9 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
              MOVE 9 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
              MOVE 10 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
              MOVE 10 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
              MOVE 11 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
              MOVE 11 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
              MOVE 12 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
              MOVE 12 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "A"
              ADD 1 TO WK-APLAYSCPU
              MOVE 13 TO WK-CPUDRAW
           END-IF.
           IF WK-CARD2CPU = "A"
              ADD 1 TO WK-APLAYSCPU
              MOVE 13 TO WK-CPUDRAW
           END-IF.
           IF WK-CARDTABLE1 = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARDTABLE2 = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARDTABLE3 = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARDTABLE4 = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARDTABLE5 = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.



           IF WK-CARD1CPU = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARD2CPU = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARDTABLE1 = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARDTABLE2 = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARDTABLE3 = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARDTABLE4 = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARDTABLE5 = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.


       STRAIGHTCPU2.


           IF WK-CARD1CPU = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARD2CPU = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARDTABLE1 = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARDTABLE2 = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARDTABLE3 = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARDTABLE4 = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARDTABLE5 = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.


       STRAIGHTCPU3.


           IF WK-CARD1CPU = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARD2CPU = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARDTABLE1 = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARDTABLE2 = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARDTABLE3 = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARDTABLE4 = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARDTABLE5 = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.

       STRAIGHTCPU4.


           IF WK-CARD1CPU = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARD2CPU = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARDTABLE1 = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARDTABLE2 = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARDTABLE3 = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARDTABLE4 = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARDTABLE5 = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.


       STRAIGHTCPU5.


           IF WK-CARD1CPU = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARD2CPU = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARDTABLE1 = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARDTABLE2 = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARDTABLE3 = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARDTABLE4 = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARDTABLE5 = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.


       STRAIGHTCPU6.


           IF WK-CARD1CPU = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARD2CPU = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARDTABLE1 = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARDTABLE2 = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARDTABLE3 = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARDTABLE4 = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARDTABLE5 = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.

       STRAIGHTCPU7.


           IF WK-CARD1CPU = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARD2CPU = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARDTABLE1 = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARDTABLE2 = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARDTABLE3 = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARDTABLE4 = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARDTABLE5 = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.

       STRAIGHTCPU8.


           IF WK-CARD1CPU = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARD2CPU = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARDTABLE1 = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARDTABLE2 = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARDTABLE3 = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARDTABLE4 = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARDTABLE5 = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.

       STRAIGHTCPU9.


           IF WK-CARD1CPU = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARD2CPU = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARDTABLE1 = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARDTABLE2 = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARDTABLE3 = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARDTABLE4 = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARDTABLE5 = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.


       STRAIGHTCPU10.


           IF WK-CARD1CPU = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARD2CPU = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARDTABLE1 = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARDTABLE2 = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARDTABLE3 = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARDTABLE4 = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARDTABLE5 = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.


       STRAIGHTCPUJ.


           IF WK-CARD1CPU = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARD2CPU = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARDTABLE1 = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARDTABLE2 = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARDTABLE3 = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARDTABLE4 = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARDTABLE5 = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.


       STRAIGHTCPUQ.


           IF WK-CARD1CPU = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARD2CPU = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARDTABLE1 = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARDTABLE2 = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARDTABLE3 = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARDTABLE4 = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARDTABLE5 = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.


       STRAIGHTCPUK.


           IF WK-CARD1CPU = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARD2CPU = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARDTABLE1 = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARDTABLE2 = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARDTABLE3 = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARDTABLE4 = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARDTABLE5 = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.


       ENDSTRAIGHTCPU.


           DISPLAY "Player best hand:" AT 1602 UNDERLINE.


      *Player hand displaying

           IF WK-APLAYS > 6
              DISPLAY "Five of a kind (A)"
              MOVE 243 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS = 5
              DISPLAY "Five of a kind (A)"
              MOVE 243 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS > 6
              DISPLAY "Five of a kind (K)"
              MOVE 242 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 5
              DISPLAY "Five of a kind (K)"
              MOVE 242 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS > 6
              DISPLAY "Five of a kind (Q)"
              MOVE 241 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 5
              DISPLAY "Five of a kind (Q)"
              MOVE 241 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS > 6
              DISPLAY "Five of a kind (J)"
              MOVE 240 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 5
              DISPLAY "Five of a kind (J)"
              MOVE 240 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS > 6
              DISPLAY "Five of a kind (10)"
              MOVE 239 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 5
              DISPLAY "Five of a kind (10)"
              MOVE 239 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS > 6
              DISPLAY "Five of a kind (9)"
              MOVE 238 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 5
              DISPLAY "Five of a kind (9)"
              MOVE 238 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS > 6
              DISPLAY "Five of a kind (8)"
              MOVE 237 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 5
              DISPLAY "Five of a kind (8)"
              MOVE 237 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS > 6
              DISPLAY "Five of a kind (7)"
              MOVE 236 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 5
              DISPLAY "Five of a kind (7)"
              MOVE 236 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS > 6
              DISPLAY "Five of a kind (6)"
              MOVE 235 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 5
              DISPLAY "Five of a kind (6)"
              MOVE 235 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS > 6
              DISPLAY "Five of a kind (5)"
              MOVE 234 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 5
              DISPLAY "Five of a kind (5)"
              MOVE 234 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS > 6
              DISPLAY "Five of a kind (4)"
              MOVE 233 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 5
              DISPLAY "Five of a kind (4)"
              MOVE 233 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS > 6
              DISPLAY "Five of a kind (3)"
              MOVE 232 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 5
              DISPLAY "Five of a kind (3)"
              MOVE 232 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS > 6
              DISPLAY "Five of a kind (2)"
              MOVE 231 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 5
              DISPLAY "Five of a kind (2)"
              MOVE 231 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 4
              DISPLAY "Four of a kind (A)"
              MOVE 230 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 4
              DISPLAY "Four of a kind (K)"
              MOVE 229 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 4
              DISPLAY "Four of a kind (Q)"
              MOVE 228 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 4
              DISPLAY "Four of a kind (J)"
              MOVE 227 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 4
              DISPLAY "Four of a kind (10)"
              MOVE 226 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 4
              DISPLAY "Four of a kind (9)"
              MOVE 225 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 4
              DISPLAY "Four of a kind (8)"
              MOVE 224 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 4
              DISPLAY "Four of a kind (7)"
              MOVE 223 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 4
              DISPLAY "Four of a kind (6)"
              MOVE 222 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 4
              DISPLAY "Four of a kind (5)"
              MOVE 221 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 4
              DISPLAY "Four of a kind (4)"
              MOVE 220 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 4
              DISPLAY "Four of a kind (3)"
              MOVE 219 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 4
              DISPLAY "Four of a kind (2)"
              MOVE 218 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS + WK-KPLAYS = 5
              DISPLAY "Full house (A and K)"
              MOVE 217 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (A and Q)"
              MOVE 216 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (A and J)"
              MOVE 215 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (A and 10)"
              MOVE 214 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (A and 9)"
              MOVE 213 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (A and 8)"
              MOVE 212 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (A and 7)"
              MOVE 211 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (A and 6)"
              MOVE 210 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (A and 5)"
              MOVE 209 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (A and 4)"
              MOVE 208 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (A and 3)"
              MOVE 207 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (A and 2)"
              MOVE 206 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-KPLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (K and Q)"
              MOVE 205 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (K and J)"
              MOVE 204 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (K and 10)"
              MOVE 203 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (K and 9)"
              MOVE 202 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (K and 8)"
              MOVE 201 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (K and 7)"
              MOVE 200 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (K and 6)"
              MOVE 199 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (K and 5)"
              MOVE 198 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (K and 4)"
              MOVE 197 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (K and 3)"
              MOVE 196 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (K and 2)"
              MOVE 195 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (Q and J)"
              MOVE 194 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (Q and 10)"
              MOVE 193 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (Q and 9)"
              MOVE 192 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (Q and 8)"
              MOVE 191 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (Q and 7)"
              MOVE 190 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (Q and 6)"
              MOVE 189 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (Q and 5)"
              MOVE 188 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (Q and 4)"
              MOVE 187 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (Q and 3)"
              MOVE 186 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (Q and 2)"
              MOVE 185 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (J and 10)"
              MOVE 184 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (J and 9)"
              MOVE 183 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (J and 8)"
              MOVE 182 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (J and 7)"
              MOVE 181 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (J and 6)"
              MOVE 180 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (J and 5)"
              MOVE 179 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (J and 4)"
              MOVE 178 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (J and 3)"
              MOVE 177 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (J and 2)"
              MOVE 176 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (10 and 9)"
              MOVE 175 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (10 and 8)"
              MOVE 174 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (10 and 7)"
              MOVE 173 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (10 and 6)"
              MOVE 172 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (10 and 5)"
              MOVE 171 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (10 and 4)"
              MOVE 170 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (10 and 3)"
              MOVE 169 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (10 and 2)"
              MOVE 168 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (9 and 8)"
              MOVE 167 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (9 and 7)"
              MOVE 166 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (9 and 6)"
              MOVE 165 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (9 and 5)"
              MOVE 164 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (9 and 4)"
              MOVE 163 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (9 and 3)"
              MOVE 162 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (9 and 2)"
              MOVE 161 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (8 and 7)"
              MOVE 160 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (8 and 6)"
              MOVE 159 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (8 and 5)"
              MOVE 158 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (8 and 4)"
              MOVE 157 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (8 and 3)"
              MOVE 156 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (8 and 2)"
              MOVE 155 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (7 and 6)"
              MOVE 154 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (7 and 5)"
              MOVE 153 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (7 and 4)"
              MOVE 152 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (7 and 3)"
              MOVE 151 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (7 and 2)"
              MOVE 150 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (6 and 5)"
              MOVE 149 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (6 and 4)"
              MOVE 148 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (6 and 3)"
              MOVE 147 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (6 and 2)"
              MOVE 146 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (5 and 4)"
              MOVE 145 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (5 and 3)"
              MOVE 144 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (5 and 2)"
              MOVE 143 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (4 and 3)"
              MOVE 142 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (4 and 2)"
              MOVE 141 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (3 and 2)"
              MOVE 140 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-ATO5 = 5
              DISPLAY "Straight (A to 5)"
              MOVE 139 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2TO6 = 5
              DISPLAY "Straight (2 to 6)"
              MOVE 138 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3TO7 = 5
              DISPLAY "Straight (3 to 7)"
              MOVE 137 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4TO8 = 5
              DISPLAY "Straight (4 to 8)"
              MOVE 136 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5TO9 = 5
              DISPLAY "Straight (5 to 9)"
              MOVE 135 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6TO10 = 5
              DISPLAY "Straight (6 to 10)"
              MOVE 134 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7TOJ = 5
              DISPLAY "Straight (7 to J)"
              MOVE 133 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8TOQ = 5
              DISPLAY "Straight (8 to Q)"
              MOVE 132 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9TOK = 5
              DISPLAY "Straight (9 to K)"
              MOVE 131 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10TOA = 5
              DISPLAY "Straight (10 to A)"
              MOVE 130 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JTO2 = 5
              DISPLAY "Straight (J to 2)"
              MOVE 129 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QTO3 = 5
              DISPLAY "Straight (Q to 3)"
              MOVE 128 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KTO4 = 5
              DISPLAY "Straight (K to 4)"
              MOVE 127 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 3
              DISPLAY "Three of a kind (A)"
              MOVE 126 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 3
              DISPLAY "Three of a kind (K)"
              MOVE 125 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 3
              DISPLAY "Three of a kind (Q)"
              MOVE 124 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 3
              DISPLAY "Three of a kind (J)"
              MOVE 123 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 3
              DISPLAY "Three of a kind (10)"
              MOVE 122 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 3
              DISPLAY "Three of a kind (9)"
              MOVE 121 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 3
              DISPLAY "Three of a kind (8)"
              MOVE 120 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 3
              DISPLAY "Three of a kind (7)"
              MOVE 119 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 3
              DISPLAY "Three of a kind (6)"
              MOVE 118 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 3
              DISPLAY "Three of a kind (5)"
              MOVE 117 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 3
              DISPLAY "Three of a kind (4)"
              MOVE 116 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 3
              DISPLAY "Three of a kind (3)"
              MOVE 115 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 3
              DISPLAY "Three of a kind (3)"
              MOVE 114 TO WK-PLAYERWINS
              GO TO GAMEOVER


           IF WK-APLAYS + WK-KPLAYS = 4
              DISPLAY "Two pairs (A and K)"
              MOVE 113 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (A and Q)"
              MOVE 112 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (A and J)"
              MOVE 111 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (A and 10)"
              MOVE 110 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (A and 9)"
              MOVE 109 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (A and 8)"
              MOVE 108 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (A and 7)"
              MOVE 107 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (A and 6)"
              MOVE 106 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (A and 5)"
              MOVE 105 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (A and 4)"
              MOVE 104 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (A and 3)"
              MOVE 103 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (A and 2)"
              MOVE 102 TO WK-PLAYERWINS
              GO TO GAMEOVER

           END-IF.
           IF WK-KPLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (K and Q)"
              MOVE 101 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (K and J)"
              MOVE 100 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (K and 10)"
              MOVE 99 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (K and 9)"
              MOVE 98 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (K and 8)"
              MOVE 97 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (K and 7)"
              MOVE 96 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (K and 6)"
              MOVE 95 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (K and 5)"
              MOVE 94 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (K and 4)"
              MOVE 93 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (K and 3)"
              MOVE 92 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (K and 2)"
              MOVE 91 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (Q and J)"
              MOVE 90 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (Q and 10)"
              MOVE 89 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (Q and 9)"
              MOVE 88 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (Q and 8)"
              MOVE 87 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (Q and 7)"
              MOVE 86 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (Q and 6)"
              MOVE 85 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (Q and 5)"
              MOVE 84 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (Q and 4)"
              MOVE 83 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (Q and 3)"
              MOVE 82 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (Q and 2)"
              MOVE 81 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              MOVE 80 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              MOVE 79 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              MOVE 78 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              MOVE 77 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              MOVE 76 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              MOVE 75 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              MOVE 74 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (J and 3)"
              MOVE 73 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              MOVE 72 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              MOVE 71 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              MOVE 70 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              MOVE 69 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              MOVE 68 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              MOVE 67 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              MOVE 66 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              MOVE 65 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (J and 3)"
              MOVE 64 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              MOVE 63 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (10 and 9)"
              MOVE 62 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (10 and 8)"
              MOVE 61 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (10 and 7)"
              MOVE 60 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (10 and 6)"
              MOVE 59 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (10 and 5)"
              MOVE 58 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (10 and 4)"
              MOVE 57 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (10 and 3)"
              MOVE 56 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (10 and 2)"
              MOVE 55 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (9 and 8)"
              MOVE 54 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (9 and 7)"
              MOVE 53 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (9 and 6)"
              MOVE 52 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (9 and 5)"
              MOVE 51 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (9 and 4)"
              MOVE 50 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (9 and 3)"
              MOVE 49 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (9 and 2)"
              MOVE 48 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (8 and 7)"
              MOVE 47 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (8 and 6)"
              MOVE 46 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (8 and 5)"
              MOVE 45 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (8 and 4)"
              MOVE 44 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (8 and 3)"
              MOVE 43 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (8 and 2)"
              MOVE 42 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (7 and 6)"
              MOVE 41 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (7 and 5)"
              MOVE 40 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (7 and 4)"
              MOVE 39 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (7 and 3)"
              MOVE 38 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (7 and 2)"
              MOVE 37 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (6 and 5)"
              MOVE 36 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (6 and 4)"
              MOVE 35 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (6 and 3)"
              MOVE 34 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (6 and 2)"
              MOVE 33 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (5 and 4)"
              MOVE 32 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (5 and 3)"
              MOVE 31 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (5 and 2)"
              MOVE 30 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (4 and 3)"
              MOVE 29 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (4 and 2)"
              MOVE 28 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-3PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (3 and 2)"
              MOVE 27 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 2
              DISPLAY "One pair (A)"
              MOVE 26 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-KPLAYS = 2
              DISPLAY "One pair (K)"
              MOVE 25 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS = 2
              DISPLAY "One pair (Q)"
              MOVE 24 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS = 2
              DISPLAY "One pair (J)"
              MOVE 23 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS = 2
              DISPLAY "One pair (10)"
              MOVE 22 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS = 2
              DISPLAY "One pair (9)"
              MOVE 21 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS = 2
              DISPLAY "One pair (8)"
              MOVE 20 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS = 2
              DISPLAY "One pair (7)"
              MOVE 19 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS = 2
              DISPLAY "One pair (6)"
              MOVE 18 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS = 2
              DISPLAY "One pair (5)"
              MOVE 17 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS = 2
              DISPLAY "One pair (4)"
              MOVE 16 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-3PLAYS = 2
              DISPLAY "One pair (3)"
              MOVE 15 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-2PLAYS = 2
              DISPLAY "One pair (2)"
              MOVE 14 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 1
              DISPLAY "High card (A)"
              MOVE 13 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 1
              DISPLAY "High card (K)"
              MOVE 12 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 1
              DISPLAY "High card (Q)"
              MOVE 11 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 1
              DISPLAY "High card (J)"
              MOVE 10 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 1
              DISPLAY "High card (10)"
              MOVE 9 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 1
              DISPLAY "High card (9)"
              MOVE 8 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 1
              DISPLAY "High card (8)"
              MOVE 7 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 1
              DISPLAY "High card (7)"
              MOVE 6 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 1
              DISPLAY "High card (6)"
              MOVE 5 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 1
              DISPLAY "High card (5)"
              MOVE 4 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 1
              DISPLAY "High card (4)"
              MOVE 3 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 1
              DISPLAY "High card (3)"
              MOVE 2 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 1
              DISPLAY "High card (2)"
              MOVE 1 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

       GAMEOVER.



           DISPLAY "CPU best hand:" AT 0502 UNDERLINE.


      *CPU hand displaying

           IF WK-APLAYSCPU > 6
              DISPLAY "Five of a kind (A)"
              MOVE 243 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU = 5
              DISPLAY "Five of a kind (A)"
              MOVE 243 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU > 6
              DISPLAY "Five of a kind (K)"
              MOVE 242 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 5
              DISPLAY "Five of a kind (K)"
              MOVE 242 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU > 6
              DISPLAY "Five of a kind (Q)"
              MOVE 241 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 5
              DISPLAY "Five of a kind (Q)"
              MOVE 241 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU > 6
              DISPLAY "Five of a kind (J)"
              MOVE 240 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 5
              DISPLAY "Five of a kind (J)"
              MOVE 240 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU > 6
              DISPLAY "Five of a kind (10)"
              MOVE 239 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 5
              DISPLAY "Five of a kind (10)"
              MOVE 239 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU > 6
              DISPLAY "Five of a kind (9)"
              MOVE 238 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 5
              DISPLAY "Five of a kind (9)"
              MOVE 238 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU > 6
              DISPLAY "Five of a kind (8)"
              MOVE 237 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 5
              DISPLAY "Five of a kind (8)"
              MOVE 237 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU > 6
              DISPLAY "Five of a kind (7)"
              MOVE 236 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 5
              DISPLAY "Five of a kind (7)"
              MOVE 236 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU > 6
              DISPLAY "Five of a kind (6)"
              MOVE 235 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 5
              DISPLAY "Five of a kind (6)"
              MOVE 235 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU > 6
              DISPLAY "Five of a kind (5)"
              MOVE 234 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 5
              DISPLAY "Five of a kind (5)"
              MOVE 234 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU > 6
              DISPLAY "Five of a kind (4)"
              MOVE 233 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 5
              DISPLAY "Five of a kind (4)"
              MOVE 233 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU > 6
              DISPLAY "Five of a kind (3)"
              MOVE 232 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 5
              DISPLAY "Five of a kind (3)"
              MOVE 232 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU > 6
              DISPLAY "Five of a kind (2)"
              MOVE 231 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 5
              DISPLAY "Five of a kind (2)"
              MOVE 231 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 4
              DISPLAY "Four of a kind (A)"
              MOVE 230 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 4
              DISPLAY "Four of a kind (K)"
              MOVE 229 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 4
              DISPLAY "Four of a kind (Q)"
              MOVE 228 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 4
              DISPLAY "Four of a kind (J)"
              MOVE 227 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 4
              DISPLAY "Four of a kind (10)"
              MOVE 226 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 4
              DISPLAY "Four of a kind (9)"
              MOVE 225 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 4
              DISPLAY "Four of a kind (8)"
              MOVE 224 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 4
              DISPLAY "Four of a kind (7)"
              MOVE 223 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 4
              DISPLAY "Four of a kind (6)"
              MOVE 222 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 4
              DISPLAY "Four of a kind (5)"
              MOVE 221 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 4
              DISPLAY "Four of a kind (4)"
              MOVE 220 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 4
              DISPLAY "Four of a kind (3)"
              MOVE 219 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 4
              DISPLAY "Four of a kind (2)"
              MOVE 218 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU + WK-KPLAYSCPU = 5
              DISPLAY "Full house (A and K)"
              MOVE 217 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-QPLAYSCPU = 5
              DISPLAY "Full house (A and Q)"
              MOVE 216 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (A and J)"
              MOVE 215 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (A and 10)"
              MOVE 214 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (A and 9)"
              MOVE 213 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (A and 8)"
              MOVE 212 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (A and 7)"
              MOVE 211 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (A and 6)"
              MOVE 210 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (A and 5)"
              MOVE 209 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (A and 4)"
              MOVE 208 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (A and 3)"
              MOVE 207 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (A and 2)"
              MOVE 206 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-KPLAYSCPU + WK-QPLAYSCPU = 5
              DISPLAY "Full house (K and Q)"
              MOVE 205 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (K and J)"
              MOVE 204 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (K and 10)"
              MOVE 203 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (K and 9)"
              MOVE 202 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (K and 8)"
              MOVE 201 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (K and 7)"
              MOVE 200 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (K and 6)"
              MOVE 199 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (K and 5)"
              MOVE 198 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (K and 4)"
              MOVE 197 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (K and 3)"
              MOVE 196 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (K and 2)"
              MOVE 195 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (Q and J)"
              MOVE 194 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (Q and 10)"
              MOVE 193 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (Q and 9)"
              MOVE 192 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (Q and 8)"
              MOVE 191 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (Q and 7)"
              MOVE 190 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (Q and 6)"
              MOVE 189 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (Q and 5)"
              MOVE 188 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (Q and 4)"
              MOVE 187 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (Q and 3)"
              MOVE 186 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (Q and 2)"
              MOVE 185 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (J and 10)"
              MOVE 184 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (J and 9)"
              MOVE 183 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (J and 8)"
              MOVE 182 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (J and 7)"
              MOVE 181 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (J and 6)"
              MOVE 180 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (J and 5)"
              MOVE 179 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (J and 4)"
              MOVE 178 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (J and 3)"
              MOVE 177 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (J and 2)"
              MOVE 176 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (10 and 9)"
              MOVE 175 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (10 and 8)"
              MOVE 174 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (10 and 7)"
              MOVE 173 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (10 and 6)"
              MOVE 172 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (10 and 5)"
              MOVE 171 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (10 and 4)"
              MOVE 170 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (10 and 3)"
              MOVE 169 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (10 and 2)"
              MOVE 168 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (9 and 8)"
              MOVE 167 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (9 and 7)"
              MOVE 166 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (9 and 6)"
              MOVE 165 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (9 and 5)"
              MOVE 164 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (9 and 4)"
              MOVE 163 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (9 and 3)"
              MOVE 162 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (9 and 2)"
              MOVE 161 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (8 and 7)"
              MOVE 160 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (8 and 6)"
              MOVE 159 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (8 and 5)"
              MOVE 158 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (8 and 4)"
              MOVE 157 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (8 and 3)"
              MOVE 156 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (8 and 2)"
              MOVE 155 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (7 and 6)"
              MOVE 154 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (7 and 5)"
              MOVE 153 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (7 and 4)"
              MOVE 152 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (7 and 3)"
              MOVE 151 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (7 and 2)"
              MOVE 150 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (6 and 5)"
              MOVE 149 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (6 and 4)"
              MOVE 148 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (6 and 3)"
              MOVE 147 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (6 and 2)"
              MOVE 146 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (5 and 4)"
              MOVE 145 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (5 and 3)"
              MOVE 144 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (5 and 2)"
              MOVE 143 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (4 and 3)"
              MOVE 142 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (4 and 2)"
              MOVE 141 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (3 and 2)"
              MOVE 140 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-ATO5 = 5
              DISPLAY "Straight (A to 5)"
              MOVE 139 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2TO6 = 5
              DISPLAY "Straight (2 to 6)"
              MOVE 138 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3TO7 = 5
              DISPLAY "Straight (3 to 7)"
              MOVE 137 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4TO8 = 5
              DISPLAY "Straight (4 to 8)"
              MOVE 136 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5TO9 = 5
              DISPLAY "Straight (5 to 9)"
              MOVE 135 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6TO10 = 5
              DISPLAY "Straight (6 to 10)"
              MOVE 134 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7TOJ = 5
              DISPLAY "Straight (7 to J)"
              MOVE 133 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8TOQ = 5
              DISPLAY "Straight (8 to Q)"
              MOVE 132 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9TOK = 5
              DISPLAY "Straight (9 to K)"
              MOVE 131 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10TOA = 5
              DISPLAY "Straight (10 to A)"
              MOVE 130 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JTO2 = 5
              DISPLAY "Straight (J to 2)"
              MOVE 129 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QTO3 = 5
              DISPLAY "Straight (Q to 3)"
              MOVE 128 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KTO4 = 5
              DISPLAY "Straight (K to 4)"
              MOVE 127 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 3
              DISPLAY "Three of a kind (A)"
              MOVE 126 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 3
              DISPLAY "Three of a kind (K)"
              MOVE 125 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 3
              DISPLAY "Three of a kind (Q)"
              MOVE 124 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 3
              DISPLAY "Three of a kind (J)"
              MOVE 123 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 3
              DISPLAY "Three of a kind (10)"
              MOVE 122 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 3
              DISPLAY "Three of a kind (9)"
              MOVE 121 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 3
              DISPLAY "Three of a kind (8)"
              MOVE 120 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 3
              DISPLAY "Three of a kind (7)"
              MOVE 119 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 3
              DISPLAY "Three of a kind (6)"
              MOVE 118 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 3
              DISPLAY "Three of a kind (5)"
              MOVE 117 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 3
              DISPLAY "Three of a kind (4)"
              MOVE 116 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 3
              DISPLAY "Three of a kind (3)"
              MOVE 115 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 3
              DISPLAY "Three of a kind (3)"
              MOVE 114 TO WK-CPUWINS
              GO TO GAMEOVERCPU


           IF WK-APLAYSCPU + WK-KPLAYSCPU = 4
              DISPLAY "Two pairs (A and K)"
              MOVE 113 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-QPLAYSCPU = 4
              DISPLAY "Two pairs (A and Q)"
              MOVE 112 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (A and J)"
              MOVE 111 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (A and 10)"
              MOVE 110 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (A and 9)"
              MOVE 109 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (A and 8)"
              MOVE 108 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (A and 7)"
              MOVE 107 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (A and 6)"
              MOVE 106 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (A and 5)"
              MOVE 105 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (A and 4)"
              MOVE 104 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-3PLAYSCPU = 4
               DISPLAY "Two pairs (A and 3)"
              MOVE 103 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (A and 2)"
              MOVE 102 TO WK-CPUWINS
              GO TO GAMEOVERCPU

           END-IF.
           IF WK-KPLAYSCPU + WK-QPLAYSCPU = 4
              DISPLAY "Two pairs (K and Q)"
              MOVE 101 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (K and J)"
              MOVE 100 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (K and 10)"
              MOVE 99 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (K and 9)"
              MOVE 98 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (K and 8)"
              MOVE 97 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (K and 7)"
              MOVE 96 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (K and 6)"
              MOVE 95 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (K and 5)"
              MOVE 94 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (K and 4)"
              MOVE 93 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-3PLAYSCPU = 4
               DISPLAY "Two pairs (K and 3)"
              MOVE 92 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (K and 2)"
              MOVE 91 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (Q and J)"
              MOVE 90 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 10)"
              MOVE 89 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 9)"
              MOVE 88 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 8)"
              MOVE 87 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 7)"
              MOVE 86 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 6)"
              MOVE 85 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 5)"
              MOVE 84 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 4)"
              MOVE 83 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 3)"
              MOVE 82 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 2)"
              MOVE 81 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (J and 10)"
              MOVE 80 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (J and 9)"
              MOVE 79 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (J and 8)"
              MOVE 78 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (J and 7)"
              MOVE 77 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (J and 6)"
              MOVE 76 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (J and 5)"
              MOVE 75 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (J and 4)"
              MOVE 74 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (J and 3)"
              MOVE 73 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (J and 2)"
              MOVE 72 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (J and 10)"
              MOVE 71 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (J and 9)"
              MOVE 70 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (J and 8)"
              MOVE 69 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (J and 7)"
              MOVE 68 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (J and 6)"
              MOVE 67 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (J and 5)"
              MOVE 66 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (J and 4)"
              MOVE 65 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (J and 3)"
              MOVE 64 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (J and 2)"
              MOVE 63 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 9)"
              MOVE 62 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 8)"
              MOVE 61 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 7)"
              MOVE 60 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 6)"
              MOVE 59 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 5)"
              MOVE 58 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 4)"
              MOVE 57 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 3)"
              MOVE 56 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 2)"
              MOVE 55 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 8)"
              MOVE 54 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 7)"
              MOVE 53 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 6)"
              MOVE 52 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 5)"
              MOVE 51 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 4)"
              MOVE 50 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 3)"
              MOVE 49 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 2)"
              MOVE 48 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 7)"
              MOVE 47 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 6)"
              MOVE 46 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 5)"
              MOVE 45 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 4)"
              MOVE 44 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 3)"
              MOVE 43 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 2)"
              MOVE 42 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 6)"
              MOVE 41 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 5)"
              MOVE 40 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 4)"
              MOVE 39 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 3)"
              MOVE 38 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 2)"
              MOVE 37 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 5)"
              MOVE 36 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 4)"
              MOVE 35 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 3)"
              MOVE 34 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 2)"
              MOVE 33 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 4)"
              MOVE 32 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 3)"
              MOVE 31 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 2)"
              MOVE 30 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (4 and 3)"
              MOVE 29 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (4 and 2)"
              MOVE 28 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-3PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (3 and 2)"
              MOVE 27 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 2
              DISPLAY "One pair (A)"
              MOVE 26 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-KPLAYSCPU = 2
              DISPLAY "One pair (K)"
              MOVE 25 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU = 2
              DISPLAY "One pair (Q)"
              MOVE 24 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU = 2
              DISPLAY "One pair (J)"
              MOVE 23 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU = 2
              DISPLAY "One pair (10)"
              MOVE 22 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU = 2
              DISPLAY "One pair (9)"
              MOVE 21 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU = 2
              DISPLAY "One pair (8)"
              MOVE 20 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU = 2
              DISPLAY "One pair (7)"
              MOVE 19 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU = 2
              DISPLAY "One pair (6)"
              MOVE 18 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU = 2
              DISPLAY "One pair (5)"
              MOVE 17 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU = 2
              DISPLAY "One pair (4)"
              MOVE 16 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-3PLAYSCPU = 2
              DISPLAY "One pair (3)"
              MOVE 15 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-2PLAYSCPU = 2
              DISPLAY "One pair (2)"
              MOVE 14 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 1
              DISPLAY "High card (A)"
              MOVE 13 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 1
              DISPLAY "High card (K)"
              MOVE 12 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 1
              DISPLAY "High card (Q)"
              MOVE 11 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 1
              DISPLAY "High card (J)"
              MOVE 10 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 1
              DISPLAY "High card (10)"
              MOVE 9 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 1
              DISPLAY "High card (9)"
              MOVE 8 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 1
              DISPLAY "High card (8)"
              MOVE 7 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 1
              DISPLAY "High card (7)"
              MOVE 6 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 1
              DISPLAY "High card (6)"
              MOVE 5 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 1
              DISPLAY "High card (5)"
              MOVE 4 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 1
              DISPLAY "High card (4)"
              MOVE 3 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 1
              DISPLAY "High card (3)"
              MOVE 2 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 1
              DISPLAY "High card (2)"
              MOVE 1 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

       GAMEOVERCPU.

           IF WK-PLAYERWINS > WK-CPUWINS
              DISPLAY "Player Wins" AT 1835 REVERSE
              ACCEPT WK-NONE AT 0101
              ADD WK-JACKPOT TO WK-PLAYERMONEY
              MOVE 0 TO WK-JACKPOT
              MOVE WK-JACKPOT TO WK-JACKPOTSHOW
              DISPLAY WK-JACKPOTSHOW AT 0762
              MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW
              DISPLAY WK-PLAYERMONEYSHOW AT 2465
           END-IF.

           IF WK-CPUWINS > WK-PLAYERWINS
              DISPLAY "CPU Wins" AT 0937 REVERSE
           END-IF.

           ACCEPT WK-PARA.
           GOBACK.

       GAMESTOP.

