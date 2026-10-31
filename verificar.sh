#!/usr/bin/env bash
# ------------------------------------------------------------------
# verificar.sh - testa a sua solucao de um exercicio
#
# Uso:  ./verificar.sh 03-operacoes-aritmeticas/exercicios/ex01-calculadora.cbl
#
# Para o exercicio "exNN-....cbl" o script procura, na pasta
# exercicios/testes/, os arquivos:
#     exNN-casoK.entrada   -> o que sera "digitado" no ACCEPT
#     exNN-casoK.esperado  -> o que o programa deve exibir
# e compara a saida do seu programa com a esperada.
#
# Espacos no FINAL das linhas sao ignorados na comparacao.
# ------------------------------------------------------------------
set -u

if [ $# -lt 1 ]; then
  echo "Uso: $0 caminho/do/exercicio.cbl"
  exit 1
fi

FONTE="$1"
if [ ! -f "$FONTE" ]; then
  echo "Arquivo nao encontrado: $FONTE"
  exit 1
fi

RAIZ="$(cd "$(dirname "$0")" && pwd)"
DIR="$(cd "$(dirname "$FONTE")" && pwd)"
NOME="$(basename "$FONTE" .cbl)"
ID="${NOME%%-*}"                 # ex01-calculadora -> ex01
TESTES="$DIR/testes"
EXE="$RAIZ/bin/$NOME"
mkdir -p "$RAIZ/bin"

COB_CFLAGS="$(env -u COB_CFLAGS cobc --info | sed -n 's/^COB_CFLAGS *: *//p' | head -n 1 | sed 's/-D_FORTIFY_SOURCE=[0-9]//')"
export COB_CFLAGS

echo "Compilando $FONTE ..."
if ! cobc -x -Wall -o "$EXE" "$FONTE"; then
  echo ""
  echo "ERRO DE COMPILACAO - corrija antes de testar."
  exit 1
fi

shopt -s nullglob
CASOS=("$TESTES/$ID"-caso*.esperado)
if [ ${#CASOS[@]} -eq 0 ]; then
  echo "Nenhum caso de teste encontrado para $ID em $TESTES"
  echo "(este exercicio e de verificacao manual - veja o README)"
  exit 0
fi

OK=0
FALHA=0
for ESPERADO in "${CASOS[@]}"; do
  CASO="$(basename "$ESPERADO" .esperado)"
  ENTRADA="$TESTES/$CASO.entrada"
  [ -f "$ENTRADA" ] || ENTRADA=/dev/null

  OBTIDO="$(timeout 5 "$EXE" < "$ENTRADA" 2>&1)"
  if [ $? -eq 124 ]; then
    echo "[FALHOU] $CASO - o programa demorou demais (laco infinito?)"
    FALHA=$((FALHA + 1))
    continue
  fi

  if diff -Z <(printf '%s\n' "$OBTIDO") "$ESPERADO" > /tmp/verificar_diff.txt; then
    echo "[  OK  ] $CASO"
    OK=$((OK + 1))
  else
    echo "[FALHOU] $CASO"
    echo "   Entrada usada: $ENTRADA"
    echo "   Diferencas ( < seu programa | > esperado ):"
    sed 's/^/      /' /tmp/verificar_diff.txt
    FALHA=$((FALHA + 1))
  fi
done

echo ""
echo "Resultado: $OK passou, $FALHA falhou."
[ $FALHA -eq 0 ] && echo "Parabens! Agora releia seu codigo: da para deixar mais claro?"
[ $FALHA -eq 0 ]
