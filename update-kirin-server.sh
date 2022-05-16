#!/usr/bin/env bash

MC_VERSION=$(cat './variables/mc-version')
SERVER_DIR=$(echo "/home/velvetremedy/Minecraft/test1")
PLUGIN_DIR=$(echo ""$SERVER_DIR"/mods/")


# Fabric

FABRIC_VERSION_STAGED=$(cat './variables/fabric-staged')
FABRIC_VERSION_ACTIVE=$(cat './variables/fabric-active')

if [ "$FABRIC_VERSION_STAGED" != "$FABRIC_VERSION_ACTIVE" ]; then
	java -jar './downloads/fabric-installer.jar' server -dir "$SERVER_DIR" -mcversion "$MC_VERSION" -downloadMinecraft
	echo "$FABRIC_VERSION_STAGED" > './variables/fabric-active'
    rm './downloads/fabric-installer.jar'
fi


# Fabric API

FABRIC_API_VERSION_STAGED=$(cat './variables/fabric-api-staged')
FABRIC_API_VERSION_ACTIVE=$(cat './variables/fabric-api-active')

if [ "$FABRIC_API_VERSION_STAGED" != "$FABRIC_API_VERSION_ACTIVE" ]; then
    mv -f './downloads/fabric-api.jar' "$PLUGIN_DIR"
    echo "$FABRIC_API_VERSION_STAGED" > './variables/fabric-api-active'
fi


# Hydrogen

HYDROGEN_VERSION_STAGED=$(cat './variables/hydrogen-staged')
HYDROGEN_VERSION_ACTIVE=$(cat './variables/hydrogen-active')

if [ "$HYDROGEN_VERSION_STAGED" != "$HYDROGEN_VERSION_ACTIVE" ]; then
    mv -f './downloads/hydrogen.jar' "$PLUGIN_DIR"
    echo "$HYDROGEN_VERSION_STAGED" > './variables/hydrogen-active'
fi


# Lithium

LITHIUM_VERSION_STAGED=$(cat './variables/lithium-staged')
LITHIUM_VERSION_ACTIVE=$(cat './variables/lithium-active')

if [ "$LITHIUM_VERSION_STAGED" != "$LITHIUM_VERSION_ACTIVE" ]; then
    mv -f './downloads/lithium.jar' "$PLUGIN_DIR"
    echo "$LITHIUM_VERSION_STAGED" > './variables/lithium-active'
fi


# Sodium

SODIUM_VERSION_STAGED=$(cat './variables/sodium-staged')
SODIUM_VERSION_ACTIVE=$(cat './variables/sodium-active')

if [ "$SODIUM_VERSION_STAGED" != "$SODIUM_VERSION_ACTIVE" ]; then
    mv -f './downloads/sodium.jar' "$PLUGIN_DIR"
    echo "$SODIUM_VERSION_STAGED" > './variables/sodium-active'
fi
