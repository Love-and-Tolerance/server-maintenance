#!/usr/bin/env bash

NEW_BUILD=$(curl -s -L https://github.com/DiscordSRV/DiscordSRV/releases/latest | grep "\"/\S\+\.jar\"" | awk -F / '{print $6}' | tr -d v)
CURRENT_BUILD=$(cat ./current-discordsrv-build-id)

if [ "$NEW_BUILD" = "$CURRENT_BUILD" ]
then
    echo Build number "$CURRENT_BUILD" is up to date.
else
    wget --output-document=discordsrv.jar https://github.com/DiscordSRV/DiscordSRV/releases/download/v"$NEW_BUILD"/DiscordSRV-Build-"$NEW_BUILD".jar
    echo "$NEW_BUILD" > current-discordsrv-build-id
fi
