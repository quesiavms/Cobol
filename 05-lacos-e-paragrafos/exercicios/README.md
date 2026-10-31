# Exercícios — Módulo 05

```bash
./verificar.sh 05-lacos-e-paragrafos/exercicios/ex01-tabuada.cbl
```

> Regra geral deste módulo: o parágrafo `PRINCIPAL` deve ser **curto**
> e funcionar como índice — a lógica fica em parágrafos com nomes
> que expliquem o que eles fazem.

---

## Ex01 — Tabuada  ⭐

Complete [ex01-tabuada.cbl](ex01-tabuada.cbl). Leia um número de 1 a 99
e mostre a tabuada dele, de 1 a 10.

Exemplo (o usuário digitou `7`):

```
TABUADA DE QUAL NUMERO?
 7 X  1 =   7
 7 X  2 =  14
 7 X  3 =  21
 7 X  4 =  28
 7 X  5 =  35
 7 X  6 =  42
 7 X  7 =  49
 7 X  8 =  56
 7 X  9 =  63
 7 X 10 =  70
```

Regras:
- Máscaras: `Z9` para o número e o multiplicador, `ZZ9` para o resultado.
- Use `PERFORM ... VARYING` chamando um **parágrafo** que calcula e
  exibe **uma** linha.

---

## Ex02 — Estatísticas  ⭐⭐

Complete [ex02-estatisticas.cbl](ex02-estatisticas.cbl). Leia números
inteiros (de 1 a 999), um por linha, até o usuário digitar `0`.
Depois mostre:

```
DIGITE NUMEROS (0 PARA TERMINAR):
QUANTIDADE:   4
SOMA......:    100
MEDIA.....:  25.00
MAIOR.....:  40
MENOR.....:  10
```

(Exemplo para a entrada `10`, `20`, `30`, `40`, `0`.)

Regras:
- O pedido `DIGITE NUMEROS...` aparece **uma vez só**.
- Máscaras: QUANTIDADE `ZZ9`, SOMA `ZZ,ZZ9`, MEDIA `ZZ9.99`
  (**arredondada**), MAIOR e MENOR `ZZ9`.
- O `0` final **não** conta como número.
- Se o primeiro número já for `0`, mostre só `NENHUM NUMERO DIGITADO`.
- Pergunta para pensar: qual deve ser o valor **inicial** da variável
  do MENOR? E se você não conseguir escolher um valor inicial seguro,
  que outra estratégia existe?

---

## Ex03 — Menu interativo  ⭐⭐

Complete [ex03-menu.cbl](ex03-menu.cbl). O programa mostra um menu,
executa a opção escolhida e **volta ao menu**, até o usuário escolher `0`.

```
===== MENU =====
1 - CONTAGEM REGRESSIVA
2 - SOMA DE 1 ATE N
0 - SAIR
OPCAO:
```

| Opção | O que faz |
|---|---|
| `1` | Exibe `N:`, lê N (1 a 9) e exibe N, N−1, ... 1 (um por linha) e depois `FOGO!` |
| `2` | Exibe `N:`, lê N (até 3 dígitos) e exibe `SOMA: ` + a soma 1+2+...+N com a máscara `ZZZ,ZZ9` |
| `0` | Exibe `ATE LOGO!` e termina |
| outra | Exibe `OPCAO INVALIDA` e volta ao menu |

Exemplo (entradas: `1`, `3`, `0`):

```
===== MENU =====
1 - CONTAGEM REGRESSIVA
2 - SOMA DE 1 ATE N
0 - SAIR
OPCAO:
N:
3
2
1
FOGO!
===== MENU =====
1 - CONTAGEM REGRESSIVA
2 - SOMA DE 1 ATE N
0 - SAIR
OPCAO:
ATE LOGO!
```

Regras:
- Cada opção em **seu próprio parágrafo**.
- Os testes incluem N = 999 na opção 2. Seu programa aguenta?
- O laço principal deve usar `UNTIL` com uma condição de **nível 88**.
- Na opção 2, calcule a soma com um **laço** (não use a fórmula de Gauss).
  Depois, como desafio, compare com a fórmula `N x (N + 1) / 2`.

---

## Ex04 — Números primos  ⭐⭐⭐

Complete [ex04-primos.cbl](ex04-primos.cbl). Leia N (de 2 a 999) e mostre
todos os números primos de 2 até N, e quantos são.

Exemplo (o usuário digitou `20`):

```
PRIMOS ATE QUAL NUMERO?
  2
  3
  5
  7
 11
 13
 17
 19
TOTAL DE PRIMOS:   8
```

Regras:
- Números e total com a máscara `ZZ9`.
- Um número é primo se só é divisível por 1 e por ele mesmo.
- Você vai precisar de **dois laços**, um dentro do outro. Desenhe antes!
- O teste com N = 999 tem limite de 5 segundos.
- **Desafio de eficiência:** é mesmo preciso testar *todos* os divisores?
  Até onde vale a pena testar? E dá para parar assim que achar um divisor?

---

## Perguntas de reflexão

1. Qual a diferença entre `PERFORM X UNTIL C` e
   `PERFORM X WITH TEST AFTER UNTIL C`? Dê um exemplo em que elas
   produzem resultados diferentes.
2. O que acontece num `PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 9`
   se `WS-I` for `PIC 9`? Por quê?
3. No Ex02, por que a "leitura antecipada" evita que o `0` entre na média?
4. Releia seus programas dos módulos anteriores. Algum ficaria mais
   claro se fosse dividido em parágrafos? Reescreva um deles!
