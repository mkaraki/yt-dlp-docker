#!/bin/bash

echo "Updating packages"
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
pip install --upgrade pip yt-dlp > /dev/null

if [[ "$1" == "yt-dlp" ]] ; then
  shift 1
fi

yt-dlp "$@"
ytdlp_exit_code=$?

if [[ $ytdlp_exit_code -ne 0 ]] ; then
    exit $ytdlp_exit_code
fi
