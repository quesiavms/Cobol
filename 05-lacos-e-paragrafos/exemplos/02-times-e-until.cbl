      *-----------------------------------------------------------------
      * EXEMPLO 02 - PERFORM TIMES, UNTIL e o padrao leitura antecipada.
      * Entrada: varios numeros, terminando com 0.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIMESUNT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMERO        PIC 9(3).
          88 FIM-DA-ENTRADA            VALUE 0.
       01 WS-SOMA          PIC 9(5)    VALUE 0.
       01 WS-CONTADOR      PIC 9(3)    VALUE 0.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    1) TIMES: repete um numero fixo de vezes
           PERFORM MOSTRAR-LINHA 3 TIMES.

      *    2) UNTIL com leitura antecipada
           DISPLAY "DIGITE NUMEROS (0 PARA PARAR):".
           PERFORM LER-NUMERO.
           PERFORM SOMAR-E-LER UNTIL FIM-DA-ENTRADA.
           DISPLAY "VOCE DIGITOU " WS-CONTADOR " NUMEROS.".
           DISPLAY "SOMA: " WS-SOMA.

      *    3) WITH TEST AFTER: roda pelo menos uma vez, mesmo
      *       que a condicao ja comece verdadeira
           PERFORM MOSTRAR-LINHA WITH TEST AFTER
                   UNTIL WS-CONTADOR > 0.
           STOP RUN.

       MOSTRAR-LINHA.
           DISPLAY "------------------------------".

       LER-NUMERO.
           ACCEPT WS-NUMERO.

       SOMAR-E-LER.
           ADD WS-NUMERO TO WS-SOMA.
           ADD 1 TO WS-CONTADOR.
           PERFORM LER-NUMERO.
