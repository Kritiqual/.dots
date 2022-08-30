zmodload zsh/curses

setopt autocd cdable_vars autopushd pushd_minus pushd_ignore_dups pushd_to_home promptsubst
setopt auto_list extended_glob globdots nocorrect nocorrect_all multios menu_complete interactive_comments
setopt append_history extended_history bang_hist hist_verify share_history \
    inc_append_history hist_save_no_dups hist_expire_dups_first hist_find_no_dups \
    hist_ignore_dups hist_ignore_all_dups hist_ignore_space hist_reduce_blanks

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
