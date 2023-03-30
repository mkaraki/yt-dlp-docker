#!/bin/bash

echo "Updating packages"
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
pip install --upgrade yt-dlp > /dev/null

yt-dlp $*
