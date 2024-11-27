export KEYTIMEOUT=20
bindkey -v

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\eE' edit-command-line

# sed -e '/pattern/ s|^#*|#|' -i file
# sed -i 'range_start,range_end{s|^#*|#|;}' file
bindkey -s "\er" "rl!\n"
bindkey -s "\ep" "pacman_fzf\n"
bindkey -s "\ee" "ranger\n"
bindkey -s "\en" "ncmpcpp\n"
bindkey -s "\ez" "__zoxide_zi\n"
bindkey -s "\ev" "nvim\n"
bindkey -s "\el" "ls\n"

function bindings() {
    bindkey -M emacs "${1}" $2
    bindkey -M viins "${1}" $2
    bindkey -M vicmd "${1}" $2
}

# [PageUp/PageDown] - Up/Down a line of history
if [[ -n "${terminfo[kpp]}" ]]; then
    bindings "${terminfo[kpp]}" up-line-or-history
fi
if [[ -n "${terminfo[knp]}" ]]; then
    bindings "${terminfo[knp]}" down-line-or-history
fi

# Start typing + [Up/Down] - fuzzy find history forward/backward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindings "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
    bindings "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindings "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
    bindings "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# [Home/End] - Go to beginning/end of line
if [[ -n "${terminfo[khome]}" ]]; then
    bindings "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
    bindings "${terminfo[kend]}" end-of-line
fi

# [Shift-Tab] - move through the completion menu backwards
if [[ -n "${terminfo[kcbt]}" ]]; then
    bindings "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Backspace] - delete backward
bindings "^?" backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
    bindings "${terminfo[kdch1]}" delete-char
else
    bindings "^[[3~" delete-char
    bindings "^[3;5~" delete-char
fi
bindings "^[[3;5~" kill-word

# [Ctrl-Right/Left] - move forward/backward one word
bindings "^[[1;5C" forward-word
bindings "^[[1;5D" backward-word

# if [[ ! -d "$ZI[PLUGINS_DIR]/Aloxaf--fzf-tab" ]]; then
#     zmodload zsh/complist
#     bindkey -M menuselect '^M' .accept-line
#     bindkey -M menuselect 'h' vi-backward-char
#     bindkey -M menuselect 'j' vi-down-line-or-history
#     bindkey -M menuselect 'k' vi-up-line-or-history
#     bindkey -M menuselect 'l' vi-forward-char
# fi
