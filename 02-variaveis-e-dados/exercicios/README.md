# Exercícios — Módulo 02

```bash
./verificar.sh 02-variaveis-e-dados/exercicios/ex01-ficha.cbl
```

Os arquivos `testes/*.entrada` mostram o que será "digitado" em cada caso.
Abra-os para entender os testes, e **crie os seus próprios casos** também!

---

## Ex01 — Ficha cadastral  ⭐

Complete [ex01-ficha.cbl](ex01-ficha.cbl). O programa deve pedir
nome, idade e cidade, **nesta ordem**, e depois exibir a ficha.

Exemplo (o usuário digitou `MARIA SILVA`, `25` e `CAMPINAS`):

```
DIGITE SEU NOME:
DIGITE SUA IDADE:
DIGITE SUA CIDADE:
====== FICHA ======
NOME..: MARIA SILVA
IDADE.:  25
CIDADE: CAMPINAS
```

Regras:
- Nome e cidade: até 20 caracteres. Idade: até 3 dígitos.
- A idade deve aparecer **sem zeros à esquerda**, ocupando 3 posições
  (repare no espaço extra antes do `25`). Qual máscara faz isso?
- Use o prefixo `WS-` nos nomes das variáveis.

---

## Ex02 — Laboratório de truncamento  ⭐⭐  *(verificação manual)*

O programa [ex02-truncamento.cbl](ex02-truncamento.cbl) já está pronto,
mas **NÃO RODE AINDA!**

**Parte A — Previsão.** Leia o código e preencha a tabela **antes** de executar:

| Caso | Valor de origem | PIC do destino | Sua previsão | Resultado real | Por quê? |
|------|-----------------|----------------|--------------|----------------|----------|
| 1    | SAO PAULO	     | PIC X(3) 	    | SAO		       | 		            | 	       |
| 2    | 123456          | PIC 9(4)       | 1234	       | 3456           | 	       |
| 3    | 1234.56	       | PIC 9(2)V9 	  | 12.3456	     | 34.5      		  | 	       |
| 4    | 7	             | PIC 9(5) 	    | 00007	       | 		            | 	       |
| 5    | -42             | PIC 9(3) 	    | 042 	       |           		  | 	       |
| 6    | "ABC"	         | PIC X(6)	      | "ABC   "	   | 		            | 	       |

**Parte B — Execução.** Agora rode, preencha "Resultado real" e explique
cada diferença entre o que você previu e o que aconteceu.

**Parte C — Conserto.** Altere **apenas as cláusulas PIC** dos destinos
para que **nenhum** dado seja perdido. Qual o menor tamanho possível de
cada uma?

---

## Ex03 — Desmontando uma data  ⭐⭐

Complete [ex03-data.cbl](ex03-data.cbl). O usuário digita uma data no
formato `AAAAMMDD` e o programa mostra as partes separadas e a data
no formato brasileiro.

Exemplo (o usuário digitou `20261028`):

```
DIGITE A DATA (AAAAMMDD):
DIA: 28
MES: 10
ANO: 2026
DATA FORMATADA: 28/10/2026
```

Regras:
- Leia a data **direto para um item de grupo** que tenha ano, mês e dia
  como filhos. Pense: em que ordem os filhos devem ser declarados?
- Para a data formatada, **não** use a máscara `99/99/9999`. Monte um
  **segundo grupo**, com `FILLER` para as barras, e preencha-o com `MOVE`.
- Não use nenhum comando que ainda não estudamos (nada de contas!).

---

## Ex04 — Etiqueta de estoque  ⭐⭐⭐

Complete [ex04-etiqueta.cbl](ex04-etiqueta.cbl). O programa lê código,
descrição e quantidade, e imprime uma etiqueta de **uma linha só**.

Exemplo (o usuário digitou `42`, `CANETA AZUL` e `1500`):

```
CODIGO:
DESCRICAO:
QUANTIDADE:
COD 00042 | CANETA AZUL     | QTD: 1,500
```

Regras:
- Código: até 5 dígitos, exibido **com** zeros à esquerda.
- Descrição: 15 posições. Se o usuário digitar mais, o excesso é cortado
  (veja o caso de teste 2 e responda: isso é bom ou ruim para o usuário?).
- Quantidade: até 4 dígitos, exibida com separador de milhar e
  **sem** zeros à esquerda.
- A linha da etiqueta inteira deve ser **um único item de grupo**,
  exibido com **um único** `DISPLAY`.

---

## Desafio extra (sem teste automático)

Faça um programa que use `ACCEPT ... FROM DATE YYYYMMDD` e
`ACCEPT ... FROM TIME` para exibir:

```
HOJE E 28/10/2026, AGORA SAO 14:35:07
```

(com a data e a hora reais do seu computador).

---

## Perguntas de reflexão

1. Por que um truncamento numérico (que corta à **esquerda**) é mais
   perigoso que um alfanumérico? Imagine um sistema bancário.
2. Qual a diferença entre `PIC 9(3)V99` e `PIC 9(5)`? Quantos bytes
   cada um ocupa no formato padrão?
3. Por que não podemos fazer contas com uma variável `PIC ZZ9`?
4. No Ex03, o que acontece se o usuário digitar `28102026` (formato
   errado)? O programa percebe? Como ele poderia perceber? (Guarde essa
   ideia para o Módulo 04.)
