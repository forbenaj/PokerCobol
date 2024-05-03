       IDENTIFICATION DIVISION.
       PROGRAM-ID. Poker.
       SECURITY.   Open and Closed Poker game.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. PC.
       OBJECT-COMPUTER. PC.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL CONFIG
            ASSIGN TO
             "CPY\CONFIG.CFG"
             ORGANIZATION INDEXED
             ACCESS DYNAMIC
             RECORD FD-KEY.

       DATA DIVISION.
       FILE SECTION.
       FD CONFIG
           LABEL RECORD STANDARD.

       01 FD-CONFIG.
           02 FD-KEY.
               03 FD-OPTION PIC X(03).
           02 FD-MINIMUM PIC 9(04).

       WORKING-STORAGE SECTION.

       01 WK-PARA PIC X(01) VALUE SPACE.

       01 WK-PRESS PIC X.
       01 WK-ENTER PIC XXXX.
       01 WK-CHOOSE PIC 9.
       01 WK-CHEAT PIC X(09).
       01 WK-KEY PIC 9(02).
       01 WK-OUT PIC 9.

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

      *Table cards

       01 WK-CARDTABLE1 PIC X(02).
       01 WK-CARDTABLE2 PIC X(02).
       01 WK-CARDTABLE3 PIC X(02).
       01 WK-CARDTABLE4 PIC X(02).
       01 WK-CARDTABLE5 PIC X(02).

       01 WK-TIME PIC 99.

       01 WK-NONE PIC X.

       01 WK-PLAYERMONEY PIC 9(08).
       01 WK-PLAYERMONEYSHOW PIC $$$$$$$9.
       01 WK-BET PIC 9(08).
       01 WK-MINIMUM PIC 9(04).
       01 WK-JACKPOT PIC 9(08).
       01 WK-JACKPOTSHOW PIC $$$$$$$9.
       01 WK-JACKPOTDRAW PIC 9(08).

      *Player hand calculation

       01 WK-PLAYS.
           02 WK-APLAYS PIC 99.
           02 WK-2PLAYS PIC 99.
           02 WK-3PLAYS PIC 99.
           02 WK-4PLAYS PIC 99.
           02 WK-5PLAYS PIC 99.
           02 WK-6PLAYS PIC 99.
           02 WK-7PLAYS PIC 99.
           02 WK-8PLAYS PIC 99.
           02 WK-9PLAYS PIC 99.
           02 WK-10PLAYS PIC 99.
           02 WK-JPLAYS PIC 99.
           02 WK-QPLAYS PIC 99.
           02 WK-KPLAYS PIC 99.

       01 WK-STRAIGHT.
           02 WK-ATO5 PIC 9.
           02 WK-2TO6 PIC 9.
           02 WK-3TO7 PIC 9.
           02 WK-4TO8 PIC 9.
           02 WK-5TO9 PIC 9.
           02 WK-6TO10 PIC 9.
           02 WK-7TOJ PIC 9.
           02 WK-8TOQ PIC 9.
           02 WK-9TOK PIC 9.
           02 WK-10TOA PIC 9.
           02 WK-JTO2 PIC 9.
           02 WK-QTO3 PIC 9.
           02 WK-KTO4 PIC 9.

      *CPU hand calculation

       01 WK-PLAYSCPU.
           02 WK-APLAYSCPU PIC 99.
           02 WK-2PLAYSCPU PIC 99.
           02 WK-3PLAYSCPU PIC 99.
           02 WK-4PLAYSCPU PIC 99.
           02 WK-5PLAYSCPU PIC 99.
           02 WK-6PLAYSCPU PIC 99.
           02 WK-7PLAYSCPU PIC 99.
           02 WK-8PLAYSCPU PIC 99.
           02 WK-9PLAYSCPU PIC 99.
           02 WK-10PLAYSCPU PIC 99.
           02 WK-JPLAYSCPU PIC 99.
           02 WK-QPLAYSCPU PIC 99.
           02 WK-KPLAYSCPU PIC 99.

       01 WK-STRAIGHTCPU.
           02 WK-ATO5CPU PIC 9.
           02 WK-2TO6CPU PIC 9.
           02 WK-3TO7CPU PIC 9.
           02 WK-4TO8CPU PIC 9.
           02 WK-5TO9CPU PIC 9.
           02 WK-6TO10CPU PIC 9.
           02 WK-7TOJCPU PIC 9.
           02 WK-8TOQCPU PIC 9.
           02 WK-9TOKCPU PIC 9.
           02 WK-10TOACPU PIC 9.
           02 WK-JTO2CPU PIC 9.
           02 WK-QTO3CPU PIC 9.
           02 WK-KTO4CPU PIC 9.

       01  WK-WINNING.
           02 WK-PLAYERWINS PIC 999.
           02 WK-CPUWINS PIC 999.
           02 WK-PLAYERDRAW PIC 99.
           02 WK-CPUDRAW PIC 99.

       01 WK-DISCARD PIC 9.

       01 WK-CARDDIS.
          02 WK-FIRSTDIS PIC 9.
          02 WK-SECONDDIS PIC 9.
          02 WK-THIRDDIS PIC 9.
          02 WK-FOURTHDIS PIC 9.
          02 WK-FIFTHDIS PIC 9.

       01 TRIGGERS.
          02 TRIGGER1 PIC 9.
          02 TRIGGER2 PIC 9.
          02 TRIGGER3 PIC 9.
          02 TRIGGER4 PIC 9.
          02 TRIGGER5 PIC 9.

       01 WK-GAME PIC 9.
          88 HOLDEM VALUE 1.
          88 DRAWFIVE VALUE 2.
          88 CHEAT VALUE 3.

       LINKAGE SECTION.


       SCREEN SECTION.


       PROCEDURE DIVISION.

       SPLASH.

           COPY "CPY\SPLASH.CBL".

           ACCEPT WK-PRESS AT 0101.

           DISPLAY "Choose game" AT 0835 UNDERLINE ERASE.
           DISPLAY "1. Hold 'em" AT 1035.
           DISPLAY "2. Draw Five" AT 1135.
           DISPLAY "3. Settings" AT 1235.
           MOVE 1000 TO WK-PLAYERMONEY.
           MOVE "BID" TO FD-OPTION.
           OPEN I-O CONFIG.
           READ CONFIG.
           MOVE FD-MINIMUM TO WK-MINIMUM.


       CHOOSE.

           ACCEPT WK-CHOOSE.
           EVALUATE WK-CHOOSE
              WHEN "1" GO TO HOLDEM
              WHEN "2" GO TO DRAWFIVE
              WHEN "3" GO TO CONFIG
              WHEN "9" ACCEPT WK-CHEAT UPPER
                 IF WK-CHEAT ="ASPIRINE"
                    GO TO CHEAT
                 ELSE
                    CLOSE CONFIG
                    GO TO SPLASH
                 END-IF
              WHEN OTHER DISPLAY MESSAGE "Select a valid option"
                   GO TO CHOOSE
           END-EVALUATE.

       CONFIG.

           MOVE FD-MINIMUM TO WK-MINIMUM.

           DISPLAY " " ERASE.
           DISPLAY "Settings" AT 0202.
           DISPLAY "Bid: " AT 0404.
           ACCEPT WK-MINIMUM AT 0409 UPDATE.
           IF WK-MINIMUM >= 1000
              DISPLAY MESSAGE "Bid higher than minimum!"
              GO TO CONFIG
           END-IF.
           MOVE WK-MINIMUM TO FD-MINIMUM.
           REWRITE FD-CONFIG.
           CLOSE CONFIG.
           DISPLAY MESSAGE "Settings saved".
           GO TO SPLASH.

      *Main sorting

       SORT1.

           COPY "CPY\SORT.CBL".

       END-SORT1.

       HOLDEM.

           COPY "CPY\HOLDEM.CBL".

       DRAWFIVE.

           COPY "CPY\DRAWFIVE.CBL".

       CHEAT.

           COPY "CPY\CHEAT.CBL".

       RESULT.


           COPY "CPY\HANDS.CBL".
           COPY "CPY\RESULT.CBL".


       YOULOSE.

           DISPLAY " " ERASE.
           DISPLAY "Game Over" AT 1235.
           CLOSE CONFIG.
           ACCEPT WK-PARA.
           GO TO SPLASH.

           ACCEPT WK-PARA.
           GOBACK.