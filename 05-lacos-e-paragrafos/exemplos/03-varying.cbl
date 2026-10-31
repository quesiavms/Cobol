      *-----------------------------------------------------------------
      * EXEMPLO 03 - PERFORM VARYING: o laco com contador.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. VARYING1.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-I             PIC S9(3).
       01 WS-J             PIC 9(2).
       01 WS-I-ED          PIC ZZ9.
       01 WS-PRODUTO       PIC 9(3).
       01 WS-PRODUTO-ED    PIC ZZ9.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    1) Contando de 1 a 5 (PERFORM de paragrafo)
           DISPLAY "DE 1 A 5:".
           PERFORM MOSTRAR-I VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5.

      *    2) Contagem regressiva de 20 a 0, de 5 em 5 (inline)
           DISPLAY "REGRESSIVA:".
           PERFORM VARYING WS-I FROM 20 BY -5 UNTIL WS-I < 0
               MOVE WS-I TO WS-I-ED
               DISPLAY WS-I-ED
           END-PERFORM.

      *    3) Lacos aninhados: uma mini tabela de multiplicar 3x3
           DISPLAY "TABELA 3X3:".
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 3
               PERFORM VARYING WS-J FROM 1 BY 1 UNTIL WS-J > 3
                   MULTIPLY WS-I BY WS-J GIVING WS-PRODUTO
                   MOVE WS-PRODUTO TO WS-PRODUTO-ED
                   DISPLAY WS-PRODUTO-ED WITH NO ADVANCING
               END-PERFORM
               DISPLAY " "
           END-PERFORM.
           STOP RUN.

       MOSTRAR-I.
           MOVE WS-I TO WS-I-ED.
           DISPLAY WS-I-ED.
