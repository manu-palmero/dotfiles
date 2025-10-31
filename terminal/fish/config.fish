source /usr/share/cachyos-fish-config/cachyos-config.fish

# Definir PUNTOS si no está definido (con fallback)
if not set -q PUNTOS
    if test -d "$HOME/.dotfiles"
        set -gx PUNTOS "$HOME/.dotfiles"
    else if test -d "$HOME/Documents/dotfiles"
        set -gx PUNTOS "$HOME/Documents/dotfiles"
    end
end

# Habilitar funciones desde dotfiles
if test -d "$PUNTOS/terminal/fish/functions"
    set -a fish_function_path "$PUNTOS/terminal/fish/functions"
end

# Cargar init de fish (alias, dirs, funciones, exports en sintaxis fish)
if test -f "$PUNTOS/terminal/fish/init.fish"
    source "$PUNTOS/terminal/fish/init.fish"
end

# ---- Configuración de historial (equivalente a bash) ----
# Evitar duplicados en el historial
set -g fish_history_ignoredups true

# Tamaño del historial (equivalente a HISTSIZE y HISTFILESIZE)
set -g fish_history_max_entries 1000
set -g fish_history_save_max 2000

# ---- Completions (si no están cargadas por CachyOS) ----
# Fish carga completions automáticamente, no necesita configuración extra

# ---- Configuración del título de ventana (xterm/rxvt) ----
function fish_title
    if test -n "$debian_chroot"
        echo -n "($debian_chroot)"
    end
    echo -n (whoami)'@'(prompt_hostname)': '(prompt_pwd)
end

# ---- Lógica copiada/adaptada desde bashrc ----

# PATH de LM Studio CLI
if test -d "$HOME/.lmstudio/bin"
    if not contains -- "$HOME/.lmstudio/bin" $PATH
        set -gx PATH $PATH "$HOME/.lmstudio/bin"
    end
end

# lesspipe (aproximación a eval "$(SHELL=/bin/sh lesspipe)")
if type -q lesspipe
    set -gx LESSOPEN "| /usr/bin/lesspipe %s"
    set -gx LESS_ADVANCED_PREPROCESSOR 1
end

# fastfetch al iniciar la shell
# if type -q fastfetch
#     fastfetch
# end

# ---------------------------------------------

# Activar prompt modernizado (inspirado en bash)
# Desactivar el fish_prompt anterior y usar fish_prompt_modern
function fish_prompt
    fish_prompt_modern
end

# Desactivar greeting por defecto (fastfetch ya se ejecuta arriba)
function fish_greeting
end

zoxide init --cmd=cd fish | source
