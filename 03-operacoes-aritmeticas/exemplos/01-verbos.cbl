      *-----------------------------------------------------------------
      * EXEMPLO 01 - Os verbos aritmeticos.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VERBOS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-A             PIC 9(3)    VALUE 17.
       01 WS-B             PIC 9(3)    VALUE 5.
       01 WS-TOTAL         PIC 9(4)    VALUE 100.
       01 WS-RESULTADO     PIC 9(4).
       01 WS-QUOCIENTE     PIC 9(3).
       01 WS-RESTO         PIC 9(3).

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "A = " WS-A "   B = " WS-B "   TOTAL = " WS-TOTAL.
           DISPLAY " ".

      *    TO acumula: TOTAL = TOTAL + A
           ADD WS-A TO WS-TOTAL.
           DISPLAY "ADD A TO TOTAL           -> TOTAL = " WS-TOTAL.

      *    GIVING substitui: RESULTADO = A + B
           ADD WS-A WS-B GIVING WS-RESULTADO.
           DISPLAY "ADD A B GIVING RESULTADO -> " WS-RESULTADO.

      *    SUBTRACT B FROM A = A - B
           SUBTRACT WS-B FROM WS-A GIVING WS-RESULTADO.
           DISPLAY "SUBTRACT B FROM A        -> " WS-RESULTADO.

           MULTIPLY WS-A BY WS-B GIVING WS-RESULTADO.
           DISPLAY "MULTIPLY A BY B          -> " WS-RESULTADO.

      *    Divisao inteira com resto: 17 / 5 = 3, resto 2
           DIVIDE WS-A BY WS-B GIVING WS-QUOCIENTE
                  REMAINDER WS-RESTO.
           DISPLAY "DIVIDE A BY B            -> " WS-QUOCIENTE
                   " RESTO " WS-RESTO.

      *    Atalho classico: contador
           ADD 1 TO WS-TOTAL.
           DISPLAY "ADD 1 TO TOTAL           -> TOTAL = " WS-TOTAL.
           STOP RUN.
