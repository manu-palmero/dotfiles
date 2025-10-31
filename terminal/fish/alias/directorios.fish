# Comandos para directorios

## Useful aliases
# Replace ls with eza
# alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
# alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
# alias ll='eza -l --color=always --group-directories-first --icons'  # long format
# alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
# alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles


if type -q exa
    alias ls 'exa --color=always --group-directories-first --icons -F -lhmg --git'
    alias la 'exa --color=always --group-directories-first --icons -F -alhmg --git'
    alias lt 'exa --color=always --group-directories-first --icons -F -lmg --git -T'
    alias lT 'exa --color=always --group-directories-first --icons -F -lmg --git -T -L' # Uso: lT [num] | ejemplo: lt 1 lt 2
    alias l.="la | grep -e '^\.'"  
else if type -q eza
    alias ls 'eza --color=always --group-directories-first --icons -F -lhmg --git'
    alias la 'eza --color=always --group-directories-first --icons -F -alhmg --git'
    alias lt 'eza --color=always --group-directories-first --icons -F -lmg --git -T'
    alias lT 'eza --color=always --group-directories-first --icons -F -lmg --git -T -L' # Uso: lT [num] | ejemplo: lt 1 lt 2
    alias l.="la | grep -e '^\.'"  
else
    alias ls 'ls -F -alhmg --color=auto'
end

# Si prefieres que cd apunte a z (zoxide ya reemplaza cd con --cmd=cd)
# alias cd 'z'

alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'

alias grep 'grep --color=auto'
alias fgrep 'grep -F --color=auto'
alias egrep 'grep -E --color=auto'

# Saltos a directorios
alias dotfiles 'cd ~/Documentos/dotfiles'
