      *-----------------------------------------------------------------
      * EXEMPLO 03 - Formas diferentes de usar o DISPLAY.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXDISPLAY.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    Um texto simples
           DISPLAY "LINHA SIMPLES".

      *    Varios textos no mesmo DISPLAY: saem colados
           DISPLAY "COBOL " "E " "LEGAL".

      *    Linha em branco
           DISPLAY " ".

      *    Sem pular linha no final
           DISPLAY "CONTANDO: " WITH NO ADVANCING.
           DISPLAY "1 " WITH NO ADVANCING.
           DISPLAY "2 " WITH NO ADVANCING.
           DISPLAY "3".

      *    Comentario no fim da linha (estilo moderno, com *>)
           DISPLAY "FIM DO EXEMPLO". *> isto o compilador ignora

           STOP RUN.
