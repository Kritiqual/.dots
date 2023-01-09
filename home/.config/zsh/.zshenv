##-----ZI----------------------------------------------
typeset -A ZI
export ZI[HOME_DIR]="${HOME}/.local/zi"
export ZI[ZCOMPDUMP_PATH]="${XDG_DATA_HOME}/.zcompdump"

##-----Var---------------------------------------------
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

# export LC_ALL=en_US.UTF-8
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export DS="$HOME/.dots"
export AW="$DS/home/.config/awesome"
export NV="$DS/home/.config/nvim"
#<<~>>
# case ${TERM} in
# xterm* | rxvt* | Eterm* | aterm | kterm | gnome* | alacritty | st | konsole*)
#     # PROMPT_COMMAND='echo -ne "\033]0;K@A: ${PWD/#$HOME/\~}\007"'
#     # PROMPT_COMMAND='echo -ne "\033]0;K@A: ${PWD##*/}\007"'
#     PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
#     ;;
# screen*)
#     # PROMPT_COMMAND='echo -ne "\033_K@A:${PWD/#$HOME/\~}\033\\"'
#     # PROMPT_COMMAND='echo -ne "\033_K@A:${PWD##*/}\033\\"'
#     PROMPT_COMMAND='echo -ne "\033_${PWD##*/}\033\\"'
#     ;;
# esac
#<<~>>
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
#<<~>>
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.local/history/.zshist
ignore=(
    p y a pq pu au u pkg dc ac vc rf gf m r f ex af
    nf of pf l ls ld lt ph fph zi dp db j ji :q :Q
    . .. ... .... ..... c{1..5} clear cls now net e
    man pwd bash zsh bpytop ncmpcpp I_use_Arch_btw
)
for i in $ignore; do HISTORY_IGNORE+="$i(| *)|"; done
export HISTORY_IGNORE=$(echo "(${HISTORY%?})")
#<<~>>
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=xim
#<<~>>
export MANPAGER="sh -c 'col -bx | bat -l man'" # Bat
# export MANPAGER='nvim +Man! -c "nmap q :qa<CR>"' # Nvim
#<<~>>
export PF_INFO="ascii title kernel os shell pkgs uptime memory"
# export PF_COL1=1
# export PF_COL2=6
# export PF_COL3=4
# export PF_SEP=""

# if [[ $TERM_PROGRAM == "" && $TERMINAL_EMULATOR == "" && $FLOATERM == "" ]]; then
#     pfetch # neofetch
# fi
#<<~>>
for f in /usr/share/fzf/*.zsh; do
    [[ ! -f $f ]] || source $f
done
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
--color=fg+:#ffffff,bg+:#44475a,hl+:#9b87fd \
--color=prompt:#20e3b2,pointer:#ff79c6,marker:#20e3b2 \
--color=header:#8d92ff,info:#ffb86c,spinner:#ffb86c,border:#2cccff "
FZF_BIND="--bind 'ctrl-alt-a:select-all,alt-a:clear-selection' \
--bind alt-z:toggle-preview,alt-x:refresh-preview,alt-w:toggle-preview-wrap \
--bind change:first,alt-y:first,alt-o:last,alt-u:preview-top,alt-i:preview-bottom,\
alt-j:preview-down,alt-k:preview-up,alt-h:preview-page-up,alt-l:preview-page-down"

export FZF_DEFAULT_OPTS="${ED_CLR} $FZF_BIND --ansi \
--reverse --cycle --preview-window='70%,nowrap,<50(top,60%,border-bottom)' \
--info=inline --border=rounded --prompt='|> ' --pointer='>' --marker='>'"
export FZF_CTRL_T_OPTS="--preview 'bat -p {} 2>/dev/null'"
export FZF_ALT_C_OPTS="--preview 'exa -TaD {}'"
#<<~>>
export LESSHISTFILE="-"
export LESSHISTSIZE=0
export DELTA_PAGER=bat
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export JAVA_TOOL_OPTIONS='-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export SILENT_JAVA_TOOL_OPTIONS='$JAVA_TOOL_OPTIONS'
alias java='unset JAVA_TOOL_OPTIONS; java "$SILENT_JAVA_TOOL_OPTIONS"'

export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GOPATH="$XDG_DATA_HOME"/go
export npm_config_userconfig="$XDG_CONFIG_HOME"/npm/config
export npm_config_cache="$XDG_CACHE_HOME"/npm
export npm_config_prefix="$XDG_DATA_HOME"/npm
export DOTDROP_AUTOUPDATE="no"
export DOTDROP_CONFIG="$DS/config.yaml"
export DOTDROP_PROFILE="Archie"
function e() { return $1; }

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
