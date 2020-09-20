#!/bin/bash

set -e

if [ "${TARGET}" = "macos" ]; then
    exit 0
fi

if [ "${TARGET}" = "win32" ]; then
    sudo dpkg --add-architecture i386
fi

if [ "${TARGET}" = "win32" ] || [ "${TARGET}" = "win64" ]; then
    wget -qO- https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
    sudo apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
fi

sudo apt-get update -qq
