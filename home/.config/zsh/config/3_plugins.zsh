#######################################################
#/===================================================\#
#|>                ZI PLUGIN MANAGER                <|#
#\===================================================/#
#######################################################
##-----Bootstrap zi installation-----------------------
if [[ ! -f $ZI[HOME_DIR]/bin/zi.zsh ]]; then
    print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
    command mkdir -p "$ZI[HOME_DIR]" && command chmod go-rwX "$ZI[HOME_DIR]"
    command git clone -q --depth=1 --branch "main" \
        https://github.com/z-shell/zi "$ZI[HOME_DIR]/bin" &&
        print -P "%F{33}▓▒░ %F{34}Successfully installing Zi.%f%b" ||
        print -P "%F{160}▓▒░ Failed to install Zi.%f%b"
fi
source "$ZI[HOME_DIR]/bin/zi.zsh"

##-----ZI plugins--------------------------------------
zi light-mode for z-shell/z-a-meta-plugins @annexes

zi ice depth'1' && zi lucid light-mode for \
    atinit'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' \
    atload'source $ZDOTDIR/.p10k.zsh' nocd romkatv/powerlevel10k

zi wait lucid light-mode for \
    z-shell/{zui,zi-console,zbrowse,zzcomplete} Aloxaf/fzf-tab \
    atload'zicompinit; zicdreplay' z-shell/F-Sy-H davidde/git \
    atload'_zsh_autosuggest_start' zsh-users/zsh-autosuggestions \
    blockf atpull'zi creinstall -q .' zsh-users/zsh-completions

zi is-snippet wait lucid for OMZL::{key-bindings,spectrum,functions,clipboard}.zsh OMZP::sudo \
    OMZP::{extract,universalarchive,safe-paste,copypath,copyfile,history,lol,npm,nvm,alias-finder,web-search,frontend-search} \
    atclone'gh completion --shell zsh > _gh' OMZP::gitignore as'completion' OMZP::fd/_fd as'completion' OMZP::ripgrep/_ripgrep
zi ice has'svn' svn && zi snippet OMZP::aliases
zi ice has'svn' svn && zi snippet OMZP::pip && zi cdisable pip >/dev/null
# zi ice has'svn' svn multisrc'{aliases}'

#######################################################
#/===================================================\#
#|>                PLUGINS SETTINGS                 <|#
#\===================================================/#
#######################################################
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#545454,bg=#191a2e"
export ZSH_AUTOSUGGEST_STRATEGY="completion"

export ZICONSOLE_THEME=zdharma-256
export ZICONSOLE_LAYOUT=default

alias ex="extract"
alias af="alias-finder -l -e"
