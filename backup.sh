#!/bin/bash
#

echo "Parando Minecraft"
service minecraft stop
sleep 5

echo "Iniciando Backup"

COMMIT_COUNT=`git rev-list HEAD --count`
COMMIT_COUNT=$(($COMMIT_COUNT+1))

echo "Adicionando novos arquivos"
git add .
git commit -m "Auto-Backup $COMMIT_COUNT"

echo "Enviando..."
git push -u origin master

#echo "Iniciando Minecraft"
#service minecraft start
echo "Finalizado"
