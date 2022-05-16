#!/usr/bin/env bash

DATE=$(date +%Y-%m-%d-%k-%M-%S)
DOWNTIME=$( (time './kirin-maintenance-timer.sh') |& awk 'NR==2{print $2}' | sed 's/m/ minutes and /g;s/\.[0-9]*s/ seconds./g')
echo ""$DATE": The kirin server went offline for maintenance and was down for "$DOWNTIME"" >> kirin-maintenance.log
