transfer(){
    if [ $# -eq 0 ]; then 
        echo -e "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;
        return 1;
    fi;
    if tty -s; then
        file="$1";file_name=$(basename "$file");
        if [ ! -e "$file" ];then 
            echo "$file: No such file or directory">&2;
            return 1;
        fi;
        if [ -d "$file" ];then
            file_name="$file_name.zip" ,;
            (cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;
        else 
            cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;
        fi;
    else 
        file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;
    fi;
}

instalado() {
    if pacman -Qs "$1" > /dev/null; then
        return 0
    else
        return 1
    fi
}

instalar() {
    echo "Instalando $1..."
    sudo pacman -S --noconfirm "$1" > /dev/null
}

siono() {
    mensaje="$1"
    default="$2"
    s="s"
    n="n"
    
    if [ $default = $s ]; then
        s=$(echo "$s" | tr '[:lower:]' '[:upper:]')
    else
        n=$(echo "$n" | tr '[:lower:]' '[:upper:]')
    fi

    opcion="[$s/$n]"
    read -rn1 -p "$mensaje $opcion: " respuesta 
    if [ -z "$respuesta" ]; then
        respuesta="$default"
    fi

    if [[ $respuesta =~ ^[Ss]$ || $respuesta = " " ]]; then
        echo ""
        return 0
    else
        echo ""
        return 1
fi
}
