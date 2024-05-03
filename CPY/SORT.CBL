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
           IF WK-TIME = 00 OR >= 92
              PERFORM SORT1
           END-IF.