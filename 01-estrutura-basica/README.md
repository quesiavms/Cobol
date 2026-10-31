# Módulo 01 — A estrutura de um programa COBOL

## 1. O que é COBOL?

**COBOL** = *COmmon Business-Oriented Language* (1959).
Foi criada para ser lida quase como inglês, por gente de negócio.
Ainda hoje roda em bancos, seguradoras e governos — processando
bilhões de transações por dia.

A característica mais marcante: **o COBOL é organizado e verboso de propósito**.
Tudo tem lugar certo.

## 2. As 4 divisões

Todo programa COBOL é dividido em até **4 DIVISÕES**, sempre nesta ordem.
Pense num **formulário de 4 páginas**:

| Divisão | Pergunta que ela responde | Analogia |
|---|---|---|
| `IDENTIFICATION DIVISION.` | **Quem** é o programa? | A capa do trabalho (nome, autor) |
| `ENVIRONMENT DIVISION.` | **Onde** ele roda? Que arquivos usa? | A lista de materiais |
| `DATA DIVISION.` | **Quais dados** ele guarda? | A despensa com potes etiquetados |
| `PROCEDURE DIVISION.` | **O que** ele faz? | A receita, passo a passo |

Só a `IDENTIFICATION` (com o `PROGRAM-ID`) é obrigatória — mas, na prática,
quase todo programa tem `DATA` e `PROCEDURE`.

O menor programa possível:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. OLAMUNDO.
       PROCEDURE DIVISION.
           DISPLAY "OLA, MUNDO!".
           STOP RUN.
```

## 3. Hierarquia: Divisão → Seção → Parágrafo → Sentença → Comando

```
DIVISÃO        PROCEDURE DIVISION.
  SEÇÃO          (opcional) PRINCIPAL SECTION.
    PARÁGRAFO      INICIO.
      SENTENÇA       DISPLAY "A" DISPLAY "B".   <- termina no ponto
        COMANDO        DISPLAY "A"
```

- **Comando** (*statement*): uma ordem, como `DISPLAY "A"`.
- **Sentença**: um ou mais comandos **terminados por ponto** (`.`).
- **Parágrafo**: um nome na Área A seguido de ponto. Agrupa sentenças.

> ⚠️ O **ponto final** é muito importante em COBOL. Ele encerra a sentença.
> Ponto esquecido ou sobrando é a causa nº 1 de erro de iniciante.

## 4. As colunas (formato fixo)

```
         1     7 8   12                                                    72
         |     | |   |                                                      |
               * Comentario: asterisco na coluna 7
                IDENTIFICATION DIVISION.
                PROGRAM-ID. EXEMPLO.
                PROCEDURE DIVISION.
                    DISPLAY "TEXTO".
                    STOP RUN.
```

- **Área A (colunas 8–11):** nomes de DIVISÕES, SEÇÕES e PARÁGRAFOS.
- **Área B (colunas 12–72):** os comandos.
- **Coluna 7 = `*`:** a linha inteira vira comentário.
- Passou da coluna 72? O compilador **ignora** o resto. Cuidado com linhas longas!

> 💡 O GnuCOBOL é **tolerante** com as Áreas A e B (aceita um `DISPLAY`
> na coluna 8, por exemplo). O compilador do mainframe IBM **não** é.
> Por isso, neste curso, siga sempre as colunas certas — é o hábito
> que vale no mercado.

## 5. Comentários

```cobol
      * Esta linha inteira e um comentario (asterisco na coluna 7).
           DISPLAY "OI". *> Comentario no fim da linha (estilo moderno)
```

Use comentários para explicar o **porquê**, não o óbvio.

## 6. DISPLAY — mostrando coisas na tela

```cobol
           DISPLAY "UM TEXTO".
           DISPLAY "PARTE 1 " "PARTE 2".        *> junta varios itens
           DISPLAY "SEM PULAR LINHA" WITH NO ADVANCING.
           DISPLAY " <- continuou na mesma linha".
           DISPLAY " ".                         *> linha em branco
```

- Textos (literais) ficam entre **aspas** `"..."`.
- Vários itens no mesmo `DISPLAY` são exibidos **colados**, um depois do outro.
- Cada `DISPLAY` pula de linha no final, a menos que use `WITH NO ADVANCING`.

## 7. STOP RUN

`STOP RUN.` encerra o programa. Sem ele, o programa pode "cair" no
código seguinte ou terminar de forma inesperada. **Sempre** coloque.

## 8. Compilando

```bash
./rodar.sh 01-estrutura-basica/exemplos/01-ola-mundo.cbl
```

Por baixo dos panos o script faz `cobc -x programa.cbl` (o `-x` gera um
executável) e depois executa o resultado.

---

## Exemplos desta pasta

| Arquivo | O que mostra |
|---|---|
| [01-ola-mundo.cbl](exemplos/01-ola-mundo.cbl) | O programa mínimo |
| [02-quatro-divisoes.cbl](exemplos/02-quatro-divisoes.cbl) | As 4 divisões, comentadas |
| [03-display.cbl](exemplos/03-display.cbl) | Formas de usar o `DISPLAY` |

**Experimente:** depois de rodar cada exemplo, provoque erros:
- tire o ponto depois de `PROGRAM-ID. ...`
- mova `PROCEDURE DIVISION.` para a coluna 12
- escreva `DISPLAI` em vez de `DISPLAY`

Anote as mensagens que aparecem. Você vai encontrá-las de novo!

➡️ Depois, vá para os [exercícios](exercicios/README.md).
