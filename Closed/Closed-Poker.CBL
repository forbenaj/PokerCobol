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
       01 WK-CARD3 PIC X(02).
       01 WK-CARD4 PIC X(02).
       01 WK-CARD5 PIC X(02).

      *CPU cards

       01 WK-CARD1CPU PIC X(02).
       01 WK-CARD2CPU PIC X(02).
       01 WK-CARD3CPU PIC X(02).
       01 WK-CARD4CPU PIC X(02).
       01 WK-CARD5CPU PIC X(02).

       01 WK-TIME PIC 99.

       01 WK-NONE PIC X.

       01 WK-PLAYERMONEY PIC 9(08) VALUE 1000.
       01 WK-PLAYERMONEYSHOW PIC $$$$$$$9.
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

       01 WK-DISCARD PIC 9.

       01 WK-FIRSTDIS PIC 9.
       01 WK-SECONDDIS PIC 9.
       01 WK-THIRDDIS PIC 9.
       01 WK-FOURTHDIS PIC 9.
       01 WK-FIFTHDIS PIC 9.


       LINKAGE SECTION.


       SCREEN SECTION.


       PROCEDURE DIVISION.


           DISPLAY BOX AT 1105 SIZE 6 LINES 5.
           DISPLAY BOX AT 1206 SIZE 6 LINES 5.
           DISPLAY "     " AT 1206.
           DISPLAY "    " AT 1306.
           DISPLAY "    " AT 1406.
           DISPLAY " " AT 1506.

           MOVE WK-PLAYERMONEY TO WK-PLAYERMONEYSHOW.
           DISPLAY WK-PLAYERMONEYSHOW AT 2465.


      *Main sorting

       SORT1.

           ACCEPT WK-NONE AT 0101.
           ACCEPT WK-TIME FROM TIME.
           IF WK-TIME = 01 OR 14 OR 27 OR 40 OR 53 OR 66 OR 79
              MOVE WK-A TO WK-CARD
           END-IF.
           IF WK-TIME = 02 OR 15 OR 28 OR 41 OR 54 OR 67 OR 80
              MOVE WK-2 TO WK-CARD
           END-IF.
           IF WK-TIME = 03 OR 16 OR 29 OR 42 OR 55 OR 68 OR 81
              MOVE WK-3 TO WK-CARD
           END-IF.
           IF WK-TIME = 04 OR 17 OR 30 OR 43 OR 56 OR 69 OR 82
              MOVE WK-4 TO WK-CARD
           END-IF.
           IF WK-TIME = 05 OR 18 OR 31 OR 44 OR 57 OR 70 OR 83
              MOVE WK-5 TO WK-CARD
           END-IF.
           IF WK-TIME = 06 OR 19 OR 32 OR 45 OR 58 OR 71 OR 84
              MOVE WK-6 TO WK-CARD
           END-IF.
           IF WK-TIME = 07 OR 20 OR 33 OR 46 OR 59 OR 72 OR 85
              MOVE WK-7 TO WK-CARD
           END-IF.
           IF WK-TIME = 08 OR 21 OR 34 OR 47 OR 60 OR 73 OR 86
              MOVE WK-8 TO WK-CARD
           END-IF.
           IF WK-TIME = 09 OR 22 OR 35 OR 48 OR 61 OR 74 OR 87
              MOVE WK-9 TO WK-CARD
           END-IF.
           IF WK-TIME = 10 OR 23 OR 36 OR 49 OR 62 OR 75 OR 88
              MOVE WK-10 TO WK-CARD
           END-IF.
           IF WK-TIME = 11 OR 24 OR 37 OR 50 OR 63 OR 76 OR 89
              MOVE WK-J TO WK-CARD
           END-IF.
           IF WK-TIME = 12 OR 25 OR 38 OR 51 OR 64 OR 77 OR 90
              MOVE WK-Q TO WK-CARD
           END-IF.
           IF WK-TIME = 13 OR 26 OR 39 OR 52 OR 65 OR 78 OR 91
              MOVE WK-K TO WK-CARD
           END-IF.
           IF WK-TIME = 00 OR > 92
              PERFORM SORT1
           END-IF.

       ENDSORT.

      *Sorting and displaying player and CPU cards

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


      *First bet placing

       BET.

           MOVE 0 TO WK-BET.
           DISPLAY "        " AT 1865.

           DISPLAY "Jackpot:" AT 0664 UNDERLINE.
           DISPLAY "First bet:" AT 1664 UNDERLINE.
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
           DISPLAY WK-JACKPOTSHOW AT 0764.

      *Discarding

           DISPLAY "Discard" AT 2008.
           DISPLAY "1       2       3       4       5" AT 2324.

       FIRSTDIS.

           MOVE 0 TO WK-DISCARD.
           ACCEPT WK-DISCARD AT 0101.
           EVALUATE WK-DISCARD
              WHEN "1"
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                 MOVE 1 TO WK-FIRSTDIS
              WHEN "2"
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                 MOVE 2 TO WK-FIRSTDIS
              WHEN "3"
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                 MOVE 3 TO WK-FIRSTDIS
              WHEN "4"
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                 MOVE 4 TO WK-FIRSTDIS
              WHEN "5"
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                 MOVE 5 TO WK-FIRSTDIS
              WHEN "0"
                 GO TO DISCARD
              WHEN OTHER
                 DISPLAY MESSAGE "Select a valid card"
                 GO TO FIRSTDIS
           END-EVALUATE.

       SECONDDIS.

           MOVE 0 TO WK-DISCARD.
           ACCEPT WK-DISCARD AT 0101.
           IF WK-DISCARD = WK-FIRSTDIS
              GO TO SECONDDIS
           END-IF.
           EVALUATE WK-DISCARD
              WHEN "1"
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                 MOVE 1 TO WK-SECONDDIS
              WHEN "2"
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                 MOVE 2 TO WK-SECONDDIS
              WHEN "3"
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                 MOVE 3 TO WK-SECONDDIS
              WHEN "4"
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                 MOVE 4 TO WK-SECONDDIS
              WHEN "5"
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                 MOVE 5 TO WK-SECONDDIS
              WHEN "0"
                 GO TO DISCARD
              WHEN OTHER
                 DISPLAY MESSAGE "Select a valid card"
                 GO TO SECONDDIS
           END-EVALUATE.

       THIRDDIS.

           MOVE 0 TO WK-DISCARD.
           ACCEPT WK-DISCARD AT 0101.
           IF WK-DISCARD = WK-FIRSTDIS OR WK-SECONDDIS
              GO TO THIRDDIS
           END-IF.
           EVALUATE WK-DISCARD
              WHEN "1"
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                 MOVE 1 TO WK-THIRDDIS
              WHEN "2"
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                 MOVE 2 TO WK-THIRDDIS
              WHEN "3"
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                 MOVE 3 TO WK-THIRDDIS
              WHEN "4"
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                 MOVE 4 TO WK-THIRDDIS
              WHEN "5"
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                 MOVE 5 TO WK-THIRDDIS
              WHEN "0"
                 GO TO DISCARD
              WHEN OTHER
                 DISPLAY MESSAGE "Select a valid card"
                 GO TO THIRDDIS
           END-EVALUATE.

       FOURTHDIS.

           MOVE 0 TO WK-DISCARD.
           ACCEPT WK-DISCARD AT 0101.
           IF WK-DISCARD = WK-FIRSTDIS OR WK-SECONDDIS OR WK-THIRDDIS
              GO TO FOURTHDIS
           END-IF.
           EVALUATE WK-DISCARD
              WHEN "1"
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                 MOVE 1 TO WK-FOURTHDIS
              WHEN "2"
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                 MOVE 2 TO WK-FOURTHDIS
              WHEN "3"
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                 MOVE 3 TO WK-FOURTHDIS
              WHEN "4"
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                 MOVE 4 TO WK-FOURTHDIS
              WHEN "5"
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                 MOVE 5 TO WK-FOURTHDIS
              WHEN "0"
                 GO TO DISCARD
              WHEN OTHER
                 DISPLAY MESSAGE "Select a valid card"
                 GO TO FOURTHDIS
           END-EVALUATE.

       FIFTHDIS.

           MOVE 0 TO WK-DISCARD.
           ACCEPT WK-DISCARD AT 0101.
           IF WK-DISCARD = WK-FIRSTDIS OR WK-SECONDDIS OR WK-THIRDDIS
                                                       OR WK-FOURTHDIS
              GO TO FIFTHDIS
           END-IF.
           EVALUATE WK-DISCARD
              WHEN "1"
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5 REVERSE
                 MOVE 1 TO WK-FIFTHDIS
              WHEN "2"
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5 REVERSE
                 MOVE 2 TO WK-FIFTHDIS
              WHEN "3"
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5 REVERSE
                 MOVE 3 TO WK-FIFTHDIS
              WHEN "4"
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5 REVERSE
                 MOVE 4 TO WK-FIFTHDIS
              WHEN "5"
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5 REVERSE
                 MOVE 5 TO WK-FIFTHDIS
              WHEN "0"
                 GO TO DISCARD
              WHEN OTHER
                 DISPLAY MESSAGE "Select a valid card"
                 GO TO FIFTHDIS
           END-EVALUATE.

       DISCARD.

           EVALUATE WK-FIRSTDIS
              WHEN "1"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD1
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5
                 DISPLAY WK-CARD1 AT 1923
              WHEN "2"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD2
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5
                 DISPLAY WK-CARD2 AT 1931
              WHEN "3"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD3
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5
                 DISPLAY WK-CARD3 AT 1939
              WHEN "4"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD4
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5
                 DISPLAY WK-CARD4 AT 1947
              WHEN "5"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD5
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5
                 DISPLAY WK-CARD5 AT 1955
           END-EVALUATE.

           EVALUATE WK-SECONDDIS
              WHEN "1"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD1
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5
                 DISPLAY WK-CARD1 AT 1923
              WHEN "2"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD2
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5
                 DISPLAY WK-CARD2 AT 1931
              WHEN "3"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD3
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5
                 DISPLAY WK-CARD3 AT 1939
              WHEN "4"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD4
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5
                 DISPLAY WK-CARD4 AT 1947
              WHEN "5"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD5
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5
                 DISPLAY WK-CARD5 AT 1955
           END-EVALUATE.

           EVALUATE WK-THIRDDIS
              WHEN "1"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD1
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5
                 DISPLAY WK-CARD1 AT 1923
              WHEN "2"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD2
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5
                 DISPLAY WK-CARD2 AT 1931
              WHEN "3"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD3
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5
                 DISPLAY WK-CARD3 AT 1939
              WHEN "4"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD4
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5
                 DISPLAY WK-CARD4 AT 1947
              WHEN "5"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD5
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5
                 DISPLAY WK-CARD5 AT 1955
           END-EVALUATE.

           EVALUATE WK-FOURTHDIS
              WHEN "1"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD1
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5
                 DISPLAY WK-CARD1 AT 1923
              WHEN "2"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD2
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5
                 DISPLAY WK-CARD2 AT 1931
              WHEN "3"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD3
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5
                 DISPLAY WK-CARD3 AT 1939
              WHEN "4"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD4
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5
                 DISPLAY WK-CARD4 AT 1947
              WHEN "5"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD5
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5
                 DISPLAY WK-CARD5 AT 1955
           END-EVALUATE.

           EVALUATE WK-FIFTHDIS
              WHEN "1"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD1
                 DISPLAY BOX AT 1822 SIZE 6 LINES 5
                 DISPLAY WK-CARD1 AT 1923
              WHEN "2"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD2
                 DISPLAY BOX AT 1830 SIZE 6 LINES 5
                 DISPLAY WK-CARD2 AT 1931
              WHEN "3"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD3
                 DISPLAY BOX AT 1838 SIZE 6 LINES 5
                 DISPLAY WK-CARD3 AT 1939
              WHEN "4"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD4
                 DISPLAY BOX AT 1846 SIZE 6 LINES 5
                 DISPLAY WK-CARD4 AT 1947
              WHEN "5"
                 PERFORM SORT1
                 MOVE WK-CARD TO WK-CARD5
                 DISPLAY BOX AT 1854 SIZE 6 LINES 5
                 DISPLAY WK-CARD5 AT 1955
           END-EVALUATE.

           DISPLAY "       " AT 2008.

      *Second bet placing

       BET2.

           MOVE 0 TO WK-BET.

           DISPLAY "Second bet:" AT 1664 UNDERLINE.
           DISPLAY "        " AT 1865.
           ACCEPT WK-BET AT 1865.
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
           DISPLAY WK-CARD1CPU AT 0523.
           DISPLAY WK-CARD2CPU AT 0531.
           DISPLAY WK-CARD3CPU AT 0539.
           DISPLAY WK-CARD4CPU AT 0547.
           DISPLAY WK-CARD5CPU AT 0555.

      *Player hand calculation

           IF WK-CARD1 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARD2 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARD3 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARD4 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.
           IF WK-CARD5 = "A"
              ADD 1 TO WK-APLAYS
           END-IF.


           IF WK-CARD1 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARD2 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARD3 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARD4 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.
           IF WK-CARD5 = "2"
              ADD 1 TO WK-2PLAYS
           END-IF.


           IF WK-CARD1 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARD2 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARD3 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARD4 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.
           IF WK-CARD5 = "3"
              ADD 1 TO WK-3PLAYS
           END-IF.


           IF WK-CARD1 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARD2 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARD3 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARD4 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.
           IF WK-CARD5 = "4"
              ADD 1 TO WK-4PLAYS
           END-IF.


           IF WK-CARD1 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARD2 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARD3 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARD4 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.
           IF WK-CARD5 = "5"
              ADD 1 TO WK-5PLAYS
           END-IF.


           IF WK-CARD1 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARD2 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARD3 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARD4 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.
           IF WK-CARD5 = "6"
              ADD 1 TO WK-6PLAYS
           END-IF.


           IF WK-CARD1 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARD2 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARD3 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARD4 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.
           IF WK-CARD5 = "7"
              ADD 1 TO WK-7PLAYS
           END-IF.


           IF WK-CARD1 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARD2 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARD3 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARD4 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.
           IF WK-CARD5 = "8"
              ADD 1 TO WK-8PLAYS
           END-IF.


           IF WK-CARD1 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARD2 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARD3 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARD4 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.
           IF WK-CARD5 = "9"
              ADD 1 TO WK-9PLAYS
           END-IF.


           IF WK-CARD1 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARD2 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARD3 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARD4 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.
           IF WK-CARD5 = "10"
              ADD 1 TO WK-10PLAYS
           END-IF.


           IF WK-CARD1 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARD2 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARD3 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARD4 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.
           IF WK-CARD5 = "J"
              ADD 1 TO WK-JPLAYS
           END-IF.


           IF WK-CARD1 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARD2 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARD3 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARD4 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.
           IF WK-CARD5 = "Q"
              ADD 1 TO WK-QPLAYS
           END-IF.


           IF WK-CARD1 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARD2 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARD3 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARD4 = "K"
              ADD 1 TO WK-KPLAYS
           END-IF.
           IF WK-CARD5 = "K"
              ADD 1 TO WK-KPLAYS
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
           IF WK-CARD3 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARD4 = "A"
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              GO TO STRAIGHT2
           END-IF.
           IF WK-CARD5 = "A"
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
           IF WK-CARD3 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARD4 = "2"
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              GO TO STRAIGHT3
           END-IF.
           IF WK-CARD5 = "2"
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
           IF WK-CARD3 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARD4 = "3"
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              GO TO STRAIGHT4
           END-IF.
           IF WK-CARD5 = "3"
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
           IF WK-CARD3 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARD4 = "4"
              ADD 1 TO WK-KTO4
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              GO TO STRAIGHT5
           END-IF.
           IF WK-CARD5 = "4"
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
           IF WK-CARD3 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARD4 = "5"
              ADD 1 TO WK-ATO5
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              GO TO STRAIGHT6
           END-IF.
           IF WK-CARD5 = "5"
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
           IF WK-CARD3 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARD4 = "6"
              ADD 1 TO WK-2TO6
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              GO TO STRAIGHT7
           END-IF.
           IF WK-CARD5 = "6"
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
           IF WK-CARD3 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARD4 = "7"
              ADD 1 TO WK-3TO7
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              GO TO STRAIGHT8
           END-IF.
           IF WK-CARD5 = "7"
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
           IF WK-CARD3 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARD4 = "8"
              ADD 1 TO WK-4TO8
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              GO TO STRAIGHT9
           END-IF.
           IF WK-CARD5 = "8"
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
           IF WK-CARD3 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARD4 = "9"
              ADD 1 TO WK-5TO9
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              GO TO STRAIGHT10
           END-IF.
           IF WK-CARD5 = "9"
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
           IF WK-CARD3 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARD4 = "10"
              ADD 1 TO WK-6TO10
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              GO TO STRAIGHTJ
           END-IF.
           IF WK-CARD5 = "10"
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
           IF WK-CARD3 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARD4 = "J"
              ADD 1 TO WK-7TOJ
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              GO TO STRAIGHTQ
           END-IF.
           IF WK-CARD5 = "J"
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
           IF WK-CARD3 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARD4 = "Q"
              ADD 1 TO WK-8TOQ
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              GO TO STRAIGHTK
           END-IF.
           IF WK-CARD5 = "Q"
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
           IF WK-CARD3 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARD4 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.
           IF WK-CARD5 = "K"
              ADD 1 TO WK-9TOK
              ADD 1 TO WK-10TOA
              ADD 1 TO WK-JTO2
              ADD 1 TO WK-QTO3
              ADD 1 TO WK-KTO4
              GO TO ENDSTRAIGHT
           END-IF.


       ENDSTRAIGHT.


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
           IF WK-CARD3CPU = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARD4CPU = "A"
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              GO TO STRAIGHTCPU2
           END-IF.
           IF WK-CARD5CPU = "A"
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
           IF WK-CARD3CPU = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARD4CPU = "2"
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              GO TO STRAIGHTCPU3
           END-IF.
           IF WK-CARD5CPU = "2"
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
           IF WK-CARD3CPU = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARD4CPU = "3"
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              GO TO STRAIGHTCPU4
           END-IF.
           IF WK-CARD5CPU = "3"
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
           IF WK-CARD3CPU = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARD4CPU = "4"
              ADD 1 TO WK-KTO4CPU
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              GO TO STRAIGHTCPU5
           END-IF.
           IF WK-CARD5CPU = "4"
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
           IF WK-CARD3CPU = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARD4CPU = "5"
              ADD 1 TO WK-ATO5CPU
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              GO TO STRAIGHTCPU6
           END-IF.
           IF WK-CARD5CPU = "5"
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
           IF WK-CARD3CPU = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARD4CPU = "6"
              ADD 1 TO WK-2TO6CPU
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              GO TO STRAIGHTCPU7
           END-IF.
           IF WK-CARD5CPU = "6"
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
           IF WK-CARD3CPU = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARD4CPU = "7"
              ADD 1 TO WK-3TO7CPU
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              GO TO STRAIGHTCPU8
           END-IF.
           IF WK-CARD5CPU = "7"
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
           IF WK-CARD3CPU = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARD4CPU = "8"
              ADD 1 TO WK-4TO8CPU
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              GO TO STRAIGHTCPU9
           END-IF.
           IF WK-CARD5CPU = "8"
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
           IF WK-CARD3CPU = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARD4CPU = "9"
              ADD 1 TO WK-5TO9CPU
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              GO TO STRAIGHTCPU10
           END-IF.
           IF WK-CARD5CPU = "9"
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
           IF WK-CARD3CPU = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARD4CPU = "10"
              ADD 1 TO WK-6TO10CPU
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              GO TO STRAIGHTCPUJ
           END-IF.
           IF WK-CARD5CPU = "10"
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
           IF WK-CARD3CPU = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARD4CPU = "J"
              ADD 1 TO WK-7TOJCPU
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              GO TO STRAIGHTCPUQ
           END-IF.
           IF WK-CARD5CPU = "J"
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
           IF WK-CARD3CPU = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARD4CPU = "Q"
              ADD 1 TO WK-8TOQCPU
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              GO TO STRAIGHTCPUK
           END-IF.
           IF WK-CARD5CPU = "Q"
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
           IF WK-CARD3CPU = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARD4CPU = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.
           IF WK-CARD5CPU = "K"
              ADD 1 TO WK-9TOKCPU
              ADD 1 TO WK-10TOACPU
              ADD 1 TO WK-JTO2CPU
              ADD 1 TO WK-QTO3CPU
              ADD 1 TO WK-KTO4CPU
              GO TO ENDSTRAIGHTCPU
           END-IF.

       ENDSTRAIGHTCPU.


      *CPU hand calculation


           IF WK-CARD1CPU = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "A"
              ADD 1 TO WK-APLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "2"
              ADD 1 TO WK-2PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "3"
              ADD 1 TO WK-3PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "4"
              ADD 1 TO WK-4PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "5"
              ADD 1 TO WK-5PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "6"
              ADD 1 TO WK-6PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "7"
              ADD 1 TO WK-7PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "8"
              ADD 1 TO WK-8PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "9"
              ADD 1 TO WK-9PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "10"
              ADD 1 TO WK-10PLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "J"
              ADD 1 TO WK-JPLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "Q"
              ADD 1 TO WK-QPLAYSCPU
           END-IF.


           IF WK-CARD1CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARD2CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARD3CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARD4CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.
           IF WK-CARD5CPU = "K"
              ADD 1 TO WK-KPLAYSCPU
           END-IF.


           DISPLAY "Player best hand:" AT 1902 UNDERLINE.


      *Player hand displaying

           IF WK-APLAYS = 5
              DISPLAY "Five of a kind (A)"
              ADD 243 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 5
              DISPLAY "Five of a kind (K)"
              ADD 242 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 5
              DISPLAY "Five of a kind (Q)"
              ADD 241 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 5
              DISPLAY "Five of a kind (J)"
              ADD 240 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 5
              DISPLAY "Five of a kind (10)"
              ADD 239 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 5
              DISPLAY "Five of a kind (9)"
              ADD 238 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 5
              DISPLAY "Five of a kind (8)"
              ADD 237 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 5
              DISPLAY "Five of a kind (7)"
              ADD 236 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 5
              DISPLAY "Five of a kind (6)"
              ADD 235 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 5
              DISPLAY "Five of a kind (5)"
              ADD 234 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 5
              DISPLAY "Five of a kind (4)"
              ADD 233 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 5
              DISPLAY "Five of a kind (3)"
              ADD 232 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 5
              DISPLAY "Five of a kind (2)"
              ADD 231 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 4
              DISPLAY "Four of a kind (A)"
              ADD 230 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 4
              DISPLAY "Four of a kind (K)"
              ADD 229 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 4
              DISPLAY "Four of a kind (Q)"
              ADD 228 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 4
              DISPLAY "Four of a kind (J)"
              ADD 227 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 4
              DISPLAY "Four of a kind (10)"
              ADD 226 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 4
              DISPLAY "Four of a kind (9)"
              ADD 225 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 4
              DISPLAY "Four of a kind (8)"
              ADD 224 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 4
              DISPLAY "Four of a kind (7)"
              ADD 223 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 4
              DISPLAY "Four of a kind (6)"
              ADD 222 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 4
              DISPLAY "Four of a kind (5)"
              ADD 221 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 4
              DISPLAY "Four of a kind (4)"
              ADD 220 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 4
              DISPLAY "Four of a kind (3)"
              ADD 219 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 4
              DISPLAY "Four of a kind (2)"
              ADD 218 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS + WK-KPLAYS = 5
              DISPLAY "Full house (A and K)"
              ADD 217 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (A and Q)"
              ADD 216 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (A and J)"
              ADD 215 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (A and 10)"
              ADD 214 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (A and 9)"
              ADD 213 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (A and 8)"
              ADD 212 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (A and 7)"
              ADD 211 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (A and 6)"
              ADD 210 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (A and 5)"
              ADD 209 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (A and 4)"
              ADD 208 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (A and 3)"
              ADD 207 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (A and 2)"
              ADD 206 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-KPLAYS + WK-QPLAYS = 5
              DISPLAY "Full house (K and Q)"
              ADD 205 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (K and J)"
              ADD 204 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (K and 10)"
              ADD 203 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (K and 9)"
              ADD 202 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (K and 8)"
              ADD 201 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (K and 7)"
              ADD 200 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (K and 6)"
              ADD 199 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (K and 5)"
              ADD 198 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (K and 4)"
              ADD 197 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (K and 3)"
              ADD 196 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (K and 2)"
              ADD 195 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 5
              DISPLAY "Full house (Q and J)"
              ADD 194 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (Q and 10)"
              ADD 193 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (Q and 9)"
              ADD 192 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (Q and 8)"
              ADD 191 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (Q and 7)"
              ADD 190 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (Q and 6)"
              ADD 189 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (Q and 5)"
              ADD 188 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (Q and 4)"
              ADD 187 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (Q and 3)"
              ADD 186 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (Q and 2)"
              ADD 185 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 5
              DISPLAY "Full house (J and 10)"
              ADD 184 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (J and 9)"
              ADD 183 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (J and 8)"
              ADD 182 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (J and 7)"
              ADD 181 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (J and 6)"
              ADD 180 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (J and 5)"
              ADD 179 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (J and 4)"
              ADD 178 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (J and 3)"
              ADD 177 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (J and 2)"
              ADD 176 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-9PLAYS = 5
              DISPLAY "Full house (10 and 9)"
              ADD 175 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (10 and 8)"
              ADD 174 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (10 and 7)"
              ADD 173 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (10 and 6)"
              ADD 172 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (10 and 5)"
              ADD 171 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (10 and 4)"
              ADD 170 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (10 and 3)"
              ADD 169 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (10 and 2)"
              ADD 168 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 5
              DISPLAY "Full house (9 and 8)"
              ADD 167 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (9 and 7)"
              ADD 166 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (9 and 6)"
              ADD 165 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (9 and 5)"
              ADD 164 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (9 and 4)"
              ADD 163 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (9 and 3)"
              ADD 162 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (9 and 2)"
              ADD 161 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 5
              DISPLAY "Full house (8 and 7)"
              ADD 160 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (8 and 6)"
              ADD 159 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (8 and 5)"
              ADD 158 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (8 and 4)"
              ADD 157 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (8 and 3)"
              ADD 156 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (8 and 2)"
              ADD 155 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 5
              DISPLAY "Full house (7 and 6)"
              ADD 154 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (7 and 5)"
              ADD 153 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (7 and 4)"
              ADD 152 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (7 and 3)"
              ADD 151 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (7 and 2)"
              ADD 150 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 5
              DISPLAY "Full house (6 and 5)"
              ADD 149 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (6 and 4)"
              ADD 148 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (6 and 3)"
              ADD 147 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (6 and 2)"
              ADD 146 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 5
              DISPLAY "Full house (5 and 4)"
              ADD 145 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (5 and 3)"
              ADD 144 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (5 and 2)"
              ADD 143 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 5
              DISPLAY "Full house (4 and 3)"
              ADD 142 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (4 and 2)"
              ADD 141 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS + WK-2PLAYS = 5
              DISPLAY "Full house (3 and 2)"
              ADD 140 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-ATO5 = 5
              DISPLAY "Straight (A to 5)"
              ADD 139 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2TO6 = 5
              DISPLAY "Straight (2 to 6)"
              ADD 138 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3TO7 = 5
              DISPLAY "Straight (3 to 7)"
              ADD 137 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4TO8 = 5
              DISPLAY "Straight (4 to 8)"
              ADD 136 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5TO9 = 5
              DISPLAY "Straight (5 to 9)"
              ADD 135 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6TO10 = 5
              DISPLAY "Straight (6 to 10)"
              ADD 134 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7TOJ = 5
              DISPLAY "Straight (7 to J)"
              ADD 133 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8TOQ = 5
              DISPLAY "Straight (8 to Q)"
              ADD 132 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9TOK = 5
              DISPLAY "Straight (9 to K)"
              ADD 131 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10TOA = 5
              DISPLAY "Straight (10 to A)"
              ADD 130 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JTO2 = 5
              DISPLAY "Straight (J to 2)"
              ADD 129 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QTO3 = 5
              DISPLAY "Straight (Q to 3)"
              ADD 128 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KTO4 = 5
              DISPLAY "Straight (K to 4)"
              ADD 127 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 3
              DISPLAY "Three of a kind (A)"
              ADD 126 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 3
              DISPLAY "Three of a kind (K)"
              ADD 125 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 3
              DISPLAY "Three of a kind (Q)"
              ADD 124 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 3
              DISPLAY "Three of a kind (J)"
              ADD 123 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 3
              DISPLAY "Three of a kind (10)"
              ADD 122 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 3
              DISPLAY "Three of a kind (9)"
              ADD 121 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 3
              DISPLAY "Three of a kind (8)"
              ADD 120 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 3
              DISPLAY "Three of a kind (7)"
              ADD 119 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 3
              DISPLAY "Three of a kind (6)"
              ADD 118 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 3
              DISPLAY "Three of a kind (5)"
              ADD 117 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 3
              DISPLAY "Three of a kind (4)"
              ADD 116 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 3
              DISPLAY "Three of a kind (3)"
              ADD 115 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 3
              DISPLAY "Three of a kind (3)"
              ADD 114 TO WK-PLAYERWINS
              GO TO GAMEOVER


           IF WK-APLAYS + WK-KPLAYS = 4
              DISPLAY "Two pairs (A and K)"
              ADD 113 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (A and Q)"
              ADD 112 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (A and J)"
              ADD 111 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (A and 10)"
              ADD 110 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (A and 9)"
              ADD 109 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (A and 8)"
              ADD 108 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (A and 7)"
              ADD 107 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (A and 6)"
              ADD 106 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (A and 5)"
              ADD 105 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (A and 4)"
              ADD 104 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (A and 3)"
              ADD 103 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-APLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (A and 2)"
              ADD 102 TO WK-PLAYERWINS
              GO TO GAMEOVER

           END-IF.
           IF WK-KPLAYS + WK-QPLAYS = 4
              DISPLAY "Two pairs (K and Q)"
              ADD 101 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (K and J)"
              ADD 100 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (K and 10)"
              ADD 99 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (K and 9)"
              ADD 98 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (K and 8)"
              ADD 97 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (K and 7)"
              ADD 96 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (K and 6)"
              ADD 95 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (K and 5)"
              ADD 94 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (K and 4)"
              ADD 93 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-3PLAYS = 4
               DISPLAY "Two pairs (K and 3)"
              ADD 92 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (K and 2)"
              ADD 91 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS + WK-JPLAYS = 4
              DISPLAY "Two pairs (Q and J)"
              ADD 90 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (Q and 10)"
              ADD 89 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (Q and 9)"
              ADD 88 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (Q and 8)"
              ADD 87 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (Q and 7)"
              ADD 86 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (Q and 6)"
              ADD 85 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (Q and 5)"
              ADD 84 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (Q and 4)"
              ADD 83 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (Q and 3)"
              ADD 82 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (Q and 2)"
              ADD 81 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              ADD 80 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              ADD 79 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              ADD 78 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              ADD 77 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              ADD 76 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              ADD 75 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              ADD 74 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (J and 3)"
              ADD 73 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              ADD 72 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-10PLAYS = 4
              DISPLAY "Two pairs (J and 10)"
              ADD 71 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (J and 9)"
              ADD 70 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (J and 8)"
              ADD 69 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (J and 7)"
              ADD 68 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (J and 6)"
              ADD 67 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (J and 5)"
              ADD 66 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (J and 4)"
              ADD 65 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (J and 3)"
              ADD 64 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (J and 2)"
              ADD 63 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS + WK-9PLAYS = 4
              DISPLAY "Two pairs (10 and 9)"
              ADD 62 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (10 and 8)"
              ADD 61 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (10 and 7)"
              ADD 60 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (10 and 6)"
              ADD 59 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (10 and 5)"
              ADD 58 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (10 and 4)"
              ADD 57 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (10 and 3)"
              ADD 56 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (10 and 2)"
              ADD 55 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS + WK-8PLAYS = 4
              DISPLAY "Two pairs (9 and 8)"
              ADD 54 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (9 and 7)"
              ADD 53 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (9 and 6)"
              ADD 52 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (9 and 5)"
              ADD 51 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (9 and 4)"
              ADD 50 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (9 and 3)"
              ADD 49 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (9 and 2)"
              ADD 48 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS + WK-7PLAYS = 4
              DISPLAY "Two pairs (8 and 7)"
              ADD 47 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (8 and 6)"
              ADD 46 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (8 and 5)"
              ADD 45 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (8 and 4)"
              ADD 44 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (8 and 3)"
              ADD 43 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (8 and 2)"
              ADD 42 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS + WK-6PLAYS = 4
              DISPLAY "Two pairs (7 and 6)"
              ADD 41 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (7 and 5)"
              ADD 40 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (7 and 4)"
              ADD 39 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (7 and 3)"
              ADD 38 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (7 and 2)"
              ADD 37 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS + WK-5PLAYS = 4
              DISPLAY "Two pairs (6 and 5)"
              ADD 36 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (6 and 4)"
              ADD 35 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (6 and 3)"
              ADD 34 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (6 and 2)"
              ADD 33 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS + WK-4PLAYS = 4
              DISPLAY "Two pairs (5 and 4)"
              ADD 32 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (5 and 3)"
              ADD 31 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (5 and 2)"
              ADD 30 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS + WK-3PLAYS = 4
              DISPLAY "Two pairs (4 and 3)"
              ADD 29 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (4 and 2)"
              ADD 28 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-3PLAYS + WK-2PLAYS = 4
              DISPLAY "Two pairs (3 and 2)"
              ADD 27 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 2
              DISPLAY "One pair (A)"
              ADD 26 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-KPLAYS = 2
              DISPLAY "One pair (K)"
              ADD 25 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-QPLAYS = 2
              DISPLAY "One pair (Q)"
              ADD 24 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-JPLAYS = 2
              DISPLAY "One pair (J)"
              ADD 23 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-10PLAYS = 2
              DISPLAY "One pair (10)"
              ADD 22 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-9PLAYS = 2
              DISPLAY "One pair (9)"
              ADD 21 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-8PLAYS = 2
              DISPLAY "One pair (8)"
              ADD 20 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-7PLAYS = 2
              DISPLAY "One pair (7)"
              ADD 19 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-6PLAYS = 2
              DISPLAY "One pair (6)"
              ADD 18 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-5PLAYS = 2
              DISPLAY "One pair (5)"
              ADD 17 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-4PLAYS = 2
              DISPLAY "One pair (4)"
              ADD 16 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-3PLAYS = 2
              DISPLAY "One pair (3)"
              ADD 15 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

           IF WK-2PLAYS = 2
              DISPLAY "One pair (2)"
              ADD 14 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.


           IF WK-APLAYS = 1
              DISPLAY "High card (A)"
              ADD 13 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-KPLAYS = 1
              DISPLAY "High card (K)"
              ADD 12 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-QPLAYS = 1
              DISPLAY "High card (Q)"
              ADD 11 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-JPLAYS = 1
              DISPLAY "High card (J)"
              ADD 10 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-10PLAYS = 1
              DISPLAY "High card (10)"
              ADD 9 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-9PLAYS = 1
              DISPLAY "High card (9)"
              ADD 8 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-8PLAYS = 1
              DISPLAY "High card (8)"
              ADD 7 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-7PLAYS = 1
              DISPLAY "High card (7)"
              ADD 6 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-6PLAYS = 1
              DISPLAY "High card (6)"
              ADD 5 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-5PLAYS = 1
              DISPLAY "High card (5)"
              ADD 4 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-4PLAYS = 1
              DISPLAY "High card (4)"
              ADD 3 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-3PLAYS = 1
              DISPLAY "High card (3)"
              ADD 2 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.
           IF WK-2PLAYS = 1
              DISPLAY "High card (2)"
              ADD 1 TO WK-PLAYERWINS
              GO TO GAMEOVER
           END-IF.

       GAMEOVER.



           DISPLAY "CPU best hand:" AT 0502 UNDERLINE.


      *CPU hand displaying

           IF WK-APLAYSCPU = 5
              DISPLAY "Five of a kind (A)"
              ADD 243 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 5
              DISPLAY "Five of a kind (K)"
              ADD 242 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 5
              DISPLAY "Five of a kind (Q)"
              ADD 241 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 5
              DISPLAY "Five of a kind (J)"
              ADD 240 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 5
              DISPLAY "Five of a kind (10)"
              ADD 239 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 5
              DISPLAY "Five of a kind (9)"
              ADD 238 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 5
              DISPLAY "Five of a kind (8)"
              ADD 237 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 5
              DISPLAY "Five of a kind (7)"
              ADD 236 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 5
              DISPLAY "Five of a kind (6)"
              ADD 235 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 5
              DISPLAY "Five of a kind (5)"
              ADD 234 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 5
              DISPLAY "Five of a kind (4)"
              ADD 233 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 5
              DISPLAY "Five of a kind (3)"
              ADD 232 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 5
              DISPLAY "Five of a kind (2)"
              ADD 231 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 4
              DISPLAY "Four of a kind (A)"
              ADD 230 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 4
              DISPLAY "Four of a kind (K)"
              ADD 229 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 4
              DISPLAY "Four of a kind (Q)"
              ADD 228 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 4
              DISPLAY "Four of a kind (J)"
              ADD 227 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 4
              DISPLAY "Four of a kind (10)"
              ADD 226 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 4
              DISPLAY "Four of a kind (9)"
              ADD 225 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 4
              DISPLAY "Four of a kind (8)"
              ADD 224 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 4
              DISPLAY "Four of a kind (7)"
              ADD 223 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 4
              DISPLAY "Four of a kind (6)"
              ADD 222 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 4
              DISPLAY "Four of a kind (5)"
              ADD 221 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 4
              DISPLAY "Four of a kind (4)"
              ADD 220 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 4
              DISPLAY "Four of a kind (3)"
              ADD 219 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 4
              DISPLAY "Four of a kind (2)"
              ADD 218 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU + WK-KPLAYSCPU = 5
              DISPLAY "Full house (A and K)"
              ADD 217 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-QPLAYSCPU = 5
              DISPLAY "Full house (A and Q)"
              ADD 216 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (A and J)"
              ADD 215 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (A and 10)"
              ADD 214 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (A and 9)"
              ADD 213 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (A and 8)"
              ADD 212 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (A and 7)"
              ADD 211 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (A and 6)"
              ADD 210 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (A and 5)"
              ADD 209 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (A and 4)"
              ADD 208 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (A and 3)"
              ADD 207 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (A and 2)"
              ADD 206 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-KPLAYSCPU + WK-QPLAYSCPU = 5
              DISPLAY "Full house (K and Q)"
              ADD 205 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (K and J)"
              ADD 204 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (K and 10)"
              ADD 203 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (K and 9)"
              ADD 202 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (K and 8)"
              ADD 201 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (K and 7)"
              ADD 200 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (K and 6)"
              ADD 199 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (K and 5)"
              ADD 198 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (K and 4)"
              ADD 197 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (K and 3)"
              ADD 196 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (K and 2)"
              ADD 195 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU + WK-JPLAYSCPU = 5
              DISPLAY "Full house (Q and J)"
              ADD 194 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (Q and 10)"
              ADD 193 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (Q and 9)"
              ADD 192 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (Q and 8)"
              ADD 191 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (Q and 7)"
              ADD 190 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (Q and 6)"
              ADD 189 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (Q and 5)"
              ADD 188 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (Q and 4)"
              ADD 187 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (Q and 3)"
              ADD 186 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (Q and 2)"
              ADD 185 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 5
              DISPLAY "Full house (J and 10)"
              ADD 184 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (J and 9)"
              ADD 183 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (J and 8)"
              ADD 182 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (J and 7)"
              ADD 181 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (J and 6)"
              ADD 180 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (J and 5)"
              ADD 179 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (J and 4)"
              ADD 178 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (J and 3)"
              ADD 177 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (J and 2)"
              ADD 176 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-9PLAYSCPU = 5
              DISPLAY "Full house (10 and 9)"
              ADD 175 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (10 and 8)"
              ADD 174 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (10 and 7)"
              ADD 173 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (10 and 6)"
              ADD 172 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (10 and 5)"
              ADD 171 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (10 and 4)"
              ADD 170 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (10 and 3)"
              ADD 169 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (10 and 2)"
              ADD 168 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU + WK-8PLAYSCPU = 5
              DISPLAY "Full house (9 and 8)"
              ADD 167 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (9 and 7)"
              ADD 166 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (9 and 6)"
              ADD 165 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (9 and 5)"
              ADD 164 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (9 and 4)"
              ADD 163 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (9 and 3)"
              ADD 162 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (9 and 2)"
              ADD 161 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU + WK-7PLAYSCPU = 5
              DISPLAY "Full house (8 and 7)"
              ADD 160 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (8 and 6)"
              ADD 159 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (8 and 5)"
              ADD 158 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (8 and 4)"
              ADD 157 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (8 and 3)"
              ADD 156 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (8 and 2)"
              ADD 155 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU + WK-6PLAYSCPU = 5
              DISPLAY "Full house (7 and 6)"
              ADD 154 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (7 and 5)"
              ADD 153 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (7 and 4)"
              ADD 152 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (7 and 3)"
              ADD 151 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (7 and 2)"
              ADD 150 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU + WK-5PLAYSCPU = 5
              DISPLAY "Full house (6 and 5)"
              ADD 149 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (6 and 4)"
              ADD 148 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (6 and 3)"
              ADD 147 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (6 and 2)"
              ADD 146 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU + WK-4PLAYSCPU = 5
              DISPLAY "Full house (5 and 4)"
              ADD 145 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (5 and 3)"
              ADD 144 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (5 and 2)"
              ADD 143 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU + WK-3PLAYSCPU = 5
              DISPLAY "Full house (4 and 3)"
              ADD 142 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (4 and 2)"
              ADD 141 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU + WK-2PLAYSCPU = 5
              DISPLAY "Full house (3 and 2)"
              ADD 140 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-ATO5 = 5
              DISPLAY "Straight (A to 5)"
              ADD 139 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2TO6 = 5
              DISPLAY "Straight (2 to 6)"
              ADD 138 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3TO7 = 5
              DISPLAY "Straight (3 to 7)"
              ADD 137 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4TO8 = 5
              DISPLAY "Straight (4 to 8)"
              ADD 136 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5TO9 = 5
              DISPLAY "Straight (5 to 9)"
              ADD 135 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6TO10 = 5
              DISPLAY "Straight (6 to 10)"
              ADD 134 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7TOJ = 5
              DISPLAY "Straight (7 to J)"
              ADD 133 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8TOQ = 5
              DISPLAY "Straight (8 to Q)"
              ADD 132 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9TOK = 5
              DISPLAY "Straight (9 to K)"
              ADD 131 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10TOA = 5
              DISPLAY "Straight (10 to A)"
              ADD 130 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JTO2 = 5
              DISPLAY "Straight (J to 2)"
              ADD 129 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QTO3 = 5
              DISPLAY "Straight (Q to 3)"
              ADD 128 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KTO4 = 5
              DISPLAY "Straight (K to 4)"
              ADD 127 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 3
              DISPLAY "Three of a kind (A)"
              ADD 126 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 3
              DISPLAY "Three of a kind (K)"
              ADD 125 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 3
              DISPLAY "Three of a kind (Q)"
              ADD 124 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 3
              DISPLAY "Three of a kind (J)"
              ADD 123 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 3
              DISPLAY "Three of a kind (10)"
              ADD 122 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 3
              DISPLAY "Three of a kind (9)"
              ADD 121 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 3
              DISPLAY "Three of a kind (8)"
              ADD 120 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 3
              DISPLAY "Three of a kind (7)"
              ADD 119 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 3
              DISPLAY "Three of a kind (6)"
              ADD 118 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 3
              DISPLAY "Three of a kind (5)"
              ADD 117 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 3
              DISPLAY "Three of a kind (4)"
              ADD 116 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 3
              DISPLAY "Three of a kind (3)"
              ADD 115 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 3
              DISPLAY "Three of a kind (3)"
              ADD 114 TO WK-CPUWINS
              GO TO GAMEOVERCPU


           IF WK-APLAYSCPU + WK-KPLAYSCPU = 4
              DISPLAY "Two pairs (A and K)"
              ADD 113 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-QPLAYSCPU = 4
              DISPLAY "Two pairs (A and Q)"
              ADD 112 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (A and J)"
              ADD 111 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (A and 10)"
              ADD 110 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (A and 9)"
              ADD 109 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (A and 8)"
              ADD 108 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (A and 7)"
              ADD 107 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (A and 6)"
              ADD 106 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (A and 5)"
              ADD 105 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (A and 4)"
              ADD 104 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-3PLAYSCPU = 4
               DISPLAY "Two pairs (A and 3)"
              ADD 103 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-APLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (A and 2)"
              ADD 102 TO WK-CPUWINS
              GO TO GAMEOVERCPU

           END-IF.
           IF WK-KPLAYSCPU + WK-QPLAYSCPU = 4
              DISPLAY "Two pairs (K and Q)"
              ADD 101 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (K and J)"
              ADD 100 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (K and 10)"
              ADD 99 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (K and 9)"
              ADD 98 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (K and 8)"
              ADD 97 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (K and 7)"
              ADD 96 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (K and 6)"
              ADD 95 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (K and 5)"
              ADD 94 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (K and 4)"
              ADD 93 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-3PLAYSCPU = 4
               DISPLAY "Two pairs (K and 3)"
              ADD 92 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (K and 2)"
              ADD 91 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU + WK-JPLAYSCPU = 4
              DISPLAY "Two pairs (Q and J)"
              ADD 90 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 10)"
              ADD 89 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 9)"
              ADD 88 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 8)"
              ADD 87 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 7)"
              ADD 86 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 6)"
              ADD 85 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 5)"
              ADD 84 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 4)"
              ADD 83 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 3)"
              ADD 82 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (Q and 2)"
              ADD 81 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (J and 10)"
              ADD 80 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (J and 9)"
              ADD 79 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (J and 8)"
              ADD 78 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (J and 7)"
              ADD 77 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (J and 6)"
              ADD 76 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (J and 5)"
              ADD 75 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (J and 4)"
              ADD 74 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (J and 3)"
              ADD 73 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (J and 2)"
              ADD 72 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-10PLAYSCPU = 4
              DISPLAY "Two pairs (J and 10)"
              ADD 71 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (J and 9)"
              ADD 70 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (J and 8)"
              ADD 69 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (J and 7)"
              ADD 68 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (J and 6)"
              ADD 67 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (J and 5)"
              ADD 66 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (J and 4)"
              ADD 65 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (J and 3)"
              ADD 64 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (J and 2)"
              ADD 63 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU + WK-9PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 9)"
              ADD 62 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 8)"
              ADD 61 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 7)"
              ADD 60 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 6)"
              ADD 59 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 5)"
              ADD 58 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 4)"
              ADD 57 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 3)"
              ADD 56 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (10 and 2)"
              ADD 55 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU + WK-8PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 8)"
              ADD 54 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 7)"
              ADD 53 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 6)"
              ADD 52 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 5)"
              ADD 51 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 4)"
              ADD 50 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 3)"
              ADD 49 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (9 and 2)"
              ADD 48 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU + WK-7PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 7)"
              ADD 47 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 6)"
              ADD 46 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 5)"
              ADD 45 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 4)"
              ADD 44 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 3)"
              ADD 43 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (8 and 2)"
              ADD 42 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU + WK-6PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 6)"
              ADD 41 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 5)"
              ADD 40 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 4)"
              ADD 39 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 3)"
              ADD 38 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (7 and 2)"
              ADD 37 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU + WK-5PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 5)"
              ADD 36 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 4)"
              ADD 35 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 3)"
              ADD 34 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (6 and 2)"
              ADD 33 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU + WK-4PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 4)"
              ADD 32 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 3)"
              ADD 31 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (5 and 2)"
              ADD 30 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU + WK-3PLAYSCPU = 4
              DISPLAY "Two pairs (4 and 3)"
              ADD 29 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (4 and 2)"
              ADD 28 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-3PLAYSCPU + WK-2PLAYSCPU = 4
              DISPLAY "Two pairs (3 and 2)"
              ADD 27 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 2
              DISPLAY "One pair (A)"
              ADD 26 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-KPLAYSCPU = 2
              DISPLAY "One pair (K)"
              ADD 25 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-QPLAYSCPU = 2
              DISPLAY "One pair (Q)"
              ADD 24 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-JPLAYSCPU = 2
              DISPLAY "One pair (J)"
              ADD 23 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-10PLAYSCPU = 2
              DISPLAY "One pair (10)"
              ADD 22 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-9PLAYSCPU = 2
              DISPLAY "One pair (9)"
              ADD 21 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-8PLAYSCPU = 2
              DISPLAY "One pair (8)"
              ADD 20 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-7PLAYSCPU = 2
              DISPLAY "One pair (7)"
              ADD 19 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-6PLAYSCPU = 2
              DISPLAY "One pair (6)"
              ADD 18 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-5PLAYSCPU = 2
              DISPLAY "One pair (5)"
              ADD 17 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-4PLAYSCPU = 2
              DISPLAY "One pair (4)"
              ADD 16 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-3PLAYSCPU = 2
              DISPLAY "One pair (3)"
              ADD 15 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

           IF WK-2PLAYSCPU = 2
              DISPLAY "One pair (2)"
              ADD 14 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.


           IF WK-APLAYSCPU = 1
              DISPLAY "High card (A)"
              ADD 13 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-KPLAYSCPU = 1
              DISPLAY "High card (K)"
              ADD 12 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-QPLAYSCPU = 1
              DISPLAY "High card (Q)"
              ADD 11 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-JPLAYSCPU = 1
              DISPLAY "High card (J)"
              ADD 10 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-10PLAYSCPU = 1
              DISPLAY "High card (10)"
              ADD 9 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-9PLAYSCPU = 1
              DISPLAY "High card (9)"
              ADD 8 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-8PLAYSCPU = 1
              DISPLAY "High card (8)"
              ADD 7 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-7PLAYSCPU = 1
              DISPLAY "High card (7)"
              ADD 6 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-6PLAYSCPU = 1
              DISPLAY "High card (6)"
              ADD 5 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-5PLAYSCPU = 1
              DISPLAY "High card (5)"
              ADD 4 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-4PLAYSCPU = 1
              DISPLAY "High card (4)"
              ADD 3 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-3PLAYSCPU = 1
              DISPLAY "High card (3)"
              ADD 2 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.
           IF WK-2PLAYSCPU = 1
              DISPLAY "High card (2)"
              ADD 1 TO WK-CPUWINS
              GO TO GAMEOVERCPU
           END-IF.

       GAMEOVERCPU.


           IF WK-PLAYERWINS = WK-CPUWINS
              DISPLAY "Game draw" AT 1336 REVERSE
           END-IF.

           IF WK-PLAYERWINS > WK-CPUWINS
              DISPLAY "Player Wins" AT 1735 REVERSE
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