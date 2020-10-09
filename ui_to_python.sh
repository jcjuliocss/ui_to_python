#!/bin/bash

NOME_UI="$1"
NOME_PY="$2"

# verifica se o parametro do nome do arquivo python foi passada, caso negativo assume o mesmo valor do .ui
if [ -z $NOME_PY ]
then
    NOME_PY="$NOME_UI"
fi

# verifica se nao tem .ui no nome passado como o arquivo de ui
if ! echo "$NOME_UI" | egrep '.ui' >/dev/null
then
    NOME_UI="$NOME_UI".ui
fi

# verifica se o arquivo .ui existe
if ! [ -e "$NOME_UI" ]
then
    echo "Parametro 1 deve ser o nome de um arquivo .ui existente na pasta atual."
    exit
fi

# verifica se nao tem .py no nome passado como o arquivo python
if ! echo "$NOME_PY" | egrep '.py' >/dev/null
then
    NOME_PY="$NOME_PY".py
fi

pyuic4 -x $NOME_UI -o $NOME_PY
