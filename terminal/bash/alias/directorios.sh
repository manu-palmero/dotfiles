# Comandos para directorios

if command -v exa >/dev/null 2>&1; then
    alias ls='exa -F -alhmg --git'
	alias lt='exa -F -almg --git -T -L' # Uso: lt [num] | ejemplo: lt 1 lt 2 
elif command -v eza >/dev/null 2>&1; then
    alias ls='eza -F -alhmg --git'
	alias lt='eza -F -almg --git -T -L' # Uso: lt [num] | ejemplo: lt 1 lt 2 
else
    alias ls='ls -F -alhmg --color=auto'
fi

alias cd='z'

alias dir='dir --color=auto'

alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'

# Saltos a directorios
alias dotfiles='cd ~/dotfiles'
