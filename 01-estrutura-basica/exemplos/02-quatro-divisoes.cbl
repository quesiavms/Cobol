      *-----------------------------------------------------------------
      * EXEMPLO 02 - As quatro divisoes de um programa COBOL.
      * Repare nas colunas: divisoes e paragrafos comecam na coluna 8
      * (Area A); comandos comecam na coluna 12 (Area B).
      *-----------------------------------------------------------------

      * 1) QUEM e o programa
       IDENTIFICATION DIVISION.
       PROGRAM-ID. QUATRODIV.

      * 2) ONDE ele roda (aqui ainda nao precisamos de nada)
       ENVIRONMENT DIVISION.

      * 3) QUAIS DADOS ele usa (veremos no modulo 02)
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-MENSAGEM    PIC X(30) VALUE "DADO GUARDADO NA MEMORIA".

      * 4) O QUE ele faz
       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "1 - IDENTIFICATION: o nome do programa".
           DISPLAY "2 - ENVIRONMENT...: o ambiente".
           DISPLAY "3 - DATA..........: " WS-MENSAGEM.
           DISPLAY "4 - PROCEDURE.....: estas instrucoes!".
           STOP RUN.
