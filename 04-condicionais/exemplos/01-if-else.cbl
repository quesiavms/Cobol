      *-----------------------------------------------------------------
      * EXEMPLO 01 - IF/ELSE, operadores logicos e testes de classe.
      * Entrada: idade e se tem CNH (S/N).
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXIF.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ENTRADA       PIC X(3).
       01 WS-IDADE         PIC 9(3).
       01 WS-TEM-CNH       PIC X.

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "IDADE:".
           ACCEPT WS-ENTRADA.
           DISPLAY "TEM CNH (S/N)?".
           ACCEPT WS-TEM-CNH.

      *    1) Validando a entrada com teste de classe.
      *       FUNCTION TRIM tira os espacos para o teste funcionar
      *       mesmo quando o usuario digita menos de 3 digitos.
           IF FUNCTION TRIM(WS-ENTRADA) IS NOT NUMERIC
               DISPLAY "IDADE INVALIDA: DIGITE SO NUMEROS"
               STOP RUN
           END-IF.
           MOVE FUNCTION TRIM(WS-ENTRADA) TO WS-IDADE.

      *    2) IF / ELSE simples
           IF WS-IDADE >= 18
               DISPLAY "MAIOR DE IDADE"
           ELSE
               DISPLAY "MENOR DE IDADE"
           END-IF.

      *    3) Combinando condicoes com AND
           IF WS-IDADE >= 18 AND WS-TEM-CNH = "S"
               DISPLAY "PODE DIRIGIR"
           ELSE
               DISPLAY "NAO PODE DIRIGIR"
           END-IF.

      *    4) IF dentro de IF (aninhado)
           IF WS-IDADE >= 16
               IF WS-IDADE < 18 OR WS-IDADE > 70
                   DISPLAY "VOTO FACULTATIVO"
               ELSE
                   DISPLAY "VOTO OBRIGATORIO"
               END-IF
           ELSE
               DISPLAY "NAO VOTA"
           END-IF.
           STOP RUN.
