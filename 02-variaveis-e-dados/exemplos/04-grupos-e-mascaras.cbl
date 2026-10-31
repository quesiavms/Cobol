      *-----------------------------------------------------------------
      * EXEMPLO 04 - Itens de grupo, FILLER e mascaras de edicao.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXGRUPO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    Um grupo: o "registro" de um produto
       01 WS-PRODUTO.
          05 WS-CODIGO       PIC 9(4)      VALUE 17.
          05 WS-DESCRICAO    PIC X(15)     VALUE "TECLADO USB".
          05 WS-PRECO        PIC 9(5)V99   VALUE 1249.9.
          05 WS-ESTOQUE      PIC S9(4)     VALUE -3.

      *    Uma linha de relatorio montada com FILLER
       01 WS-LINHA.
          05 FILLER          PIC X(4)      VALUE "COD ".
          05 WS-COD-ED       PIC ZZZ9.
          05 FILLER          PIC X(3)      VALUE " - ".
          05 WS-DESC-ED      PIC X(15).
          05 FILLER          PIC X(4)      VALUE " R$ ".
          05 WS-PRECO-ED     PIC ZZ,ZZ9.99.
          05 FILLER          PIC X(8)      VALUE " ESTQ: ".
          05 WS-ESTQ-ED      PIC ---9.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    O grupo inteiro e visto como um texto grande.
      *    Curiosidade: o ultimo caractere sai "estranho" porque o
      *    sinal negativo de WS-ESTOQUE fica embutido no ultimo digito.
      *    Mais um motivo para usar mascaras ao exibir numeros!
           DISPLAY "GRUPO CRU: [" WS-PRODUTO "]".
           DISPLAY " ".

      *    Movendo cada campo para sua mascara
           MOVE WS-CODIGO    TO WS-COD-ED.
           MOVE WS-DESCRICAO TO WS-DESC-ED.
           MOVE WS-PRECO     TO WS-PRECO-ED.
           MOVE WS-ESTOQUE   TO WS-ESTQ-ED.
           DISPLAY "FORMATADO: [" WS-LINHA "]".
           STOP RUN.
