# Curso Prático de COBOL

Bem-vindo(a)! Este repositório é um curso de COBOL **para praticar**.
Cada módulo tem uma explicação curta, exemplos que funcionam e exercícios
para **você** resolver e testar na sua máquina.

> **Regra de ouro do curso:** os exercícios não têm resposta pronta.
> Você vai errar, ler a mensagem do compilador, corrigir e tentar de novo.
> É assim que se aprende COBOL de verdade (no mainframe também é assim!).

---

## 1. O ambiente

| Ferramenta | Para que serve |
|---|---|
| **GnuCOBOL** (`cobc`) | Compilador COBOL livre. Transforma o `.cbl` em executável. |
| `rodar.sh` | Compila e executa um programa. |
| `verificar.sh` | Testa a sua solução de um exercício contra casos de teste. |
| Extensão VS Code `bitlang.cobol` | Cores na sintaxe e guias de coluna. |

O devcontainer ([.devcontainer/devcontainer.json](.devcontainer/devcontainer.json))
instala tudo automaticamente. Se precisar instalar na mão (Ubuntu/Debian):

```bash
sudo apt-get update && sudo apt-get install -y gnucobol
cobc --version     # deve mostrar "cobc (GnuCOBOL) 3.x"
```

### Comandos do dia a dia

```bash
# Compilar e executar um exemplo
./rodar.sh 01-estrutura-basica/exemplos/01-ola-mundo.cbl

# Executar mandando a entrada de um arquivo (em vez de digitar)
./rodar.sh 02-variaveis-e-dados/exemplos/03-accept.cbl < minha-entrada.txt

# Testar a sua solução de um exercício
./verificar.sh 01-estrutura-basica/exercicios/ex01-cartao.cbl
```

No VS Code também dá para usar **Ctrl+Shift+B** com o arquivo aberto
(tarefa *"COBOL: compilar e rodar arquivo atual"*).

---

## 2. Trilha de estudo

Siga **na ordem**. Cada módulo usa o que você aprendeu no anterior.

| # | Pasta | Você vai aprender |
|---|---|---|
| 1 | [01-estrutura-basica](01-estrutura-basica/) | As 4 divisões, as colunas, `DISPLAY`, comentários |
| 2 | [02-variaveis-e-dados](02-variaveis-e-dados/) | `PIC`, níveis, `MOVE`, `ACCEPT`, máscaras de edição |
| 3 | [03-operacoes-aritmeticas](03-operacoes-aritmeticas/) | `ADD`, `SUBTRACT`, `MULTIPLY`, `DIVIDE`, `COMPUTE`, `ROUNDED` |
| 4 | [04-condicionais](04-condicionais/) | `IF`, `EVALUATE`, nível 88, testes de classe |
| 5 | [05-lacos-e-paragrafos](05-lacos-e-paragrafos/) | Parágrafos, `PERFORM`, `UNTIL`, `VARYING` |

Cada pasta tem:

```
NN-assunto/
├── README.md        <- a teoria, explicada passo a passo
├── exemplos/        <- programas prontos: rode, leia, modifique!
└── exercicios/
    ├── README.md    <- os enunciados
    ├── exNN-*.cbl   <- esqueletos para você completar
    └── testes/      <- entradas e saídas esperadas (usadas pelo verificar.sh)
```

### Como estudar cada módulo

1. Leia o `README.md` do módulo.
2. Rode **todos** os exemplos. Depois **quebre** os exemplos de propósito
   (apague um ponto, mude uma coluna) e veja qual erro aparece.
3. Faça os exercícios no esqueleto `.cbl`.
4. Rode `./verificar.sh` até passar em todos os casos.
5. Responda às **perguntas de reflexão** do final de cada lista.

---

## 3. Lembrete rápido: as colunas do COBOL (formato fixo)

COBOL nasceu nos cartões perfurados, por isso **a coluna importa**:

```
Coluna:  1     7 8   12                                                    72
         |     | |   |                                                      |
         000100*Isto e um comentario (asterisco na coluna 7)
                IDENTIFICATION DIVISION.        <- Area A (comeca na col. 8)
                    DISPLAY "OLA".              <- Area B (comeca na col. 12)
```

| Colunas | Nome | O que vai ali |
|---|---|---|
| 1–6 | Sequência | Número da linha (opcional, pode deixar em branco) |
| 7 | Indicador | `*` = comentário, `-` = continuação |
| 8–11 | **Área A** | Divisões, seções, parágrafos, níveis `01` e `77` |
| 12–72 | **Área B** | Comandos (`DISPLAY`, `MOVE`...) e níveis `05`, `10`... |
| 73–80 | Identificação | Ignorado pelo compilador |

Na prática: **7 espaços** antes de algo da Área A, **11 espaços** antes
de algo da Área B. As guias verticais do VS Code ajudam a enxergar isso.

---

## 4. Quando der erro

O compilador avisa assim:

```
programa.cbl:12: error: syntax error, unexpected DISPLAY
```

- `programa.cbl:12` → **a linha 12** (às vezes o erro real está na linha *anterior*,
  como um ponto `.` esquecido).
- Leia a mensagem com calma. 90% dos erros de iniciante são:
  1. Coluna errada (começou na Área A algo que é da Área B, ou vice-versa).
  2. Ponto final esquecido ou sobrando.
  3. Nome de variável digitado diferente da declaração.
  4. Aspas não fechadas.
  5. Usar uma **palavra reservada** como nome de variável (por exemplo
     `DATE`, `SD`, `EC`, `COUNT`). Por isso usamos o prefixo `WS-`:
     `WS-DATE` nunca dá conflito.
- Se o programa "trava", provavelmente é um laço infinito: tecle **Ctrl+C**.

Bons estudos!
