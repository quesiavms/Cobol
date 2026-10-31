      *-----------------------------------------------------------------
      * EXEMPLO 03 - Lendo dados com ACCEPT.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXACCEPT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NOME          PIC X(20).
       01 WS-IDADE         PIC 9(3).
       01 WS-HOJE          PIC 9(8).
       01 WS-HOJE-ED       PIC 9999/99/99.

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "QUAL O SEU NOME?".
           ACCEPT WS-NOME.

           DISPLAY "QUANTOS ANOS VOCE TEM?".
           ACCEPT WS-IDADE.

      *    Data do sistema, no formato AAAAMMDD
           ACCEPT WS-HOJE FROM DATE YYYYMMDD.
          
          MOVE WS-HOJE TO WS-HOJE-ED.
      *    Repare nos espacos antes do "!": WS-NOME tem SEMPRE
      *    20 posicoes, mesmo que o nome digitado seja curto.
           DISPLAY "OLA, " WS-NOME "!".
           DISPLAY "IDADE GUARDADA: " WS-IDADE.
           DISPLAY "DATA DE HOJE (AAAAMMDD): " WS-HOJE-ED.
           STOP RUN.
