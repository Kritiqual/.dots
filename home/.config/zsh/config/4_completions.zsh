zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

zstyle ':completion:*' list-prompt ''

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
if [[ -d "$ZI[HOME_DIR]" ]]; then
    if [[ ! -z $(command ls -A "$ZI[PLUGINS_DIR]"/Aloxaf---fzf-tab) ]]; then
        zstyle ':completion:*:corrections' format '[%d]'
        zstyle ':completion:*:descriptions' format '[%d]'
        zstyle ':completion:*:messages' format '[%d]'
        zstyle ':completion:*:warnings' format '[no matches found]'
        zstyle ':completion:*' format '[%d]'
    else
        zstyle ':completion:*:corrections' format ' %F{green} -- %d (errors: %e) --%f'
        zstyle ':completion:*:descriptions' format ' %F{yellow} -- %d --%f'
        zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
        zstyle ':completion:*:warnings' format ' %F{red} -- no matches found --%f'
        zstyle ':completion:*' format ' %F{yellow} -- %d --%f'
    fi
fi
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' rehash true
