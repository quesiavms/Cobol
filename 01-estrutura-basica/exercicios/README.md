# Exercícios — Módulo 01

Para testar cada exercício:

```bash
./verificar.sh 01-estrutura-basica/exercicios/ex01-cartao.cbl
```

---

## Ex01 — Cartão de visita  ⭐

Complete o arquivo [ex01-cartao.cbl](ex01-cartao.cbl) para exibir **exatamente**:

```
******************************
*  CARTAO DE VISITA          *
*  NOME: ALAN TURING         *
*  PROFISSAO: PROGRAMADOR    *
*  LINGUAGEM: COBOL          *
******************************
```

Regras:
- Use um `DISPLAY` por linha.
- Todas as linhas têm **30 caracteres** (conte os espaços antes do `*` da direita!).
- Coloque um comentário no topo com seu nome e a data.

---

## Ex02 — Caça aos erros  ⭐⭐

O programa [ex02-cace-os-erros.cbl](ex02-cace-os-erros.cbl) foi escrito
às pressas e **não compila**. Ele tem **7 erros**.

Sua missão: corrigir até que ele compile e exiba:

```
=== RELATORIO DO DIA ===
SISTEMA: ATIVO
USUARIOS CONECTADOS: 3
FIM DO RELATORIO
```

Regras:
- **Não reescreva o programa do zero.** Corrija só o que está errado.
- Faça uma correção por vez, compilando entre elas, e leia a mensagem do
  compilador com atenção. Repare que ela às vezes aponta a linha *seguinte*
  ao erro de verdade.
- Ao lado de cada correção, deixe um comentário `*> CORRIGIDO: ...`
  explicando o que estava errado.

> Dica: um dos erros é invisível a olho nu. Ele tem a ver com a **coluna 72**.

---

## Ex03 — Desenho com DISPLAY  ⭐⭐

Complete [ex03-casinha.cbl](ex03-casinha.cbl) para desenhar:

```
    /\
   /  \
  /    \
 /______\
 |  []  |
 |______|
```

Regras:
- Os espaços **à esquerda** fazem parte do desenho.
- **Desafio extra:** monte pelo menos 2 linhas do desenho usando
  vários `DISPLAY ... WITH NO ADVANCING` (por exemplo, um para as
  paredes e outro para a janela). O `verificar.sh` não confere isso,
  mas o seu professor confere 😉

---

## Perguntas de reflexão

Responda num arquivo `respostas.txt` (ou num caderno):

1. O que acontece se você tirar o `STOP RUN.` de um programa? Teste e explique.
2. Por que você acha que o COBOL foi criado com regras de **coluna**?
3. O GnuCOBOL aceita `DISPLAY` começando na coluna 8 (Área A). Mude isso
   num exemplo e confirme. Agora pesquise: o compilador IBM do mainframe
   aceitaria? Por que é bom manter o hábito certo mesmo assim?
4. Qual a diferença entre um **comando** e uma **sentença**?
