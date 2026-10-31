      *-----------------------------------------------------------------
      * EXEMPLO 03 - ROUNDED, ON SIZE ERROR e o perigo do sinal.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXROUNDED.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESULTADO     PIC 9(3)V9.
       01 WS-PEQUENO       PIC 9(2).
       01 WS-SEM-SINAL     PIC 9(3).
       01 WS-COM-SINAL     PIC S9(3).
       01 WS-DIVISOR       PIC 9      VALUE 0.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    1) Truncar x arredondar: 20 / 3 = 6.666...
           DIVIDE 20 BY 3 GIVING WS-RESULTADO.
           DISPLAY "20 / 3 SEM ROUNDED.: " WS-RESULTADO.
           DIVIDE 20 BY 3 GIVING WS-RESULTADO ROUNDED.
           DISPLAY "20 / 3 COM ROUNDED.: " WS-RESULTADO.
           DISPLAY " ".

      *    2) Resultado que nao cabe: 50 * 3 = 150 em PIC 9(2)
           MULTIPLY 50 BY 3 GIVING WS-PEQUENO
               ON SIZE ERROR
                   DISPLAY "50 * 3 NAO CABE EM PIC 9(2)!"
               NOT ON SIZE ERROR
                   DISPLAY "50 * 3 = " WS-PEQUENO
           END-MULTIPLY.

      *    3) Divisao por zero tambem e SIZE ERROR
           DIVIDE 10 BY WS-DIVISOR GIVING WS-RESULTADO
               ON SIZE ERROR
                   DISPLAY "DIVISAO POR ZERO DETECTADA!"
           END-DIVIDE.
           DISPLAY " ".

      *    4) Sem o S, o sinal negativo se perde
           SUBTRACT 10 FROM 3 GIVING WS-SEM-SINAL.
           SUBTRACT 10 FROM 3 GIVING WS-COM-SINAL.
           DISPLAY "3 - 10 EM PIC 9(3)..: " WS-SEM-SINAL.
           DISPLAY "3 - 10 EM PIC S9(3).: " WS-COM-SINAL.
           STOP RUN.
