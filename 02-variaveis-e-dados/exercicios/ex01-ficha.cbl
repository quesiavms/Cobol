      *-----------------------------------------------------------------
      * EXERCICIO 01 - Ficha cadastral
      * Aluno(a): ________________
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FICHA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    TODO: declare aqui as variaveis para nome, idade e cidade.
            01 WS-NOME            PIC X(20).
            01 WS-IDADE           PIC 9(3).
            01 WS-CIDADE          PIC X(20).

      *    TODO: declare tambem uma variavel com mascara para a idade.
            01 WS-IDADE-ED     PIC ZZ9.


       PROCEDURE DIVISION.
       PRINCIPAL.
      *    TODO: peca e leia os tres dados.
            DISPLAY "DIGITE SEU NOME: "
            ACCEPT WS-NOME
            DISPLAY "DIGITE SUA IDADE: "
            ACCEPT WS-IDADE
            DISPLAY "DIGITE SUA CIDADE: "
            ACCEPT WS-CIDADE

            MOVE WS-IDADE TO WS-IDADE-ED.     

      *    TODO: exiba a ficha.
            DISPLAY "====== FICHA ======"
            DISPLAY "NOME..: " WS-NOME
            DISPLAY "IDADE.: " WS-IDADE-ED
            DISPLAY "CIDADE: " WS-CIDADE
           STOP RUN.
