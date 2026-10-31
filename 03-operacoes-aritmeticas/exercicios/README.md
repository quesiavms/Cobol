# Exercícios — Módulo 03

```bash
./verificar.sh 03-operacoes-aritmeticas/exercicios/ex01-calculadora.cbl
```

> Neste módulo ainda **não** usamos `IF`. Tudo o que precisa ser
> "decidido" deve ser resolvido com `ON SIZE ERROR` / `NOT ON SIZE ERROR`.

---

## Ex01 — Calculadora  ⭐⭐

Complete [ex01-calculadora.cbl](ex01-calculadora.cbl). Leia dois números
inteiros (até 4 dígitos, sem sinal) e mostre as 5 operações.

Exemplo (o usuário digitou `15` e `4`):

```
PRIMEIRO NUMERO:
SEGUNDO NUMERO:
SOMA.........:     19
SUBTRACAO....:     11
MULTIPLICACAO:         60
DIVISAO......:     3.75
RESTO........:     3
```

Use **exatamente** estas máscaras para exibir os resultados:

| Linha | Máscara |
|---|---|
| SOMA | `ZZ,ZZ9` |
| SUBTRACAO | `-Z,ZZ9` |
| MULTIPLICACAO | `ZZ,ZZZ,ZZ9` |
| DIVISAO | `Z,ZZ9.99` (resultado **arredondado**) |
| RESTO | `Z,ZZ9` |

Regras:
- A subtração é *primeiro − segundo* e **pode dar negativo** (veja o caso 2).
- O RESTO é o resto da divisão **inteira** (15 ÷ 4 = 3, resto 3).
- Se o segundo número for **zero**, as duas últimas linhas devem ser:
  ```
  DIVISAO......: IMPOSSIVEL
  RESTO........: IMPOSSIVEL
  ```
- Use os **verbos** (`ADD`, `SUBTRACT`, ...), **não** use `COMPUTE` aqui.

---

## Ex02 — Conversor de temperatura  ⭐⭐

Complete [ex02-temperatura.cbl](ex02-temperatura.cbl). Leia uma temperatura
em **Fahrenheit** (inteira, pode ser negativa) e converta para Celsius:

```
C = (F - 32) x 5 / 9
```

Exemplo (o usuário digitou `100`):

```
TEMPERATURA EM FAHRENHEIT:
CELSIUS (TRUNCADO)...:   37.7
CELSIUS (ARREDONDADO):   37.8
```

Regras:
- Use `COMPUTE`.
- O resultado tem **1 casa decimal** e é exibido com a máscara `---9.9`.
- Mostre a versão truncada e a arredondada. Elas mudam em quais casos
  de teste? Por quê?

---

## Ex03 — Caixa eletrônico  ⭐⭐⭐

Complete [ex03-caixa.cbl](ex03-caixa.cbl). Leia um valor de saque inteiro
(até 4 dígitos) e diga quantas notas/moedas de cada tipo o caixa entrega,
sempre usando **o maior valor possível primeiro**.

Exemplo (o usuário digitou `388`):

```
VALOR DO SAQUE:
NOTAS DE R$ 100:  3
NOTAS DE R$  50:  1
NOTAS DE R$  20:  1
NOTAS DE R$  10:  1
NOTAS DE R$   5:  1
NOTAS DE R$   2:  1
MOEDAS DE R$  1:  1
```

Regras:
- Quantidades exibidas com a máscara `Z9`.
- Proibido usar `IF` e proibido usar `COMPUTE`.
- Pense: depois de saber quantas notas de 100 saem, **quanto sobra**
  para as próximas notas? Qual opção do `DIVIDE` dá isso?

---

## Ex04 — Juros compostos  ⭐⭐⭐

Complete [ex04-juros.cbl](ex04-juros.cbl). Leia o capital inicial
(inteiro, até 6 dígitos), a taxa de juros **mensal em %** (inteira, até
2 dígitos) e o número de meses (até 3 dígitos). Calcule:

```
MONTANTE = CAPITAL x (1 + TAXA / 100) ^ MESES
JUROS    = MONTANTE - CAPITAL
```

Exemplo (o usuário digitou `1000`, `1` e `12`):

```
CAPITAL INICIAL:
TAXA MENSAL (%):
NUMERO DE MESES:
MONTANTE FINAL:       1,126.83
JUROS GANHOS..:         126.83
```

Regras:
- O montante deve ser guardado numa variável `PIC 9(9)V99`, **arredondado**.
- Exiba os valores com a máscara `ZZZ,ZZZ,ZZ9.99`.
- Se o montante **não couber** na variável, exiba só:
  ```
  MONTANTE FINAL: VALOR GRANDE DEMAIS
  ```
  (sem a linha de juros).

> ⚠️ **Atenção à precisão:** se você guardar um resultado intermediário
> (como o `1 + TAXA / 100` elevado à potência) numa variável com poucas
> casas decimais, o valor final vai sair diferente do esperado.
> Teste e descubra por quê!

---

## Perguntas de reflexão

1. Qual a diferença entre `ADD A TO B` e `ADD A TO B GIVING C`?
   O que acontece com `B` em cada caso?
2. Por que `WS-A-WS-B` dentro de um `COMPUTE` dá erro (ou resultado estranho)?
3. Em um sistema de folha de pagamento, você usaria `ROUNDED` sempre?
   Pesquise sobre o "golpe dos centavos" (*salami slicing*).
4. O que aconteceria no Ex01 se você esquecesse o `S` na variável da
   subtração? Teste com o caso 2.
