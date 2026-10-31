# Módulo 05 — Parágrafos e laços (PERFORM)

## 1. Parágrafos: dando nome a pedaços do programa

Um **parágrafo** é um bloco de código com nome. O nome fica na
**Área A** (coluna 8) e termina com ponto:

```cobol
       PROCEDURE DIVISION.
       PRINCIPAL.
           PERFORM SAUDAR.
           PERFORM SAUDAR.
           STOP RUN.

       SAUDAR.
           DISPLAY "OLA!".
```

`PERFORM SAUDAR` = "vá até o parágrafo SAUDAR, execute-o e **volte**".
É como chamar uma função em outras linguagens.

> ⚠️ Por que o `STOP RUN` no fim do `PRINCIPAL` é essencial?
> Sem ele, o programa "cai" para dentro do parágrafo seguinte e
> executa tudo de novo! Teste no exemplo 01.

### A estrutura clássica de um programa COBOL

Quase todo programa profissional segue este esqueleto:

```cobol
       PRINCIPAL.
           PERFORM INICIALIZAR.
           PERFORM PROCESSAR UNTIL FIM-DOS-DADOS.
           PERFORM FINALIZAR.
           STOP RUN.
```

O `PRINCIPAL` vira um **índice**: lendo só ele, você entende o programa.

## 2. As formas do PERFORM

### 2.1 Executar N vezes — TIMES

```cobol
           PERFORM BIP 3 TIMES.          *> executa BIP 3 vezes
```

### 2.2 Repetir enquanto não... — UNTIL

```cobol
           PERFORM LER-NUMERO UNTIL WS-NUMERO = 0.
```

Repete **até** a condição ficar verdadeira. Atenção: a condição é
testada **antes** de cada execução. Se ela já começar verdadeira,
o parágrafo **nunca** roda.

Se quiser testar **depois** (rodar pelo menos uma vez):

```cobol
           PERFORM LER-NUMERO WITH TEST AFTER UNTIL WS-NUMERO = 0.
```

### 2.3 Contador automático — VARYING

```cobol
           PERFORM MOSTRAR VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 10.
```

Leia assim: "comece `WS-I` em 1, some 1 a cada volta, pare quando
`WS-I` passar de 10". É o `for` de outras linguagens.

```cobol
      * Contagem regressiva de 10 em 10
           PERFORM MOSTRAR VARYING WS-I FROM 100 BY -10 UNTIL WS-I < 0.
```

(Para contar para trás, `WS-I` precisa ter sinal: `PIC S9(3)`.)

### 2.4 PERFORM em linha (inline)

Em vez de chamar um parágrafo, o código fica **dentro** do PERFORM,
fechado por `END-PERFORM`:

```cobol
           PERFORM VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 5
               DISPLAY "VOLTA " WS-I
           END-PERFORM.
```

Use inline para laços **curtos**. Para lógica maior, prefira um
parágrafo com nome — o código fica mais fácil de ler.

## 3. O padrão "leitura antecipada"

Para ler dados até aparecer um valor de parada (por exemplo, 0),
o padrão clássico em COBOL é **ler uma vez antes do laço** e
**ler de novo no fim de cada volta**:

```
   ler o primeiro valor
   repetir ATÉ o valor ser o de parada:
       processar o valor
       ler o próximo valor
```

Assim o valor de parada **nunca** é processado por engano.
Você vai usar isso muito quando estudar leitura de arquivos!

## 4. Cuidado: laço infinito

Se a condição do `UNTIL` nunca ficar verdadeira, o programa roda para
sempre. Para interromper: **Ctrl+C**.
(O `verificar.sh` encerra sozinho depois de 5 segundos.)

Causas comuns:
- Esqueceu de alterar a variável testada dentro do laço.
- A variável é pequena demais: `PIC 9` nunca chega a `10`! Pense
  em `UNTIL WS-I > 9` com `WS-I PIC 9`... (teste e veja!)

---

## Exemplos desta pasta

| Arquivo | O que mostra |
|---|---|
| [01-paragrafos.cbl](exemplos/01-paragrafos.cbl) | Parágrafos e a estrutura INICIALIZAR / PROCESSAR / FINALIZAR |
| [02-times-e-until.cbl](exemplos/02-times-e-until.cbl) | `TIMES`, `UNTIL`, `WITH TEST AFTER` e leitura antecipada |
| [03-varying.cbl](exemplos/03-varying.cbl) | `VARYING`, contagem regressiva e laços aninhados |

```bash
printf "10\n20\n5\n0\n" | ./rodar.sh 05-lacos-e-paragrafos/exemplos/02-times-e-until.cbl
```

➡️ Depois, vá para os [exercícios](exercicios/README.md).

---

## 🎓 E depois do Módulo 05?

Parabéns! Você domina a base do COBOL. Próximos assuntos para estudar:

1. **Tabelas** (`OCCURS`, índices, `SEARCH`) — os "vetores" do COBOL.
2. **Arquivos sequenciais** (`SELECT`, `FD`, `OPEN`, `READ`, `WRITE`, `CLOSE`) — o coração do COBOL no mundo real.
3. **Manipulação de texto** (`STRING`, `UNSTRING`, `INSPECT`, funções intrínsecas).
4. **Subprogramas** (`CALL`, `LINKAGE SECTION`) e **copybooks** (`COPY`).
5. **Mainframe:** JCL, VSAM, DB2 e CICS.
