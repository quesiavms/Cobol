# Módulo 02 — Variáveis e dados

## 1. Onde moram as variáveis?

Na `DATA DIVISION`, dentro da `WORKING-STORAGE SECTION`
(a "memória de trabalho" do programa):

```cobol
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NOME      PIC X(20).
       01 WS-IDADE     PIC 9(3)   VALUE 0.
```

Lendo a linha `01 WS-IDADE PIC 9(3) VALUE 0.`:

| Pedaço | Significado |
|---|---|
| `01` | **Número de nível** (hierarquia, veja abaixo) |
| `WS-IDADE` | Nome da variável. O prefixo `WS-` (Working-Storage) é uma convenção |
| `PIC 9(3)` | **Picture**: o "molde" do dado — 3 dígitos numéricos |
| `VALUE 0` | Valor inicial |

> Nomes: até 30 caracteres, letras, números e hífen. Sem espaço,
> sem começar ou terminar com hífen.

## 2. A cláusula PIC (PICTURE)

Pense na `PIC` como o **formato de uma caixinha**: o tamanho dela
e o que cabe dentro.

| Símbolo | Significa | Exemplo | Guarda |
|---|---|---|---|
| `9` | Um dígito (0–9) | `PIC 9(4)` | `0042` |
| `X` | Qualquer caractere | `PIC X(10)` | `"ABC 12!   "` |
| `A` | Só letra ou espaço | `PIC A(5)` | `"MARIA"` |
| `V` | Vírgula decimal **imaginária** (não ocupa espaço) | `PIC 9(3)V99` | `012.50` |
| `S` | Tem sinal (+/−) | `PIC S9(3)` | `-005` |

- `9(4)` é o mesmo que `9999`. O número entre parênteses é a **repetição**.
- `V` não ocupa memória: `PIC 9(3)V99` tem **5** dígitos guardados.
  O COBOL só "lembra" onde fica a vírgula.

> 💡 O GnuCOBOL mostra o ponto ao exibir um campo com `V` (`012.50`).
> No mainframe IBM, o mesmo `DISPLAY` mostraria `01250`! Por isso,
> para exibir números bonitos, usamos as **máscaras de edição** (seção 6).

## 3. Números de nível e itens de grupo

Os níveis criam uma **hierarquia**, como pastas e arquivos:

```cobol
       01 WS-CLIENTE.                      *> GRUPO (nao tem PIC)
          05 WS-NOME        PIC X(20).     *> item elementar
          05 WS-NASCIMENTO.                *> sub-grupo
             10 WS-DIA      PIC 99.
             10 WS-MES      PIC 99.
             10 WS-ANO      PIC 9(4).
```

- `01` = nível mais alto (fica na **Área A**).
- `05`, `10`, `15`... = partes de dentro (ficam na **Área B**).
  Os números não precisam ser seguidos; usamos de 5 em 5 por costume.
- Um **grupo** é tratado como um grande `PIC X` com a soma dos filhos.
  `WS-NASCIMENTO` tem 2+2+4 = 8 caracteres.
- `77` = variável solta, que não pertence a grupo nenhum.
- `FILLER` = um pedaço sem nome (útil para espaços e textos fixos).

## 4. MOVE — copiando valores

```cobol
           MOVE "JOAO" TO WS-NOME.
           MOVE 25     TO WS-IDADE.
           MOVE WS-IDADE TO WS-OUTRA-IDADE.
           MOVE ZEROS  TO WS-IDADE.          *> constantes figurativas
           MOVE SPACES TO WS-NOME.
```

O `MOVE` **copia** (o original não muda). Mas atenção às regras de
encaixe, que são diferentes para texto e para número:

| Tipo do destino | Alinha por... | Se sobrar espaço | Se faltar espaço |
|---|---|---|---|
| Alfanumérico (`X`) | **Esquerda** | Completa com espaços à direita | **Corta à direita** |
| Numérico (`9`) | **Vírgula decimal** | Completa com zeros | **Corta à esquerda** (!) |

Isso se chama **truncamento**, e é uma fonte clássica de bugs.
Um número grande demais para a caixinha perde os dígitos **mais
importantes**, e o programa não avisa nada na hora de executar!

> O compilador às vezes avisa (`warning: value size exceeds data size`)
> quando o valor é um literal. Leia os avisos!

## 5. ACCEPT — lendo do teclado

```cobol
           DISPLAY "DIGITE SEU NOME:".
           ACCEPT WS-NOME.
```

O `ACCEPT` lê **uma linha** digitada e guarda na variável, seguindo as
mesmas regras de encaixe do `MOVE`.

Também dá para pegar dados do sistema:

```cobol
           ACCEPT WS-DATA FROM DATE YYYYMMDD.   *> ex.: 20261028
           ACCEPT WS-HORA FROM TIME.            *> HHMMSScc
```

> ⚠️ Neste curso, vamos digitar só **números inteiros** no `ACCEPT`.
> Números com vírgula digitados exigem tratamento especial (como a
> função `NUMVAL`), que fica para mais tarde.

## 6. Máscaras de edição — números bonitos na tela

Variáveis numéricas comuns servem para **calcular**. Para **mostrar**,
movemos o valor para uma variável com máscara:

| Máscara | Valor | Resultado | Para quê |
|---|---|---|---|
| `ZZ9` | 5 | `"  5"` | `Z` troca zero à esquerda por espaço |
| `ZZ9` | 0 | `"  0"` | o último `9` garante pelo menos um dígito |
| `ZZ,ZZ9.99` | 12345.6 | `"12,345.60"` | separador de milhar e decimal |
| `$ZZ,ZZ9.99` | 12345.6 | `"$12,345.60"` | cifrão |
| `--9` | -5 | `" -5"` | sinal "flutuante" (encosta no número) |
| `99/99/9999` | 28102026 | `"28/10/2026"` | a `/` é inserida |

```cobol
       01 WS-VALOR      PIC 9(5)V99   VALUE 12345.6.
       01 WS-VALOR-ED   PIC ZZ,ZZ9.99.
       ...
           MOVE WS-VALOR TO WS-VALOR-ED.
           DISPLAY "TOTAL: " WS-VALOR-ED.     *> TOTAL: 12,345.60
```

> Variável com máscara é **só para exibir**. Não dá para fazer conta com ela.

---

## Exemplos desta pasta

| Arquivo | O que mostra |
|---|---|
| [01-tipos-pic.cbl](exemplos/01-tipos-pic.cbl) | Os símbolos `9`, `X`, `A`, `V`, `S` |
| [02-move.cbl](exemplos/02-move.cbl) | `MOVE`, constantes figurativas e truncamento |
| [03-accept.cbl](exemplos/03-accept.cbl) | Lendo dados do teclado e do sistema |
| [04-grupos-e-mascaras.cbl](exemplos/04-grupos-e-mascaras.cbl) | Itens de grupo, `FILLER` e máscaras |

Rode o `03-accept.cbl` de dois jeitos:

```bash
./rodar.sh 02-variaveis-e-dados/exemplos/03-accept.cbl          # digitando
printf "ANA\n30\n" | ./rodar.sh 02-variaveis-e-dados/exemplos/03-accept.cbl   # entrada automatica
```

➡️ Depois, vá para os [exercícios](exercicios/README.md).
