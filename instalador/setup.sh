#!/bin/bash

archivo_programas="programas.txt"
bashrc="$HOME/.bashrc"
zshrc="$HOME/.zshrc"
IFS=$'\n'
dir="$(readlink -f "$0")"
programasNoInstalados=()

echo "Ejecutando el instalador desde $dir"

# Leer la información del chasis
CHASSIS_TYPE=$(cat /sys/class/dmi/id/chassis_type 2>/dev/null)
PRODUCT_NAME=$(cat /sys/class/dmi/id/product_name 2>/dev/null)

# Determinar si es un portátil o un sobremesa
if [[ "$CHASSIS_TYPE" == "9" || "$CHASSIS_TYPE" == "10" || "$CHASSIS_TYPE" == "14" ]]; then
    echo "Este es un portátil."
elif [[ "$PRODUCT_NAME" =~ "Laptop" || "$PRODUCT_NAME" =~ "Portable" ]]; then
    echo "Este es un portátil."
else
    echo "Este es un ordenador de sobremesa."
fi

# Importar funciones
for funcs in "$PUNTOS/terminal/funciones/"*; do
    if [ -f "$funcs" ]; then
        . "$funcs"
    fi
done

if [ ! $dir = "$HOME/dotfiles/instalador/setup.sh" ]; then
    echo "El directorio actual es $dir, se creará un nuevo directorio $HOME/dotfiles/ y se copiarán los archivos necesarios."
    echo "Por favor, ejecuta este archivo desde esa ubicación."
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar..."
    rm -rf $HOME/dotfiles/ > /dev/null
    mkdir -p $HOME/dotfiles/
    cp -r * $HOME/dotfiles/
    exit 1
fi

clear

echo " "
echo " "
echo " "
echo "Instalación de programas necesarios..."

if [ -f "$archivo_programas" ]; then
    mapfile -t programas < "$archivo_programas"
    echo "Lista de programas:"
    for programa in "${programas[@]}"; do
        echo "  $programa"
    done
else
    echo "El archivo $archivo_programas no existe." >&2
    exit 1
fi
for programa in "${programas[@]}"; do
    if instalado "$programa"; then
        echo "$programa está instalado."
    else
        programasNoInstalados+=("$programa")
    fi
done

echo "Comprobando los programas faltantes..."

if [ ${#programasNoInstalados[@]} -gt 0 ]; then
    echo "Faltan algunos programas necesarios para que el código funcione correctamente: "
    for programa in "${programasNoInstalados[@]}"; do
        echo "  $programa no está instalado"
    done
    if siono "Desea instalarlos?" "s"; then
        echo "Instalando..."
    else
        echo "Cancelando..." >&2
        exit 1
    fi
    for programa in "${programasNoInstalados[@]}"; do
        instalar "$programa"
    done
else
    echo "No faltan programas"
fi



#ln .dotfiles/.bashrc .bashrc -s

echo -e "Proceso completado. \n"