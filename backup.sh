#!/bin/bash
## To periodically call a command put this into /etc/crontab
#59 20   * * *   root    /home/minecraft/World/backup.sh

echo "Parando Minecraft"
systemctl stop minecraft.service
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
systemctl start minecraft.service
echo "Finalizado"
