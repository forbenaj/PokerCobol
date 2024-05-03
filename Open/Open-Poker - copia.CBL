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

      *Table cards
       01 WK-CARDTABLE1 PIC X(02).
       01 WK-CARDTABLE2 PIC X(02).
       01 WK-CARDTABLE3 PIC X(02).
       01 WK-CARDTABLE4 PIC X(02).
       01 WK-CARDTABLE5 PIC X(02).

       01 WK-TIME PIC 99.

       01 WK-NONE PIC X.

       01 WK-BET PIC 9(08).
       01 WK-JACKPOT PIC 9(08).
       01 WK-JACKPOTSHOW PIC $$$$$$$9.

      *Game calculation

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

       LINKAGE SECTION.


       SCREEN SECTION.


       PROCEDURE DIVISION.

           DISPLAY BOX AT 1810 SIZE 6 LINES 5.
           DISPLAY BOX AT 1911 SIZE 6 LINES 5.
           DISPLAY "     " AT 1911.
           DISPLAY "    " AT 2011.
           DISPLAY "    " AT 2111.
           DISPLAY " " AT 2211.

      *Main sorting

       SORT1.

           ACCEPT WK-NONE AT 0101.
           ACCEPT WK-TIME FROM TIME.
           IF WK-TIME = 01 OR 14 OR 27 OR 40 OR 53 OR 66 OR 79
              MOVE WK-A TO WK-CARD
           END-IF.
           IF WK-TIME = 02 OR 15 OR 28 OR 41 OR 54 OR 67 OR 79
              MOVE WK-2 TO WK-CARD
           END-IF.
           IF WK-TIME = 03 OR 16 OR 29 OR 42 OR 55 OR 68 OR 80
              MOVE WK-3 TO WK-CARD
           END-IF.
           IF WK-TIME = 04 OR 17 OR 30 OR 43 OR 56 OR 69 OR 81
              MOVE WK-4 TO WK-CARD
           END-IF.
           IF WK-TIME = 05 OR 18 OR 31 OR 44 OR 57 OR 70 OR 82
              MOVE WK-5 TO WK-CARD
           END-IF.
           IF WK-TIME = 06 OR 19 OR 32 OR 45 OR 58 OR 71 OR 83
              MOVE WK-6 TO WK-CARD
           END-IF.
           IF WK-TIME = 07 OR 20 OR 33 OR 46 OR 59 OR 72 OR 84
              MOVE WK-7 TO WK-CARD
           END-IF.
           IF WK-TIME = 08 OR 21 OR 34 OR 47 OR 60 OR 73 OR 85
              MOVE WK-8 TO WK-CARD
           END-IF.
           IF WK-TIME = 09 OR 22 OR 35 OR 48 OR 61 OR 74 OR 86
              MOVE WK-9 TO WK-CARD
           END-IF.
           IF WK-TIME = 10 OR 23 OR 36 OR 49 OR 62 OR 75 OR 87
              MOVE WK-10 TO WK-CARD
           END-IF.
           IF WK-TIME = 11 OR 24 OR 37 OR 50 OR 63 OR 76 OR 88
              MOVE WK-J TO WK-CARD
           END-IF.
           IF WK-TIME = 12 OR 25 OR 38 OR 51 OR 64 OR 77 OR 89
              MOVE WK-Q TO WK-CARD
           END-IF.
           IF WK-TIME = 13 OR 26 OR 39 OR 52 OR 65 OR 78 OR 90
              MOVE WK-K TO WK-CARD
           END-IF.
           IF WK-TIME = 00 OR > 91
              PERFORM SORT1
           END-IF.

       F-SORT1.

      *Sorting and displaying player cards

           MOVE WK-CARD TO WK-CARD1.
           DISPLAY BOX AT 1834 SIZE 6 LINES 5.
           DISPLAY WK-CARD1 AT 1935.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARD2.
           DISPLAY BOX AT 1842 SIZE 6 LINES 5.
           DISPLAY WK-CARD2 AT 1943.

      *Sorting and placing table cards

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE1.
           DISPLAY BOX AT 0622 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE2.
           DISPLAY BOX AT 0630 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE3.
           DISPLAY BOX AT 0638 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE4.
           DISPLAY BOX AT 0646 SIZE 6 LINES 5.

           PERFORM SORT1.
           MOVE WK-CARD TO WK-CARDTABLE5.
           DISPLAY BOX AT 0654 SIZE 6 LINES 5.

      *First bet placing

           DISPLAY "Jackpot:" AT 0662 UNDERLINE.
           DISPLAY "First bet:" AT 1854 UNDERLINE.
           ACCEPT WK-BET AT 1865.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY WK-JACKPOTSHOW AT 0762.

      *First table cards displaying

           DISPLAY WK-CARDTABLE1 AT 0723.
           DISPLAY WK-CARDTABLE2 AT 0731.

      *Second bet placing

           DISPLAY "Second bet:" AT 2054 UNDERLINE.
           ACCEPT WK-BET AT 2066.
           ADD WK-BET TO WK-JACKPOT.
           ADD WK-BET TO WK-JACKPOT.
           MOVE WK-JACKPOT TO WK-JACKPOTSHOW.
           DISPLAY "          " AT 0762.
           DISPLAY WK-JACKPOTSHOW AT 0762.

           DISPLAY WK-CARDTABLE3 AT 0739.
           DISPLAY WK-CARDTABLE4 AT 0747.
           DISPLAY WK-CARDTABLE5 AT 0755.

      *Game calculation

           IF WK-CARD1 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARD2 = "A"
              ADD 1 TO WK-APLAYS
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


           IF WK-CARD1 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARD2 = "2"
              ADD 1 TO WK-2PLAYS
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
           END-IF.
           IF WK-CARD2 = "3"
              ADD 1 TO WK-3PLAYS
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
           END-IF.
           IF WK-CARD2 = "4"
              ADD 1 TO WK-4PLAYS
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
           END-IF.
           IF WK-CARD2 = "5"
              ADD 1 TO WK-5PLAYS
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
           END-IF.
           IF WK-CARD2 = "6"
              ADD 1 TO WK-6PLAYS
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
           END-IF.
           IF WK-CARD2 = "7"
              ADD 1 TO WK-7PLAYS
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
           END-IF.
           IF WK-CARD2 = "8"
              ADD 1 TO WK-8PLAYS
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
           END-IF.
           IF WK-CARD2 = "9"
              ADD 1 TO WK-9PLAYS
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
           END-IF.
           IF WK-CARD2 = "10"
              ADD 1 TO WK-10PLAYS
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
           END-IF.
           IF WK-CARD2 = "J"
              ADD 1 TO WK-JPLAYS
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
           END-IF.
           IF WK-CARD2 = "Q"
              ADD 1 TO WK-QPLAYS
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
           END-IF.
           IF WK-CARD2 = "K"
              ADD 1 TO WK-KPLAYS
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
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              PERFORM STRAIGHT2 THRU GAMEOVER
           END-IF.

       STRAIGHT2.


           IF WK-CARD1 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              PERFORM STRAIGHT3 THRU GAMEOVER
           END-IF.


       STRAIGHT3.


           IF WK-CARD1 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              PERFORM STRAIGHT4 THRU GAMEOVER
           END-IF.

       STRAIGHT4.


           IF WK-CARD1 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              PERFORM STRAIGHT5 THRU GAMEOVER
           END-IF.


       STRAIGHT5.


           IF WK-CARD1 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              PERFORM STRAIGHT6 THRU GAMEOVER
           END-IF.


       STRAIGHT6.


           IF WK-CARD1 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              PERFORM STRAIGHT7 THRU GAMEOVER
           END-IF.

       STRAIGHT7.


           IF WK-CARD1 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              PERFORM STRAIGHT8 THRU GAMEOVER
           END-IF.

       STRAIGHT8.


           IF WK-CARD1 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              PERFORM STRAIGHT9 THRU GAMEOVER
           END-IF.

       STRAIGHT9.


           IF WK-CARD1 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              PERFORM STRAIGHT10 THRU GAMEOVER
           END-IF.


       STRAIGHT10.


           IF WK-CARD1 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              PERFORM STRAIGHTJ THRU GAMEOVER
           END-IF.


       STRAIGHTJ.


           IF WK-CARD1 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              PERFORM STRAIGHTQ THRU GAMEOVER
           END-IF.


       STRAIGHTQ.


           IF WK-CARD1 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              PERFORM STRAIGHTK THRU GAMEOVER
           END-IF.


       STRAIGHTK.


           IF WK-CARD1 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARD2 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE1 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE2 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE3 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE4 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.
           IF WK-CARDTABLE5 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              PERFORM ENDSTRAIGHT THRU GAMEOVER
           END-IF.


       ENDSTRAIGHT.

           DISPLAY "Best hand:" UNDERLINE.


      *Hand displaying

           IF WK-APLAYS > 6
              DISPLAY "Five of a kind (A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS = 5
              DISPLAY "Five of a kind (A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS > 6
              DISPLAY "Five of a kind (K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS = 5
              DISPLAY "Five of a kind (K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS > 6
              DISPLAY "Five of a kind (Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS = 5
              DISPLAY "Five of a kind (Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS > 6
              DISPLAY "Five of a kind (J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS = 5
              DISPLAY "Five of a kind (J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS > 6
              DISPLAY "Five of a kind (10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS = 5
              DISPLAY "Five of a kind (10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS > 6
              DISPLAY "Five of a kind (9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS = 5
              DISPLAY "Five of a kind (9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS > 6
              DISPLAY "Five of a kind (8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS = 5
              DISPLAY "Five of a kind (8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS > 6
              DISPLAY "Five of a kind (7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS = 5
              DISPLAY "Five of a kind (7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS > 6
              DISPLAY "Five of a kind (6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS = 5
              DISPLAY "Five of a kind (6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS > 6
              DISPLAY "Five of a kind (5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS = 5
              DISPLAY "Five of a kind (5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS > 6
              DISPLAY "Five of a kind (4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS = 5
              DISPLAY "Five of a kind (4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS > 6
              DISPLAY "Five of a kind (3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS = 5
              DISPLAY "Five of a kind (3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2PLAYS > 6
              DISPLAY "Five of a kind (2)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2PLAYS = 5
              DISPLAY "Five of a kind (2)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-APLAYS = 4
              DISPLAY "Four of a kind (A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS = 4
              DISPLAY "Four of a kind (K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS = 4
              DISPLAY "Four of a kind (Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS = 4
              DISPLAY "Four of a kind (J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS = 4
              DISPLAY "Four of a kind (10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS = 4
              DISPLAY "Four of a kind (9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS = 4
              DISPLAY "Four of a kind (8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS = 4
              DISPLAY "Four of a kind (7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS = 4
              DISPLAY "Four of a kind (6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS = 4
              DISPLAY "Four of a kind (5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS = 4
              DISPLAY "Four of a kind (4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS = 4
              DISPLAY "Four of a kind (3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2PLAYS = 4
              DISPLAY "Four of a kind (2)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-APLAYS + WK-KPLAYS = 5
              DISPLAY "Full house (A and K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (A and Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (A and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (A and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (A and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (A and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (A and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (A and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (A and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (A and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (A and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (A and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-KPLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (K and Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (K and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (K and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (K and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (K and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (K and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (K and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (K and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (K and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (K and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (K and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (Q and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (Q and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (Q and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (Q and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (Q and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (Q and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (Q and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (Q and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (Q and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (Q and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (J and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (J and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (J and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (J and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (J and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (J and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (J and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (J and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (J and 2)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (10 and 9)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (10 and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (10 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (10 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (10 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (10 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (10 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (10 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (9 and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (9 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (9 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (9 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (9 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (9 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (9 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (8 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (8 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (8 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (8 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (8 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (8 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (7 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (7 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (7 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (7 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (7 and 2)"
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (6 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (6 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (6 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (6 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (5 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (5 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (5 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (4 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (4 and 2)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (3 and 2)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-ATO5 = 5
              DISPLAY "Straight (A to 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2TO6 = 5
              DISPLAY "Straight (2 to 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3TO7 = 5
              DISPLAY "Straight (3 to 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4TO8 = 5
              DISPLAY "Straight (4 to 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5TO9 = 5
              DISPLAY "Straight (5 to 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6TO10 = 5
              DISPLAY "Straight (6 to 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7TOJ = 5
              DISPLAY "Straight (7 to J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8TOQ = 5
              DISPLAY "Straight (8 to Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9TOK = 5
              DISPLAY "Straight (9 to K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10TOA = 5
              DISPLAY "Straight (10 to A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JTO2 = 5
              DISPLAY "Straight (J to 2)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QTO3 = 5
              DISPLAY "Straight (Q to 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KTO4 = 5
              DISPLAY "Straight (K to 4)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-APLAYS = 3
              DISPLAY "Three of a kind (A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS = 3
              DISPLAY "Three of a kind (K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS = 3
              DISPLAY "Three of a kind (Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS = 3
              DISPLAY "Three of a kind (J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS = 3
              DISPLAY "Three of a kind (10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS = 3
              DISPLAY "Three of a kind (9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS = 3
              DISPLAY "Three of a kind (8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS = 3
              DISPLAY "Three of a kind (7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS = 3
              DISPLAY "Three of a kind (6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS = 3
              DISPLAY "Three of a kind (5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS = 3
              DISPLAY "Three of a kind (4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS = 3
              DISPLAY "Three of a kind (3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2PLAYS = 3
              DISPLAY "Three of a kind (3)"
              PERFORM GAMEOVER


           IF WK-APLAYS + WK-KPLAYS = 4
              DISPLAY "Two pairs (A and K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (A and Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (A and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (A and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (A and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (A and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (A and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (A and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (A and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (A and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (A and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (A and 2)"
              PERFORM GAMEOVER

           END-IF.
           IF WK-KPLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (K and Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (K and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (K and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (K and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (K and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (K and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (K and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (K and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (K and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (K and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (K and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (Q and J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (Q and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (Q and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (Q and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (Q and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (Q and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (Q and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (Q and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (Q and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (Q and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (J and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (J and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (10 and 9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (10 and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (10 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (10 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (10 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (10 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (10 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (10 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (9 and 8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (9 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (9 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (9 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (9 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (9 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (9 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (8 and 7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (8 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (8 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (8 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (8 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (8 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (7 and 6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (7 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (7 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (7 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (7 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (6 and 5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (6 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (6 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (6 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (5 and 4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (5 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (5 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (4 and 3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (4 and 2)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-3PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (3 and 2)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-APLAYS = 2
              DISPLAY "One pair (A)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-KPLAYS = 2
              DISPLAY "One pair (K)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-QPLAYS = 2
              DISPLAY "One pair (Q)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-JPLAYS = 2
              DISPLAY "One pair (J)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-10PLAYS = 2
              DISPLAY "One pair (10)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-9PLAYS = 2
              DISPLAY "One pair (9)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-8PLAYS = 2
              DISPLAY "One pair (8)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-7PLAYS = 2
              DISPLAY "One pair (7)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-6PLAYS = 2
              DISPLAY "One pair (6)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-5PLAYS = 2
              DISPLAY "One pair (5)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-4PLAYS = 2
              DISPLAY "One pair (4)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-3PLAYS = 2
              DISPLAY "One pair (3)"
              PERFORM GAMEOVER
           END-IF.

           IF WK-2PLAYS = 2
              DISPLAY "One pair (2)"
              PERFORM GAMEOVER
           END-IF.


           IF WK-APLAYS = 1
              DISPLAY "High card (A)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-KPLAYS = 1
              DISPLAY "High card (K)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-QPLAYS = 1
              DISPLAY "High card (Q)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-JPLAYS = 1
              DISPLAY "High card (J)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-10PLAYS = 1
              DISPLAY "High card (10)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-9PLAYS = 1
              DISPLAY "High card (9)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-8PLAYS = 1
              DISPLAY "High card (8)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-7PLAYS = 1
              DISPLAY "High card (7)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-6PLAYS = 1
              DISPLAY "High card (6)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-5PLAYS = 1
              DISPLAY "High card (5)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-4PLAYS = 1
              DISPLAY "High card (4)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-3PLAYS = 1
              DISPLAY "High card (3)"
              PERFORM GAMEOVER
           END-IF.
           IF WK-2PLAYS = 1
              DISPLAY "High card (2)"
              PERFORM GAMEOVER
           END-IF.

       GAMEOVER.

           ACCEPT WK-PARA.
           GOBACK.