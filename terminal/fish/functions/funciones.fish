function transfer
    if test (count $argv) -eq 0
        echo -e "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>" >&2
        return 1
    end

    # Si hay datos por stdin: ... | transfer <file_name>
    if test -p /dev/stdin
        set -l file_name $argv[1]
        cat - | curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null
        return $status
    end

    # Modo archivo/directorio
    set -l file $argv[1]
    set -l file_name (basename $file)

    if not test -e $file
        echo "$file: No such file or directory" >&2
        return 1
    end

    if test -d $file
        set file_name "$file_name.zip"
        pushd $file >/dev/null
        zip -r -q - . | curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null
        set -l code $status
        popd >/dev/null
        return $code
    else
        cat $file | curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null
    end
end

function instalado
    pacman -Qs $argv[1] > /dev/null
end

function instalar
    echo "Instalando $argv[1]..."
    sudo pacman -S --noconfirm $argv[1] > /dev/null
end

function siono
    set -l mensaje $argv[1]
    set -l default $argv[2]
    set -l s s
    set -l n n

    if test "$default" = "$s"
        set s (string upper $s)
    else
        set n (string upper $n)
    end

    set -l opcion "[$s/$n]"
    read -n 1 -P "$mensaje $opcion: " respuesta
    if test -z "$respuesta"
        set respuesta $default
    end

    if string match -qr '^[Ss]$' -- $respuesta
        echo
        return 0
    else
        echo
        return 1
    end
end
