      *-----------------------------------------------------------------
      * EXEMPLO 02 - Formulas com COMPUTE.
      * Calcula a area de um circulo e a media de tres notas.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXCOMPUTE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-PI            PIC 9V9(5)   VALUE 3.14159.
       01 WS-RAIO          PIC 9(3)     VALUE 10.
       01 WS-AREA          PIC 9(6)V99.
       01 WS-AREA-ED       PIC ZZZ,ZZ9.99.

       01 WS-NOTA-1        PIC 99V9     VALUE 7.5.
       01 WS-NOTA-2        PIC 99V9     VALUE 8.0.
       01 WS-NOTA-3        PIC 99V9     VALUE 6.0.
       01 WS-MEDIA         PIC 99V99.
       01 WS-MEDIA-ED      PIC Z9.99.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    Potencia com **  (area = pi * r ao quadrado)
           COMPUTE WS-AREA = WS-PI * WS-RAIO ** 2.
           MOVE WS-AREA TO WS-AREA-ED.
           DISPLAY "AREA DO CIRCULO (R=10): " WS-AREA-ED.

      *    Parenteses mudam a ordem das operacoes
           COMPUTE WS-MEDIA ROUNDED =
                   (WS-NOTA-1 + WS-NOTA-2 + WS-NOTA-3) / 3.
           MOVE WS-MEDIA TO WS-MEDIA-ED.
           DISPLAY "MEDIA DAS NOTAS........: " WS-MEDIA-ED.

      *    Sem os parenteses, so a NOTA-3 seria dividida por 3!
           COMPUTE WS-MEDIA ROUNDED =
                   WS-NOTA-1 + WS-NOTA-2 + WS-NOTA-3 / 3.
           MOVE WS-MEDIA TO WS-MEDIA-ED.
           DISPLAY "SEM PARENTESES (ERRADO): " WS-MEDIA-ED.
           STOP RUN.
