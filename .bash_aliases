
alias python='python3.11'
alias pip='python3.11 -m pip'

# alias ls='exa -F -AhMO --git --git-repos --no-time'
alias ls='exa -F -AlhMO --git --git-repos --no-time'
alias la='ls -A'
alias l='ls -CF'

alias dir='dir --color=auto'

alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
