# Módulo 04 — Condicionais (tomando decisões)

Até agora nossos programas faziam sempre a mesma coisa. Agora eles vão
**escolher** o caminho de acordo com os dados.

## 1. IF / ELSE / END-IF

```cobol
           IF WS-IDADE >= 18
               DISPLAY "MAIOR DE IDADE"
           ELSE
               DISPLAY "MENOR DE IDADE"
           END-IF.
```

- O `ELSE` é opcional.
- **Sempre** feche com `END-IF`. Ele mostra onde o `IF` acaba.
- Dentro do `IF`, **não** use ponto final! Um ponto no meio do `IF`
  encerra tudo de uma vez — é um bug clássico:

```cobol
      * ERRADO! O ponto depois do primeiro DISPLAY fecha o IF.
           IF WS-SALDO < 0
               DISPLAY "SALDO NEGATIVO".
               DISPLAY "BLOQUEANDO CONTA"     *> roda SEMPRE!
```

## 2. Operadores de comparação

Você pode escrever com símbolos ou por extenso:

| Símbolo | Por extenso |
|---|---|
| `=` | `EQUAL TO` |
| `>` | `GREATER THAN` |
| `<` | `LESS THAN` |
| `>=` | `GREATER THAN OR EQUAL TO` |
| `<=` | `LESS THAN OR EQUAL TO` |
| `NOT =` | `NOT EQUAL TO` |

## 3. Combinando condições: AND, OR, NOT

```cobol
           IF WS-IDADE >= 18 AND WS-TEM-CNH = "S"
               DISPLAY "PODE DIRIGIR"
           END-IF.

           IF WS-DIA = 1 OR WS-DIA = 7
               DISPLAY "FIM DE SEMANA"
           END-IF.
```

> Ordem: `NOT` primeiro, depois `AND`, depois `OR`.
> Na dúvida, **use parênteses**: `IF (A > 1 OR B > 1) AND C = 0`.

## 4. Testes de classe e de sinal

```cobol
           IF WS-ENTRADA IS NUMERIC        *> so tem digitos?
           IF WS-NOME IS ALPHABETIC        *> so letras e espacos?
           IF WS-SALDO IS POSITIVE         *> > 0
           IF WS-SALDO IS NEGATIVE         *> < 0
           IF WS-SALDO IS ZERO             *> = 0
```

O teste `NUMERIC` é muito usado para **validar** o que o usuário digitou
antes de fazer contas. Ele funciona também em **itens de grupo**
(verdadeiro se todos os caracteres do grupo forem dígitos).

> ⚠️ Pegadinha: se a variável é `PIC X(3)` e o usuário digita `42`,
> ela guarda `"42 "` — e o **espaço** faz o teste `NUMERIC` falhar!
> O exemplo 01 mostra como resolver com `FUNCTION TRIM(...)`, que
> remove os espaços das pontas.

## 5. Nível 88 — nomes para condições

O nível 88 dá um **nome** a um valor (ou faixa de valores) de uma
variável. O código fica parecendo uma frase:

```cobol
       01 WS-ESTADO-CIVIL    PIC X.
          88 SOLTEIRO        VALUE "S".
          88 CASADO          VALUE "C".
          88 VALIDO          VALUE "S" "C" "D" "V".

       01 WS-NOTA            PIC 99.
          88 APROVADO        VALUE 60 THRU 99.
          88 REPROVADO       VALUE 0 THRU 59.
       ...
           IF CASADO
               DISPLAY "CASADO(A)"
           END-IF.

           IF NOT VALIDO
               DISPLAY "ESTADO CIVIL INVALIDO"
           END-IF.

           SET APROVADO TO TRUE.     *> coloca 60 em WS-NOTA
```

- O 88 **não ocupa memória**: ele só "olha" a variável de cima.
- `VALUE "S" "C"` → vários valores. `VALUE 60 THRU 99` → uma faixa.
- `SET nome-88 TO TRUE` move o (primeiro) valor para a variável.

## 6. EVALUATE — o "escolha um caso"

Quando há **muitos** caminhos, uma escada de `IF`s fica confusa.
O `EVALUATE` resolve:

```cobol
           EVALUATE WS-OPCAO
               WHEN 1
                   DISPLAY "INCLUIR"
               WHEN 2
                   DISPLAY "ALTERAR"
               WHEN 3 THRU 5
                   DISPLAY "CONSULTAS"
               WHEN OTHER
                   DISPLAY "OPCAO INVALIDA"
           END-EVALUATE.
```

A forma `EVALUATE TRUE` aceita **qualquer condição** em cada `WHEN`:

```cobol
           EVALUATE TRUE
               WHEN WS-TEMPERATURA < 0
                   DISPLAY "CONGELANDO"
               WHEN WS-TEMPERATURA < 25
                   DISPLAY "AGRADAVEL"
               WHEN OTHER
                   DISPLAY "CALOR"
           END-EVALUATE.
```

- O COBOL testa os `WHEN` **de cima para baixo** e executa **só o primeiro**
  que for verdadeiro. A ordem importa!
- `WHEN OTHER` = "nenhum dos anteriores". Coloque sempre.

---

## Exemplos desta pasta

| Arquivo | O que mostra |
|---|---|
| [01-if-else.cbl](exemplos/01-if-else.cbl) | `IF`, `ELSE`, `AND`/`OR`, testes de classe e sinal |
| [02-nivel-88.cbl](exemplos/02-nivel-88.cbl) | Condições com nome (nível 88) e `SET` |
| [03-evaluate.cbl](exemplos/03-evaluate.cbl) | `EVALUATE` com valor, com `THRU` e com `TRUE` |

Experimente rodar com entradas diferentes:

```bash
printf "17\nS\n" | ./rodar.sh 04-condicionais/exemplos/01-if-else.cbl
printf "25\nN\n" | ./rodar.sh 04-condicionais/exemplos/01-if-else.cbl
printf "ABC\nS\n" | ./rodar.sh 04-condicionais/exemplos/01-if-else.cbl
```

➡️ Depois, vá para os [exercícios](exercicios/README.md).
