      *-----------------------------------------------------------------
      * EXEMPLO 02 - MOVE, constantes figurativas e truncamento.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXMOVE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TEXTO-GRANDE  PIC X(15)  VALUE "PROGRAMACAO".
       01 WS-TEXTO-PEQUENO PIC X(5).
       01 WS-NUM-GRANDE    PIC 9(5)   VALUE 98765.
       01 WS-NUM-PEQUENO   PIC 9(3).
       01 WS-NUM-DECIMAL   PIC 9(3)V99 VALUE 123.45.
       01 WS-NUM-INTEIRO   PIC 9(3).

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    1) Texto grande em caixa pequena: corta a DIREITA
           MOVE WS-TEXTO-GRANDE TO WS-TEXTO-PEQUENO.
           DISPLAY "TEXTO  [" WS-TEXTO-GRANDE "] -> ["
                   WS-TEXTO-PEQUENO "]".

      *    2) Numero grande em caixa pequena: corta a ESQUERDA
           MOVE WS-NUM-GRANDE TO WS-NUM-PEQUENO.
           DISPLAY "NUMERO [" WS-NUM-GRANDE "] -> ["
                   WS-NUM-PEQUENO "]".

      *    3) Decimal para inteiro: as casas decimais somem
           MOVE WS-NUM-DECIMAL TO WS-NUM-INTEIRO.
           DISPLAY "DECIMAL[" WS-NUM-DECIMAL "] -> ["
                   WS-NUM-INTEIRO "]".

      *    4) Constantes figurativas
           MOVE SPACES TO WS-TEXTO-PEQUENO.
           MOVE ZEROS  TO WS-NUM-PEQUENO.
           DISPLAY "SPACES -> [" WS-TEXTO-PEQUENO "]".
           DISPLAY "ZEROS  -> [" WS-NUM-PEQUENO "]".

      *    5) Um MOVE pode ter varios destinos
           MOVE "OK" TO WS-TEXTO-PEQUENO WS-TEXTO-GRANDE.
           DISPLAY "VARIOS -> [" WS-TEXTO-PEQUENO "] ["
                   WS-TEXTO-GRANDE "]".
           STOP RUN.
