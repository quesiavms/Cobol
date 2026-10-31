      *-----------------------------------------------------------------
      * EXEMPLO 01 - Os tipos basicos da clausula PIC.
      * Os colchetes [ ] no DISPLAY ajudam a ver o tamanho real.
      *-----------------------------------------------------------------
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TIPOSPIC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    Numerico: so digitos
       01 WS-QUANTIDADE    PIC 9(4)       VALUE 42.
      *    Alfanumerico: qualquer caractere
       01 WS-PRODUTO       PIC X(12)      VALUE "CANETA AZUL".
      *    Alfabetico: so letras e espacos
       01 WS-COR           PIC A(8)       VALUE "VERDE".
      *    Decimal: V marca a virgula imaginaria
       01 WS-PRECO         PIC 9(3)V99    VALUE 7.5.
      *    Com sinal: S permite negativos
       01 WS-SALDO         PIC S9(4)      VALUE -150.
      *    Variavel "solta", nivel 77
       77 WS-CONTADOR      PIC 99         VALUE 3.

       PROCEDURE DIVISION.
       PRINCIPAL.
           DISPLAY "PIC 9(4)     -> [" WS-QUANTIDADE "]".
           DISPLAY "PIC X(12)    -> [" WS-PRODUTO "]".
           DISPLAY "PIC A(8)     -> [" WS-COR "]".
           DISPLAY "PIC 9(3)V99  -> [" WS-PRECO "]".
           DISPLAY "PIC S9(4)    -> [" WS-SALDO "]".
           DISPLAY "77 PIC 99    -> [" WS-CONTADOR "]".
           DISPLAY " ".
           DISPLAY "REPARE: zeros a esquerda nos numeros e espacos".
           DISPLAY "a direita nos textos. O tamanho e sempre fixo!".
           STOP RUN.
