function fish_prompt_modern --description 'Prompt modernizado inspirado en bash con Git'
    set -l last_status $status
    
    # Colores
    set -l prompt_color (set_color green)
    set -l info_color (set_color brblue)
    set -l reset_color (set_color normal)
    set -l prompt_symbol '@'
    
    # Cambiar colores para root
    if test "$USER" = root
        set prompt_color (set_color brblue)
        set info_color (set_color brred)
        set prompt_symbol '💀'
    end
    
    # Línea superior: ┌──[usuario] @ [hostname]─[directorio]|git
    echo -n $prompt_color'┌──'
    
    # debian_chroot (si existe)
    if test -n "$debian_chroot"
        echo -n "($debian_chroot)──"
    end
    
    # virtualenv
    if test -n "$VIRTUAL_ENV"
        echo -n '('(set_color --bold)(basename "$VIRTUAL_ENV")$prompt_color')'
    end
    
    # [usuario] @ [hostname]
    echo -n '['$info_color(whoami)$prompt_color']'$info_color' '$prompt_symbol' '$prompt_color
    echo -n '['$info_color(prompt_hostname)$prompt_color']─'
    
    # [directorio actual]
    echo -n '['(set_color --bold)(prompt_pwd)$prompt_color']'
    
    # Segmento Git (usando fish_vcs_prompt) - mejorado
    set -q __fish_git_prompt_showdirtystate
    or set -g __fish_git_prompt_showdirtystate 1
    set -q __fish_git_prompt_showuntrackedfiles
    or set -g __fish_git_prompt_showuntrackedfiles 1
    set -q __fish_git_prompt_showupstream
    or set -g __fish_git_prompt_showupstream 'auto'
    set -q __fish_git_prompt_showstashstate
    or set -g __fish_git_prompt_showstashstate 1
    set -q __fish_git_prompt_showcolorhints
    or set -g __fish_git_prompt_showcolorhints 1
    
    # Símbolos usando Nerd Fonts con descripciones
    # set -q __fish_git_prompt_char_stateseparator
    # or set -g __fish_git_prompt_char_stateseparator ' '
    # set -q __fish_git_prompt_char_cleanstate
    # or set -g __fish_git_prompt_char_cleanstate ' ✓ limpio '
    # set -q __fish_git_prompt_char_dirtystate
    # or set -g __fish_git_prompt_char_dirtystate ' ✗ modificado '
    # set -q __fish_git_prompt_char_stagedstate
    # or set -g __fish_git_prompt_char_stagedstate ' ● preparado '
    # set -q __fish_git_prompt_char_untrackedfiles
    # or set -g __fish_git_prompt_char_untrackedfiles ' … sin seguimiento '
    # set -q __fish_git_prompt_char_stashstate
    # or set -g __fish_git_prompt_char_stashstate ' ⚑ guardado '
    # set -q __fish_git_prompt_char_upstream_ahead
    # or set -g __fish_git_prompt_char_upstream_ahead ' ↑ adelantado '
    # set -q __fish_git_prompt_char_upstream_behind
    # or set -g __fish_git_prompt_char_upstream_behind ' ↓ atrasado '
    # set -q __fish_git_prompt_char_upstream_diverged
    # or set -g __fish_git_prompt_char_upstream_diverged ' ⇅ divergido '

        # Símbolos usando Nerd Fonts con descripciones detalladas
    set -q __fish_git_prompt_char_stateseparator
    or set -g __fish_git_prompt_char_stateseparator ' '
    set -q __fish_git_prompt_char_cleanstate
    or set -g __fish_git_prompt_char_cleanstate ' ✓ árbol de trabajo limpio '
    set -q __fish_git_prompt_char_dirtystate
    or set -g __fish_git_prompt_char_dirtystate ' ✗ cambios sin confirmar '
    set -q __fish_git_prompt_char_stagedstate
    or set -g __fish_git_prompt_char_stagedstate ' ● cambios listos para commit '
    set -q __fish_git_prompt_char_untrackedfiles
    or set -g __fish_git_prompt_char_untrackedfiles ' archivos sin rastrear '
    set -q __fish_git_prompt_char_stashstate
    or set -g __fish_git_prompt_char_stashstate ' ⚑ cambios guardados en stash '
    set -q __fish_git_prompt_char_upstream_ahead
    or set -g __fish_git_prompt_char_upstream_ahead ' ↑ commits por enviar '
    set -q __fish_git_prompt_char_upstream_behind
    or set -g __fish_git_prompt_char_upstream_behind ' ↓ commits por recibir '
    set -q __fish_git_prompt_char_upstream_diverged
    or set -g __fish_git_prompt_char_upstream_diverged ' ⇅ ramas divergentes '

    fish_vcs_prompt ' | %s'
    
    # Nueva línea
    echo
    
    # Línea inferior: └─➤
    if test $last_status -eq 0
        echo -n $prompt_color'└─'$info_color'➤ '$reset_color
    else
        echo -n $prompt_color'└─'(set_color $fish_color_error)'➤ '$reset_color
    end
end
