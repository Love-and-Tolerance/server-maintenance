#!/usr/bin/env bash

MC_VER=$(cat ./mc-version)
NEW_BUILD=$(curl -s https://papermc.io/api/v2/projects/paper/versions/"$MC_VER"/ | jq .builds[-1])
CURRENT_BUILD=$(cat ./current-paper-build-id)

if [ "$NEW_BUILD" -eq "$CURRENT_BUILD" ]
then
    echo Build number "$CURRENT_BUILD" is up to date.
else
    wget --output-document=paper.jar https://papermc.io/api/v2/projects/paper/versions/"$MC_VER"/builds/"$NEW_BUILD"/downloads/paper-"$MC_VER"-"$NEW_BUILD".jar
    echo "$NEW_BUILD" > current-paper-build-id
fi
