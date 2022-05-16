#!/usr/bin/env bash

pgrep -f paper-1.17-79.jar > /dev/null
until [ $? -eq 0 ]; do pgrep -f paper-1.17-79.jar > /dev/null; done
