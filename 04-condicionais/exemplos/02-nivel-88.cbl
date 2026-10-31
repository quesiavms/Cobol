      *-----------------------------------------------------------------
      * EXEMPLO 02 - Nivel 88: condicoes com nome.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX88.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SEMAFORO      PIC X       VALUE "A".
          88 VERDE                     VALUE "V".
          88 AMARELO                   VALUE "A".
          88 VERMELHO                  VALUE "R".

       01 WS-MES           PIC 99      VALUE 7.
          88 MES-VALIDO                VALUE 1 THRU 12.
          88 FERIAS-ESCOLARES          VALUE 1 7 12.

       PROCEDURE DIVISION.
       PRINCIPAL.
      *    Testando o 88: le como uma frase em ingles/portugues
           IF AMARELO
               DISPLAY "SEMAFORO AMARELO: ATENCAO!"
           END-IF.

      *    SET ... TO TRUE muda o valor da variavel "mae"
           SET VERMELHO TO TRUE.
           DISPLAY "DEPOIS DO SET, WS-SEMAFORO = " WS-SEMAFORO.
           IF VERMELHO
               DISPLAY "PARE!"
           END-IF.

      *    88 com varios valores e com faixa
           IF MES-VALIDO AND FERIAS-ESCOLARES
               DISPLAY "MES " WS-MES ": FERIAS ESCOLARES"
           END-IF.

           MOVE 13 TO WS-MES.
           IF NOT MES-VALIDO
               DISPLAY "MES " WS-MES ": NAO EXISTE"
           END-IF.
           STOP RUN.
