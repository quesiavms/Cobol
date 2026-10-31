      *-----------------------------------------------------------------
      * EXERCICIO 04 - Etiqueta de estoque
      * Aluno(a): ________________
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ETIQUETA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    TODO: variaveis de entrada (codigo, descricao, quantidade).
            01    WS-CODIGO         PIC 9(5).
            01    WS-DESCRICAO      PIC X(15).
            01    WS-QUANTIDADE     PIC X(4).

      *    TODO: o grupo WS-ETIQUETA, que e a linha inteira de saida.
      *    Dica: desenhe a linha num papel e marque o tamanho de cada
      *    pedaco antes de escrever as PICs.
            01 WS-ETIQUETA.
                  05    FILLER      PIC X(4)    VALUE "COD ".
                  05    WS-COD-ED   PIC 9(5).
                  05    FILLER      PIC X(3)    VALUE " | ".
                  05    WS-DESC     PIC X(15).
                  05    FILLER      PIC X(8)    VALUE " | QTD: ".
                  05    WS-QTD-ED   PIC Z,ZZZ. * quando usa Z, ele deixa colocar 0, quando usa 9, ele substitui ate os zeros por espaço

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    TODO: leia os dados, monte a etiqueta e exiba com 1 DISPLAY.
            DISPLAY "CODIGO: ".
            ACCEPT WS-CODIGO.
            
            DISPLAY "DESCRICAO: ".
            ACCEPT WS-DESCRICAO.

            DISPLAY "QUANTIDADE: ".
            ACCEPT WS-QUANTIDADE.

            MOVE WS-CODIGO TO WS-COD-ED.
            MOVE WS-DESCRICAO TO WS-DESC.
            MOVE WS-QUANTIDADE TO WS-QTD-ED.

            DISPLAY WS-ETIQUETA.

           STOP RUN.
