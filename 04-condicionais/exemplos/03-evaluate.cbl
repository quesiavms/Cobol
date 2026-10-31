      *-----------------------------------------------------------------
      * EXEMPLO 03 - EVALUATE: escolhendo entre muitos caminhos.
      * Entrada: um numero de opcao e uma temperatura.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXEVAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-OPCAO         PIC 9.
       01 WS-TEMPERATURA   PIC S99.

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "OPCAO DO MENU (0-9):".
           ACCEPT WS-OPCAO.
           DISPLAY "TEMPERATURA:".
           ACCEPT WS-TEMPERATURA.

      *    1) EVALUATE de uma variavel, com valores e faixas
           EVALUATE WS-OPCAO
               WHEN 1
                   DISPLAY "VOCE ESCOLHEU: INCLUIR"
               WHEN 2
                   DISPLAY "VOCE ESCOLHEU: ALTERAR"
               WHEN 3 THRU 5
                   DISPLAY "VOCE ESCOLHEU: UMA CONSULTA"
               WHEN 0
                   DISPLAY "VOCE ESCOLHEU: SAIR"
               WHEN OTHER
                   DISPLAY "OPCAO INVALIDA"
           END-EVALUATE.

      *    2) EVALUATE TRUE: cada WHEN e uma condicao.
      *       So o PRIMEIRO WHEN verdadeiro e executado.
           EVALUATE TRUE
               WHEN WS-TEMPERATURA < 0
                   DISPLAY "CONGELANDO"
               WHEN WS-TEMPERATURA < 18
                   DISPLAY "FRIO"
               WHEN WS-TEMPERATURA < 28
                   DISPLAY "AGRADAVEL"
               WHEN OTHER
                   DISPLAY "CALOR"
           END-EVALUATE.
           STOP RUN.
