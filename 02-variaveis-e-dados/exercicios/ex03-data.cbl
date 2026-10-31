      *-----------------------------------------------------------------
      * EXERCICIO 03 - Desmontando uma data
      * Aluno(a): ________________
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DATAS.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    TODO: grupo de ENTRADA (AAAAMMDD) com ano, mes e dia.
            01    WS-DATA.
                        05    WS-ANO      PIC 9(4).
                        05    WS-MES      PIC 9(2).
                        05    WS-DIA      PIC 9(2).

      *    TODO: grupo de SAIDA (DD/MM/AAAA), com FILLER nas barras.
            01    WS-OUTPUT-DATA.
                        05    WS-DIA-ED   PIC 9(2). * nao posso simplesmente colocar WS-DIA (referenciando o de cima) -> cada bloco no cobol, é um espaco de memoria diferente
                        05    FILLER      PIC X(1)    VALUE "/".
                        05    WS-MES-ED   PIC 9(2).
                        05    FILLER      PIC X(1)    VALUE "/".
                        05    WS-ANO-ED   PIC 9(4).
                        


       PROCEDURE DIVISION.
       PRINCIPAL.
      *    TODO: leia a data, mostre as partes e a data formatada.
            DISPLAY "DIGITE A DATA (AAAAMMDD): ". *20261028 - ele vai separando os valores dentro dos limites das variaveis do grupo
            ACCEPT WS-DATA.

            DISPLAY "DIA: " WS-DIA. *28
            DISPLAY "MES: " WS-MES. *10
            DISPLAY "ANO: " WS-ANO. *2026
                      

            MOVE WS-ANO TO WS-ANO-ED.
            MOVE WS-MES TO WS-MES-ED.
            MOVE WS-DIA TO WS-DIA-ED.

            DISPLAY "DATA FORMATADA: " WS-OUTPUT-DATA.
           STOP RUN.
