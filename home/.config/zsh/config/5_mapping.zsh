export KEYTIMEOUT=20

if [[ ! -d "$ZI[PLUGINS_DIR]/Aloxaf--fzf-tab" ]]; then
    zmodload zsh/complist
    bindkey -M menuselect '^M' .accpet-line
    bindkey -M menuselect 'h' vi-backward-char
    bindkey -M menuselect 'j' vi-down-line-or-history
    bindkey -M menuselect 'k' vi-up-line-or-history
    bindkey -M menuselect 'l' vi-forward-char
fi

file="$ZI[SNIPPETS_DIR]/OMZL::key-bindings.zsh/OMZL::key-bindings.zsh"
if [[ -f $file ]]; then
    sed -i 's|^bindkey -e|bindkey -v|' $file
    sed -e '/kill-region/ s|^#*|#|' -i $file
    sed -e '/history-inc/ s|^#*|#|' -i $file
    sed -e '/magic-sp/ s|^#*|#|' -i $file
    sed -e '/copy-prev/ s|^#*|#|' -i $file
fi
