source <(fzf --zsh)
export FZF_DEFAULT_COMMAND="fd -H -t f"
export FZF_ALT_C_COMMAND="fd -H -t d"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

D_CLR="\
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
--color=prompt:#50fa7b,pointer:#ff79c6,marker:#50fa7b \
--color=header:#6272a4,info:#ffb86c,spinner:#ffb86c,border:#8be9fd "
ED_CLR="\
--color=fg:#ffffff,bg:#191a2e,hl:#9b87fd \
--color=fg+:red,bg+:#44475a,hl+:#9b87fd \
--color=prompt:#20e3b2,pointer:#ff79c6,marker:#20e3b2 \
--color=header:#8d92ff,info:#ffb86c,spinner:#ffb86c,border:#2cccff "
FZF_BIND="--bind 'ctrl-alt-a:select-all,alt-a:clear-selection' \
--bind alt-z:toggle-preview,alt-x:refresh-preview,alt-w:toggle-preview-wrap \
--bind change:first,alt-y:first,alt-o:last,alt-u:preview-top,alt-i:preview-bottom,\
alt-j:preview-down,alt-k:preview-up,alt-h:preview-page-up,alt-l:preview-page-down"

export FZF_DEFAULT_OPTS="${ED_CLR} $FZF_BIND --exit-0 --select-1 --ansi \
--reverse --cycle --preview-window='70%,nowrap,<50(top,60%,border-bottom)' \
--info=inline --border=rounded --prompt='> ' --pointer='>' --marker='>'"
export FZF_CTRL_T_OPTS="--preview 'bat -p {} 2>/dev/null'"
export FZF_ALT_C_OPTS="--preview 'eza -TaD {}'"
export FZF_CTRL_R_OPTS="--no-sort --preview-window down:1:hidden:wrap --bind '?:toggle-preview'"
