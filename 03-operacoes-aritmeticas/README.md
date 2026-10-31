# Módulo 03 — Operações aritméticas

COBOL foi feito para **dinheiro**. Por isso, ele faz contas com números
decimais **exatos** (sem os errinhos de arredondamento de `float`
que outras linguagens têm). Há dois estilos de fazer conta:

1. **Verbos em inglês:** `ADD`, `SUBTRACT`, `MULTIPLY`, `DIVIDE`
2. **Fórmula:** `COMPUTE`

## 1. ADD — somar

```cobol
           ADD 1 TO WS-CONTADOR.                  *> CONTADOR = CONTADOR + 1
           ADD WS-A WS-B TO WS-TOTAL.             *> TOTAL = TOTAL + A + B
           ADD WS-A WS-B GIVING WS-TOTAL.         *> TOTAL = A + B
```

> 🔑 **A diferença entre `TO` e `GIVING`:**
> - `TO` **acumula**: o valor antigo do destino entra na conta.
> - `GIVING` **substitui**: o destino recebe só o resultado.

## 2. SUBTRACT — subtrair

```cobol
           SUBTRACT 10 FROM WS-SALDO.             *> SALDO = SALDO - 10
           SUBTRACT WS-B FROM WS-A GIVING WS-R.   *> R = A - B
```

Atenção à ordem: `SUBTRACT B FROM A` = **A − B** ("tire B de A").

## 3. MULTIPLY — multiplicar

```cobol
           MULTIPLY 2 BY WS-VALOR.                *> VALOR = 2 * VALOR
           MULTIPLY WS-A BY WS-B GIVING WS-R.     *> R = A * B
```

## 4. DIVIDE — dividir

```cobol
           DIVIDE WS-A BY WS-B GIVING WS-R.       *> R = A / B
           DIVIDE WS-B INTO WS-A GIVING WS-R.     *> R = A / B (outro jeito)
           DIVIDE WS-A BY WS-B GIVING WS-Q
                  REMAINDER WS-RESTO.             *> quociente e resto
```

- `BY`: "A dividido **por** B". `INTO`: "B cabe **dentro** de A".
- `REMAINDER` guarda o **resto** da divisão. Muito útil para:
  par/ímpar, trocar segundos por minutos, separar dígitos...

## 5. COMPUTE — a fórmula

```cobol
           COMPUTE WS-MEDIA = (WS-N1 + WS-N2 + WS-N3) / 3.
           COMPUTE WS-AREA  = 3.14159 * WS-RAIO ** 2.
```

| Operador | Significado |
|---|---|
| `+` `-` `*` `/` | soma, subtração, multiplicação, divisão |
| `**` | potência |
| `( )` | agrupamento |

> ⚠️ Deixe **espaços** ao redor dos operadores: `WS-A - WS-B`.
> Sem espaço, `WS-A-WS-B` vira o **nome** de uma variável (o hífen
> é permitido em nomes)!

## 6. ROUNDED — arredondar

Se o resultado tem mais casas decimais do que o destino comporta,
o COBOL **corta** (trunca). Com `ROUNDED`, ele **arredonda**:

```cobol
      * WS-R e PIC 9(3)V9.   10 / 3 = 3.3333...
           DIVIDE 10 BY 3 GIVING WS-R.            *> 003.3 (cortou)
      * 20 / 3 = 6.6666...
           DIVIDE 20 BY 3 GIVING WS-R.            *> 006.6 (cortou!)
           DIVIDE 20 BY 3 GIVING WS-R ROUNDED.    *> 006.7 (arredondou)
```

## 7. ON SIZE ERROR — quando o resultado não cabe

Lembra do truncamento à esquerda do Módulo 02? Em contas, ele pode
transformar 1000 em 000 **sem avisar ninguém**. O `ON SIZE ERROR`
captura isso (e também a **divisão por zero**):

```cobol
           MULTIPLY WS-A BY WS-B GIVING WS-R
               ON SIZE ERROR
                   DISPLAY "RESULTADO NAO CABE!"
               NOT ON SIZE ERROR
                   DISPLAY "RESULTADO: " WS-R
           END-MULTIPLY.
```

Quando dá *size error*, o destino **não é alterado**.

> O `END-MULTIPLY` (ou `END-ADD`, `END-DIVIDE`, `END-COMPUTE`...)
> marca onde termina o comando. É o jeito moderno e seguro.

## 8. Sinal: cuidado com o S!

```cobol
       01 WS-SEM-SINAL  PIC 9(3).
       01 WS-COM-SINAL  PIC S9(3).
           SUBTRACT 10 FROM 3 GIVING WS-SEM-SINAL.   *> 007  (o sinal SUMIU!)
           SUBTRACT 10 FROM 3 GIVING WS-COM-SINAL.   *> -007
```

Se uma conta **pode** dar negativo, o destino **precisa** de `S`.

---

## Exemplos desta pasta

| Arquivo | O que mostra |
|---|---|
| [01-verbos.cbl](exemplos/01-verbos.cbl) | `ADD`, `SUBTRACT`, `MULTIPLY`, `DIVIDE` com `TO`/`GIVING` |
| [02-compute.cbl](exemplos/02-compute.cbl) | Fórmulas com `COMPUTE` e potência |
| [03-rounded-size-error.cbl](exemplos/03-rounded-size-error.cbl) | `ROUNDED`, `ON SIZE ERROR` e o problema do sinal |

➡️ Depois, vá para os [exercícios](exercicios/README.md).
