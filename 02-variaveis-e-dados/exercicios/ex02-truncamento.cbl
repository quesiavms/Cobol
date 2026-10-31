      *-----------------------------------------------------------------
      * EXERCICIO 02 - Laboratorio de truncamento
      * NAO EXECUTE ANTES DE PREENCHER A TABELA DE PREVISOES!
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TRUNCA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    Origens
       01 WS-ORIGEM-1      PIC X(10)     VALUE "SAO PAULO".
       01 WS-ORIGEM-2      PIC 9(6)      VALUE 123456.
       01 WS-ORIGEM-3      PIC 9(4)V99   VALUE 1234.56.
       01 WS-ORIGEM-4      PIC 9(2)      VALUE 7.
       01 WS-ORIGEM-5      PIC S9(3)     VALUE -42.
       01 WS-ORIGEM-6      PIC X(3)      VALUE "ABC".
      *    Destinos (na Parte C, voce vai alterar so estas PICs)
       01 WS-DESTINO-1     PIC X(9).
       01 WS-DESTINO-2     PIC 9(6).
       01 WS-DESTINO-3     PIC 9(4)V99.
       01 WS-DESTINO-4     PIC 9(1).
       01 WS-DESTINO-5     PIC S9(2).
       01 WS-DESTINO-6     PIC X(3).

       PROCEDURE DIVISION.
       PRINCIPAL.
           MOVE WS-ORIGEM-1 TO WS-DESTINO-1.
           MOVE WS-ORIGEM-2 TO WS-DESTINO-2.
           MOVE WS-ORIGEM-3 TO WS-DESTINO-3.
           MOVE WS-ORIGEM-4 TO WS-DESTINO-4.
           MOVE WS-ORIGEM-5 TO WS-DESTINO-5.
           MOVE WS-ORIGEM-6 TO WS-DESTINO-6.

           DISPLAY "CASO 1: [" WS-DESTINO-1 "]".
           DISPLAY "CASO 2: [" WS-DESTINO-2 "]".
           DISPLAY "CASO 3: [" WS-DESTINO-3 "]".
           DISPLAY "CASO 4: [" WS-DESTINO-4 "]".
           DISPLAY "CASO 5: [" WS-DESTINO-5 "]".
           DISPLAY "CASO 6: [" WS-DESTINO-6 "]".
           STOP RUN.
