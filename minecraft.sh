#!/bin/bash
## To install as service
## Create file 
#nano /etc/systemd/system/minecraft.service
## With content
#
#[Unit]
#Desription=Minecraft service
#After=network.target
#
#[Service]
#ExecStart=/home/minecraft/World/minecraft.sh
#Restart=always
#
#[Install]
#WantedBy=multi-user.target
#
## Run Commands
#systemctl enable minecraft.service
#systemctl daemon-reload
#systemctl start minecraft.service

cd /home/minecraft/World/server
java -Xmx1848M -Xms1848M -jar minecraft_server.jar nogui
