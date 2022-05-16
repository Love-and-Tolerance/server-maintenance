#!/usr/bin/env bash

sudo apt install vi jq screen

mkdir -p /media/velvetremedy/Server-Backups/backups/{creative,survival,zip-dir}
mkdir -p /home/velvetremedy/Minecraft/{creative,survival,scripts}


EDITOR=vi;
export EDITOR
SCREEN=$(echo screen -S cronjob -X stuff)
LOCATION=$(echo /home/velvetremedy/test/)

screen -Sdm cronjob
$SCREEN "crontab -e"\\n
$SCREEN ":inoremap jj <Esc>"\\n
$SCREEN "G"\\n
$SCREEN "o"\\n
$SCREEN "0 8 * * * "$LOCATION"scheduled-update.sh"\\n
$SCREEN "* * * * * "$LOCATION"scheduled-maintenance.sh"\\n
$SCREEN "jj"\n
$SCREEN ":wq"\\n
screen -S cronjob -X quit
crontab -l | awk '!x[$0]++' | crontab -
