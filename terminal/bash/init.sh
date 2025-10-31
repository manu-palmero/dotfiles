# Alias 
for aliases in "$PUNTOS/terminal/bash/alias/"*; do
    if [ -f "$aliases" ]; then
        . "$aliases"
    fi
done

# Directorios
for dirs in "$PUNTOS/terminal/bash/dirs/"*; do
    if [ -f "$dirs" ]; then
        . "$dirs"
    fi
done

# Funciones
for funcs in "$PUNTOS/terminal/bash/funciones/"*; do
    if [ -f "$funcs" ]; then
        . "$funcs"
    fi
done

# Entorno
for envvs in "$PUNTOS/terminal/bash/exports/"*; do
    if [ -f "$envvs" ]; then
        . "$envvs"
    fi
done
