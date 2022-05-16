#!/usr/bin/env bash

screen -S kirin -X stuff "stop"\\n
pgrep -f paper-1.17-79.jar > /dev/null
until [ $? -eq 1 ]; do pgrep -f paper-1.17-79.jar > /dev/null; done
screen -S kirin -X quit
