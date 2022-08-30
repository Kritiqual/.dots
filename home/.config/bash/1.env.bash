##-----Check interactive and shell opts----------------
[[ $- != *i* ]] && return
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
if [ -f "/usr/share/bash-complete-alias/complete_alias" ]; then
    source /usr/share/bash-complete-alias/complete_alias
fi

##-----Var---------------------------------------------
if [ ! -z ${DISPLAY} ]; then
    export TERM='xterm-kitty'
else
    if [ "$TERM" = "linux" ]; then
        printf %b '\e[40m' '\e[8]'
        printf %b '\e[37m' '\e[8]'
        printf %b '\e]P0282a36'
        printf %b '\e]P86272a4'
        printf %b '\e]P1ff5555'
        printf %b '\e]P9ff7777'
        printf %b '\e]P250fa7b'
        printf %b '\e]PA70fa9b'
        printf %b '\e]P3f1fa8c'
        printf %b '\e]PBffb86c'
        printf %b '\e]P4bd93f9'
        printf %b '\e]PCcfa9ff'
        printf %b '\e]P5ff79c6'
        printf %b '\e]PDff88e8'
        printf %b '\e]P68be9fd'
        printf %b '\e]PE97e2ff'
        printf %b '\e]P7f8f8f2'
        printf %b '\e]PFffffff'
        clear
    fi
fi

# export LC_ALL=en_US.UTF-8
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export DS="$HOME/.dots"
export AW="${DS}/home/.config/awesome"
export NV="${DS}/home/.config/nvim"
#<<~>>
case ${TERM} in
xterm* | rxvt* | Eterm* | aterm | kterm | gnome* | alacritty | st | konsole*)
    # PROMPT_COMMAND='echo -ne "\033]0;K@A: ${PWD/#$HOME/\~}\007"'
    # PROMPT_COMMAND='echo -ne "\033]0;K@A: ${PWD##*/}\007"'
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    ;;
screen*)
    # PROMPT_COMMAND='echo -ne "\033_K@A:${PWD/#$HOME/\~}\033\\"'
    # PROMPT_COMMAND='echo -ne "\033_K@A:${PWD##*/}\033\\"'
    PROMPT_COMMAND='echo -ne "\033_${PWD##*/}\033\\"'
    ;;
esac
#<<~>>
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
#<<~>>
export HISTFILE="$HOME/.dots/home/.local/history/.bashist"
export HISTSIZE=10000
export HISTCONTROL=$HISTCONTROL:ignoredups:erasedups
hstignore=(
    p y a pq* pu au u btw
    m r f e pkg nf of pf
    l ls ld lt dc ac vc .*
    c{1..5} clear cls now net
    man pwd bash bpytop ncmpcpp
)
for hst_item in "${hstignore[@]}"; do
    export HISTIGNORE=$HISTIGNORE:${hst_item}
done
export HISTTIMEFORMAT='[%T > %d-%m-%Y] -> '
#<<~>>
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=xim
#<<~>>
export MANPAGER="sh -c 'col -bx | bat -l man'" # Bat
# export MANPAGER='nvim +Man!'                 # Nvim
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
fzf_arr=($(fd -t f .bash /usr/share/fzf/))
for f in "${fzf_arr[@]}"; do
    [[ -f $f ]] && source $f || echo "$f not found"
done

fzf_exclude="-E '*ache*' -E '.git' -E '__pycache__' -E '*.py[co]' -E '.zoom'"
export FZF_DEFAULT_COMMAND="fd -H -t f ${fzf_exclude}"
export FZF_ALT_C_COMMAND="fd -H -t d ${fzf_exclude}"
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

export FZF_DEFAULT_OPTS="${ED_CLR} --reverse --cycle --bind change:first \
--bind alt-y:first,alt-o:last,ctrl-a:toggle-all,alt-a:clear-selection \
--bind /:toggle-preview,?:refresh-preview,alt-w:toggle-preview-wrap,\
alt-u:preview-top,alt-i:preview-bottom,alt-j:preview-down,alt-k:preview-up,\
alt-h:preview-page-up,alt-l:preview-page-down --preview-window='70%,nowrap' \
--ansi --info=inline --border=rounded --prompt='|> ' --pointer='>' --marker='>'"
export FZF_CTRL_T_OPTS="--preview 'bat -p {} 2>/dev/null' --preview-window='70%,<50(top,60%,border-bottom)'"
export FZF_ALT_C_OPTS="--preview 'exa -TaD {}' --preview-window='70%,<50(top,60%,border-bottom)'"
#<<~>>
export LESSHISTFILE="-"
export LESSHISTSIZE=0
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export npm_config_userconfig="$XDG_CONFIG_HOME"/npm/config
export npm_config_cache="$XDG_CACHE_HOME"/npm
export npm_config_prefix="$XDG_DATA_HOME"/npm

##-----Path--------------------------------------------
path_arr=(
    "$HOME/.local/bin" "$HOME/.local/share/bin"
    "/usr/bin" "$XDG_DATA_HOME/npm/bin"
)
for path_arr_item in "${path_arr[@]}"; do
    if [ -d "${path_arr_item}" ]; then
        PATH="$path_arr_item:$PATH"
    fi
done
