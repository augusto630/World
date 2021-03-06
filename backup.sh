#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#cd $DIR
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
## To periodically call a command put this into /etc/crontab
#59 20   * * *   root    /home/minecraft/World/backup.sh

echo "Parando Minecraft"
systemctl stop minecraft.service >>/home/minecraft/backup.log 2>&1
sleep 5

echo "Iniciando Backup"

cd /home/minecraft/World 

COMMIT_COUNT=`git rev-list HEAD --count`
COMMIT_COUNT=$(($COMMIT_COUNT+1))

echo "Adicionando novos arquivos"
git add . >> /home/minecraft/backup.log 2>&1
git commit -m "Auto-Backup $COMMIT_COUNT" >> /home/minecraft/backup.log 2>&1

echo "Enviando..."
git push -u origin master >> /home/minecraft/backup.log 2>&1

#echo "Iniciando Minecraft"
systemctl start minecraft.service >> /home/minecraft/backup.log 2>&1
echo "Finalizado"
