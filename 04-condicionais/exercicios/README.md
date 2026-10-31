# Exercícios — Módulo 04

```bash
./verificar.sh 04-condicionais/exercicios/ex01-par-impar.cbl
```

---

## Ex01 — Par ou ímpar, positivo ou negativo  ⭐

Complete [ex01-par-impar.cbl](ex01-par-impar.cbl). Leia um número inteiro
(até 4 dígitos, **pode ser negativo**) e diga se ele é par ou ímpar,
e se é positivo, negativo ou zero.

Exemplo (o usuário digitou `7`):

```
DIGITE UM NUMERO:
PARIDADE: IMPAR
SINAL...: POSITIVO
```

Regras:
- Valores possíveis para SINAL: `POSITIVO`, `NEGATIVO` ou `ZERO`.
- Zero é par.
- **Teste com números ímpares negativos.** Se o seu programa errar
  algum caso, use `DISPLAY` para ver os valores intermediários e
  descubra o motivo. (É uma pegadinha clássica!)

---

## Ex02 — Conceito do aluno  ⭐⭐

Complete [ex02-conceito.cbl](ex02-conceito.cbl). Leia uma nota inteira de
0 a 100 e mostre o conceito:

| Nota | Saída |
|---|---|
| 90 a 100 | `CONCEITO: A - EXCELENTE` |
| 75 a 89 | `CONCEITO: B - BOM` |
| 60 a 74 | `CONCEITO: C - REGULAR` |
| 40 a 59 | `CONCEITO: D - INSUFICIENTE` |
| 0 a 39 | `CONCEITO: E - REPROVADO` |
| acima de 100 | `NOTA INVALIDA` |

Exemplo (o usuário digitou `82`):

```
DIGITE A NOTA (0 A 100):
CONCEITO: B - BOM
```

Regras:
- Use `EVALUATE` (nada de uma escada de `IF`s!).
- Faça **duas versões** do `EVALUATE` no mesmo programa (comente uma
  delas com `*` na coluna 7): uma com `EVALUATE TRUE` e outra com
  `EVALUATE WS-NOTA` usando `THRU`. Qual ficou mais legível?
- Os testes verificam os **limites** de cada faixa (90, 89, 75, 74...).
  Por que testar os limites é tão importante?

---

## Ex03 — Dia da semana  ⭐⭐

Complete [ex03-dia-semana.cbl](ex03-dia-semana.cbl). Leia um número de
1 a 7 (1 = domingo) e mostre o nome do dia e se é dia útil.

Exemplo (o usuário digitou `4`):

```
DIGITE O DIA (1=DOMINGO ... 7=SABADO):
DIA.: QUARTA-FEIRA
TIPO: DIA UTIL
```

Os nomes: `DOMINGO`, `SEGUNDA-FEIRA`, `TERCA-FEIRA`, `QUARTA-FEIRA`,
`QUINTA-FEIRA`, `SEXTA-FEIRA`, `SABADO`.
O TIPO é `FIM DE SEMANA` ou `DIA UTIL`.

Se o número não estiver entre 1 e 7, exiba só a linha `DIA INVALIDO`
(depois do pedido de entrada).

Regras:
- Declare **pelo menos 2 condições de nível 88** na variável do dia:
  uma para "dia válido" e outra para "fim de semana".
- Os `IF`s do programa devem usar **os nomes 88**, e não comparações
  com números.

---

## Ex04 — Validador de datas  ⭐⭐⭐

Lembra da pergunta do Módulo 02 ("o programa percebe uma data errada?")?
Agora ele vai perceber!

Complete [ex04-valida-data.cbl](ex04-valida-data.cbl). Leia uma data no
formato `AAAAMMDD` e diga se ela existe no calendário.

Exemplos:

```
DIGITE A DATA (AAAAMMDD):
DATA VALIDA: 28/10/2026
```
```
DIGITE A DATA (AAAAMMDD):
DATA INVALIDA: DIA INEXISTENTE
```

Mensagens possíveis, **verificadas nesta ordem**:

| Situação | Saída |
|---|---|
| Tem algo que não é dígito | `DATA INVALIDA: NAO NUMERICA` |
| Mês fora de 1–12 | `DATA INVALIDA: MES INEXISTENTE` |
| Dia fora do limite do mês | `DATA INVALIDA: DIA INEXISTENTE` |
| Tudo certo | `DATA VALIDA: DD/MM/AAAA` |

Regras:
- Meses com 31 dias: 1, 3, 5, 7, 8, 10, 12. Com 30: 4, 6, 9, 11.
- Fevereiro tem 29 dias em ano **bissexto** e 28 nos outros.
- Um ano é bissexto se for divisível por 4, **exceto** os divisíveis
  por 100 — que só são bissextos se também forem divisíveis por 400.
  (Pesquise: 1900 foi bissexto? E 2000?)
- Use pelo menos um nível 88 (por exemplo, para os meses de 31 dias).
- Desenhe a lógica num papel **antes** de programar.

---

## Perguntas de reflexão

1. O que acontece se você colocar um **ponto final** dentro de um `IF`,
   antes do `ELSE`? Teste e explique a mensagem do compilador.
2. No `EVALUATE TRUE`, por que a **ordem** dos `WHEN` importa? Dê um
   exemplo do Ex02 em que trocar a ordem quebraria o programa.
3. No Ex01, por que o resto da divisão de um número negativo deu um
   valor diferente do que você esperava? Como você resolveu?
4. Qual a vantagem do nível 88 quando, um dia, a regra mudar (por
   exemplo, o sábado passar a ser dia útil)?
