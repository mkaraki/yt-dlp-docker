#!/bin/bash

apt-get update
apt-get upgrade -y
pip install --upgrade yt-dlp

yt-dlp $*
