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
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" ||
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$ZI[HOME_DIR]/bin/zi.zsh"

##-----Zi plugins--------------------------------------
zi light-mode for \
    z-shell/{z-a-meta-plugins,zui,zi-console} @annexes \
    @romkatv atload'_dotbare_completion_cmd' kazhala/dotbare

zi wait lucid light-mode for atload'zicompinit; zicdreplay' z-shell/F-Sy-H \
    Aloxaf/fzf-tab atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
    davidde/git blockf atpull'zi creinstall -q .' zsh-users/zsh-completions

zi is-snippet wait lucid for \
    OMZL::{termsupport,key-bindings,spectrum}.zsh atload'bindkey -r "\e\e"; alias ex="extract"' OMZP::{sudo,extract} \
    OMZP::{universalarchive,web-search,frontend-search,copypath,copyfile,history,safe-paste,lol,npm,nvm,gitignore} \
    atload'mkdir -p $ZSH_CACHE_DIR/completions' OMZP::gh as'completion' OMZP::fd/_fd as'completion' OMZP::ripgrep/_ripgrep
zi ice has'svn' svn && zi snippet OMZP::aliases
