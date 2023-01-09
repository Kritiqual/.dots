export KEYTIMEOUT=20

#> BELOW NEED REWRITE
bindkey -v

# sed -e '/pattern/ s|^#*|#|' -i file
# sed -i 'range_start,range_end{s|^#*|#|;}' file
bindkey -s "\er" "rl!\n"
bindkey -s "\ep" "pacman_fzf\n"
bindkey -s "\ee" "ranger\n"
bindkey -s "\en" "ncmpcpp\n"
bindkey -s "\ez" "__zoxide_zi\n"
bindkey -s "\ev" "nvim\n"

if [[ ! -d "$ZI[PLUGINS_DIR]/Aloxaf--fzf-tab" ]]; then
    zmodload zsh/complist
    bindkey -M menuselect '^M' .accpet-line
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
fi

omzkbd="$ZI[SNIPPETS_DIR]/OMZL::key-bindings.zsh/OMZL::key-bindings.zsh"
if [[ -f $omzkbd ]]; then
    sed -i '7,16{s|^#*|# |;}' $omzkbd
    sed -i 's|^bindkey -e|bindkey -v|' $omzkbd
    sed -i '/kill-region/ s|^#*|# |' $omzkbd
    sed -e '/history-inc/ s|^#*|# |' -i $omzkbd
    sed -e '/magic-sp/ s|^#*|# |' -i $omzkbd
    sed -e '/copy-prev/ s|^#*|# |' -i $omzkbd
fi
unset omzkbd
