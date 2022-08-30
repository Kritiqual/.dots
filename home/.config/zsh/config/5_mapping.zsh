zmodload zsh/complist
bindkey -M menuselect '^M' .accpet-line
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

zle -N sudo-command-line
bindkey -M emacs '\ez' sudo-command-line
bindkey -M vicmd '\ez' sudo-command-line
bindkey -M viins '\ez' sudo-command-line
