#######################################################
#/===================================================\#
#|>                     .ZSHENV                     <|#
#\===================================================/#
#######################################################
##-----ZI----------------------------------------------
typeset -A ZI
export ZI[HOME_DIR]="${HOME}/.local/zi"
export ZI[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/.zcompdump"

##-----Var---------------------------------------------
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	export MOZ_ENABLE_WAYLAND="1"
fi
if [ ! -z ${DISPLAY} ]; then
	export TERM='xterm-kitty'
else
	if [ "$TERM" = "linux" ]; then
		printf %b '\e[40m' '\e[8]'
		printf %b '\e[37m' '\e[8]'
		printf %b '\e]P0191a2e'
		printf %b '\e]P88d92ff'
		printf %b '\e]P1ff5555'
		printf %b '\e]P9ff6e6e'
		printf %b '\e]P220e3b2'
		printf %b '\e]PA50fa7b'
		printf %b '\e]P3fde181'
		printf %b '\e]PBffb86c'
		printf %b '\e]P49b87fd'
		printf %b '\e]PCbd93f9'
		printf %b '\e]P5ff6bcb'
		printf %b '\e]PDff79c6'
		printf %b '\e]P62cccff'
		printf %b '\e]PE8be9fd'
		printf %b '\e]P7ffffff'
		printf %b '\e]PFf8f8f2'
		clear
	fi
fi

export EDITOR="nvim"
export VISUAL="$EDITOR"
export DS="$HOME/.dots"
export CFG="$DS/home/.config"
export AW="$CFG/awesome"
export NV="$CFG/nvim"
export CHROOT="$DS/.chroot"
export SUDO_PROMPT="$(tput setaf 4)[$(tput setaf 1)!$(tput setaf 4)] $(tput setaf 1)>$(tput setaf 3)>$(tput setaf 2)>$(tput setaf 4)>$(tput setaf 6)>$(tput setaf 5)>$(tput setaf 7)>$(tput sgr0) "
#<<~>>
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
#<<~>>
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.local/history/.zshist
i_l=(
	##-----Package manager---------------------------------
	p a u pu au up pkg ghe 'd[pb]' zi
	##-----Path stuff--------------------------------------
	'[dav]c' 'j(i|)' '[.]##' 'c<->' '[pc]wd' 'e[xz]a' 'l([sdtx]|)' 'lg([sdtx]|)' '(f|)ph' r y
	##-----Fzf utils---------------------------------------
	'(|r|m|p|gh)f' man help man_fzf ripgrep_fzf
	##-----Utilities---------------------------------------
	'[ck]f' '[fo]f' 'b(pytop|)' 'n(cmpcpp|)' 't(mux|)'
	##-----Random stuff------------------------------------
	':[qQ]' exit 'cl(rscr|ear|s)' '(ba|z)sh' now net I_use_Arch_btw e i
)
# export HISTORY_IGNORE="(${(j:|:)i_l})(| *)"
#<<~>>
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT4_IM_MODULE=fcitx
export CLUTTER_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
#<<~>>
export MANROFFOPT="-c"
export GROFF_NO_SGR=1

export MANPAGER="sh -c 'col -bx | bat -l man'"

# export MANPAGER='nvim +Man! -c "nmap q :qa<CR>"'

# export MANPAGER="less -s -M +Gg"
# export LESS_TERMCAP_mb=$'\e[1;31m'
# export LESS_TERMCAP_md=$'\e[1;34m'
# export LESS_TERMCAP_so=$'\e[01;45;37m'
# export LESS_TERMCAP_us=$'\e[01;36m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_ue=$'\e[0m'
#<<~>>
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum

export ANDROID_HOME="$XDG_DATA_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DELTA_PAGER=bat
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JAVA_TOOL_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LESSHISTFILE="-"
export LESSHISTSIZE=0
export npm_config_prefix="$XDG_DATA_HOME/npm"
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
#<<~>>
source $CFG/fzf/fzf_cfg.zsh
#<<~>>
export DOTDROP_AUTOUPDATE="yes"
export DOTDROP_VIRTUALENV="$DS/.venv"
export DOTDROP_CONFIG="$DS/config.yaml"
export DOTDROP_PROFILE="Archlinux"
function e() { return $1; }
#<<~>>
# if [[ $TERM_PROGRAM == "" && $TERMINAL_EMULATOR == "" && $FLOATERM == "" ]]; then
#     fastfetch
# fi

##-----Path--------------------------------------------
#<<fpath>>
fpath+=($ZDOTDIR/completions)

#<<path>>
path+=(
	"/usr/bin"
	"$HOME/.local/bin"
	"$HOME/.local/share/bin"
	"$XDG_DATA_HOME/npm/bin"
	"$XDG_DATA_HOME/cargo/bin"
)
export PATH
