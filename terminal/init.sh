# Alias 
for aliases in "$PUNTOS/terminal/alias/"*; do
    if [ -f "$aliases" ]; then
        . "$aliases"
    fi
done

# Directorios
for dirs in "$PUNTOS/terminal/dirs/"*; do
    if [ -f "$dirs" ]; then
        . "$dirs"
    fi
done

# Funciones
for funcs in "$PUNTOS/terminal/funciones/"*; do
    if [ -f "$funcs" ]; then
        . "$funcs"
    fi
done