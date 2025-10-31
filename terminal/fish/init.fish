# Alias
for aliases in $PUNTOS/terminal/fish/alias/*.fish
    if test -f $aliases
        source $aliases
    end
end

# Directorios
for dirs in $PUNTOS/terminal/fish/dirs/*.fish
    if test -f $dirs
        source $dirs
    end
end

# Funciones
for funcs in $PUNTOS/terminal/fish/functions/*.fish
    if test -f $funcs
        source $funcs
    end
end

# Entorno
for envvs in $PUNTOS/terminal/fish/exports/*.fish
    if test -f $envvs
        source $envvs
    end
end
