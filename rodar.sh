#!/usr/bin/env bash
# ------------------------------------------------------------------
# rodar.sh - compila e executa um programa COBOL
#
# Uso:  ./rodar.sh caminho/do/programa.cbl
#
# O executavel e gerado na pasta bin/ (que fica fora do git).
# Se o programa usa ACCEPT, digite os valores e tecle ENTER.
# Tambem da para mandar a entrada de um arquivo:
#       ./rodar.sh programa.cbl < entrada.txt
# ------------------------------------------------------------------
set -u

if [ $# -lt 1 ]; then
  echo "Uso: $0 caminho/do/programa.cbl"
  exit 1
fi

FONTE="$1"
if [ ! -f "$FONTE" ]; then
  echo "Arquivo nao encontrado: $FONTE"
  exit 1
fi

RAIZ="$(cd "$(dirname "$0")" && pwd)"
mkdir -p "$RAIZ/bin"
NOME="$(basename "$FONTE" .cbl)"
EXE="$RAIZ/bin/$NOME"

# Remove um aviso do compilador C que so atrapalha (nao e erro seu).
COB_CFLAGS="$(env -u COB_CFLAGS cobc --info | sed -n 's/^COB_CFLAGS *: *//p' | head -n 1 | sed 's/-D_FORTIFY_SOURCE=[0-9]//')"
export COB_CFLAGS

echo ">> Compilando $FONTE ..." >&2
if ! cobc -x -Wall -o "$EXE" "$FONTE"; then
  echo "" >&2
  echo ">> ERRO DE COMPILACAO. Leia a mensagem acima: ela diz a LINHA do problema." >&2
  exit 1
fi
echo ">> Executando:" >&2
echo "--------------------------------------------" >&2
"$EXE"
STATUS=$?
echo "--------------------------------------------" >&2
exit $STATUS
