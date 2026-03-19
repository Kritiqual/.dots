#######################################################
#/===================================================\#
#|>                ZI PLUGIN MANAGER                <|#
#\===================================================/#
#######################################################
##-----Bootstrap zi installation-----------------------
if [[ ! -f $ZI[HOME_DIR]/bin/zi.zsh ]]; then
	print -P "%F{105}▓▒░ %F{203}Installing (%F{81}z-shell/zi%F{203})…%f"
	command mkdir -p "$ZI[HOME_DIR]" && command chmod go-rwX "$ZI[HOME_DIR]"
	command git clone -q --depth=1 --branch "main" \
		https://github.com/z-shell/zi "$ZI[HOME_DIR]/bin" &&
		print -P "%F{79}▓▒░ Successfully installed Zi.%f%b" ||
		print -P "%F{203}▓▒░ Failed to install Zi.%f%b"
fi
source "$ZI[HOME_DIR]/bin/zi.zsh"

##-----ZI plugins--------------------------------------
zi light-mode for z-shell/z-a-meta-plugins @annexes

zi depth'1' lucid light-mode for nocd \
	atinit'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' \
	romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.tty.zsh || source $ZDOTDIR/.p10k.test.zsh
# atload'[[ "$(tty)" =~ "/dev/pts/"* ]] && source $ZDOTDIR/.p10k.zsh || source $ZDOTDIR/.p10k.tty.zsh' romkatv/powerlevel10k

zi wait lucid light-mode for \
	has'fzf' Aloxaf/fzf-tab \
	z-shell/{zui,zi-console,zbrowse,zzcomplete} \
	atload'zicompinit; zicdreplay' z-shell/F-Sy-H davidde/git \
	blockf atpull'zi creinstall -q ..' zsh-users/zsh-completions \
	nocompile nocompletions MenkeTechnologies/zsh-more-completions \
	atinit'bindkey "^W" autopair-delete' hlissner/zsh-autopair
# atload'_zsh_autosuggest_start' zsh-users/zsh-autosuggestions

zi wait lucid is-snippet for OMZL::{spectrum,functions,clipboard}.zsh OMZP::sudo
# OMZP::{extract,universalarchive,safe-paste,copypath,copyfile,history,lol,alias-finder,web-search,frontend-search} \
# atclone'gh completion --shell zsh > _gh' OMZP::gitignore

#######################################################
#/===================================================\#
#|>                PLUGINS SETTINGS                 <|#
#\===================================================/#
#######################################################
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#545454,bg=#191a2e"
export ZSH_AUTOSUGGEST_STRATEGY="completion"

export ZICONSOLE_THEME=zdharma-256
export ZICONSOLE_LAYOUT=default

# alias af="alias-finder -l -e"
