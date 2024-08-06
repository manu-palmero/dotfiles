#!/bin/bash

# Comprobar si el proceso "waybar" está en ejecución
if pgrep -x "waybar" > /dev/null
then
    notify-send "Waybar" "El proceso 'waybar' está en ejecución. Reiniciándolo..."
    pkill -x "waybar"
    waybar &
else
    notify-send "Waybar" "El proceso 'waybar' no está en ejecución. Iniciándolo..."
    waybar &
fi