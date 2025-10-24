#!/bin/bash
alias python='python3'
alias pip='python3 -m pip'
alias ffmpeg='ffmpeg -hide_banner'

# Cuando el comando exa no esté disponible
alias exa="eza"

alias prepcam="sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 devices=1 && pkill gphoto"

alias dslrcamraw="gphoto2 --stdout --capture-movie | ffmpeg -i - -s 640x480 -b:v 1k -c:v rawvideo -pix_fmt yuv420p -threads 1 -f v4l2 /dev/video0"

alias dslrcamvp8="gphoto2 --stdout --capture-movie | ffmpeg -i - -s 640x480 -b:v 1k -c:v vp8 -cpu-used 8 -threads 1 -f v4l2 /dev/video0"
#alias dslrcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -s 640x480 -b:v 1k -vcodec rawvideo -pix_fmt yuv420p -threads 1 -f v4l2 /dev/video0"

alias icat="kitten icat"

alias fastanime="fastanime --icons --fzf --preview --sub anilist"

alias crd="/opt/google/chrome-remote-desktop/chrome-remote-desktop"
