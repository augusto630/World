#!/bin/bash

echo "Iniciando Backup"

COMMIT_COUNT=`git rev-list HEAD --count`
COMMIT_COUNT=$(($COMMIT_COUNT+1))

echo "Adicionando novos arquivos"
git add .
git commit -m "Backup $COMMIT_COUNT"

echo "Enviando..."
git push -u origin master

echo "Finalizado"
