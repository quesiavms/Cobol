      *-----------------------------------------------------------------
      * EXEMPLO 01 - Paragrafos e a estrutura classica de um programa.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PARAGRAF.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-TOTAL         PIC 9(3)    VALUE 0.

       PROCEDURE DIVISION.
      *-----------------------------------------------------------------
      * O paragrafo principal funciona como um INDICE do programa.
      *-----------------------------------------------------------------
       PRINCIPAL.
           PERFORM INICIALIZAR.
           PERFORM PROCESSAR.
           PERFORM PROCESSAR.
           PERFORM FINALIZAR.
      *    Experimente apagar o STOP RUN abaixo e rodar de novo!
           STOP RUN.

       INICIALIZAR.
           DISPLAY "== INICIO DO PROGRAMA ==".
           MOVE 0 TO WS-TOTAL.

       PROCESSAR.
           ADD 10 TO WS-TOTAL.
           DISPLAY "PROCESSANDO... TOTAL ATUAL: " WS-TOTAL.

       FINALIZAR.
           DISPLAY "TOTAL FINAL: " WS-TOTAL.
           DISPLAY "== FIM DO PROGRAMA ==".
