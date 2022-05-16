#!/usr/bin/env bash

SERVER=$1

if [ "$SERVER" != "survival" -a "$SERVER" != "creative" ]; then
    exit;
fi

DATE=$(date +%Y-%m-%d-%k-%M-%S)
SAVE_LOCATION=$(echo /media/velvetremedy/Server-Backups/backups/"$SERVER"/)

tar -cf - -P /home/velvetremedy/Minecraft/"$SERVER" | xz -z0cT8 - > ""$SAVE_LOCATION"Backup-"$DATE".txz"

BACKUPS=$(ls "$SAVE_LOCATION" | wc -l)
SIZE=$(ls -la "$SAVE_LOCATION" | awk '{sum += $5} END {printf "%d\n", sum / 1024 / 1024 / 1024}')

until [ $BACKUPS -lt 50 -a $SIZE -lt 500 -o $BACKUPS -le 10 ]; do

BACKUPS=$(ls "$SAVE_LOCATION" | wc -l)
OLDEST=$(ls -t "$SAVE_LOCATION" | awk 'END{print}')
SIZE=$(ls -la "$SAVE_LOCATION" | awk '{sum += $5} END {printf "%d\n", sum / 1024 / 1024 / 1024}')

rm "$SAVE_LOCATION""$OLDEST"
done
