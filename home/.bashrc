##==================================================================##
##                                                                  ##
##                     BEGIN VARIABLES AND PATH                     ##
##                                                                  ##
##==================================================================##
##──── Check interactive ─────────────────────────────────────────────
[[ $- != *i* ]] && return
bind "set completion-ignore-case on"
# set -o vi
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
source $HOME/.local/share/cmp-aliases/complete_alias

##──── Var ───────────────────────────────────────────────────────────
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
export TERMINAL='kitty'
export EDITOR=nvim
export VISUAL="$EDITOR"
export DS="$HOME/.dots"
export AW="${DS}/home/.config/awesome"
export NV="${DS}/home/.config/nvim"
##─────
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
##─────
export LESSHISTFILE="-"
export LESSHISTSIZE=0
export HISTFILE="$HOME/.dots/home/.bashist"
export HISTSIZE=10000
export HISTCONTROL=$HISTCONTROL:ignoredups:erasedups
__hstignore=(
    "p" "y" "a" "pq*" "pu" "au" "u" "btw"
    "m" "r" "f" "e" "pkg" "nf" "of" "pf"
    "l" "ls" "ld" "lt" "dc" "ac" "vc" ".*"
    "c[1..5]" "clear" "cls" "now" "net"
    "man" "pwd" "bash" "bpytop" "ncmpcpp"
)
for hst_item in "${__hstignore[@]}"; do
    export HISTIGNORE=$HISTIGNORE:${hst_item}
done
export HISTTIMEFORMAT='[%T > %d-%m-%Y] -> '
##─────
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=xim
##─────
export MANPAGER="sh -c 'col -bx | bat -l man'" # Bat
# export MANPAGER='nvim +Man!'                 # Nvim
##─────
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES='$XDG_CONFIG_HOME/gtk-2.0/gtkrc'
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

##──── Path ──────────────────────────────────────────────────────────
path_arr=("$HOME/.local/bin" "/usr/bin")
for path_arr_item in "${path_arr[@]}"; do
    if [ -d "${path_arr_item}" ]; then
        PATH="$path_arr_item:$PATH"
    fi
done
##==================================================================##
##                                                                  ##
##                           BEGIN ALAISES                          ##
##                                                                  ##
##==================================================================##
##──── Shell ─────────────────────────────────────────────────────────
alias tob="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias toz="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tof="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

##──── Protection when doing some dangerous command ───────────────────
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'

##──── Dotdrop ───────────────────────────────────────────────────────
source $HOME/.dots/dotdrop/completion/dotdrop-completion.bash
alias dotdrop='~/.dots/dotdrop.sh --cfg=~/.dots/config.yaml'

##──── Power management ──────────────────────────────────────────────
# alias reboot="systemctl reboot"
# alias poweroff="systemctl poweroff"
# alias shutdown="systemctl shutdown"
# alias netre='sudo systemctl restart NetworkManager'
# alias flighton='sudo rfkill block all'
# alias flightoff='sudo rfkill unblock all'

##──── Gpg ───────────────────────────────────────────────────────────
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"          # verify signature for isos
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys" # receive the key of a developer

##──── Pacman & AUR ──────────────────────────────────────────────────
## While waiting for aura4 to be released, I will use yay,
## because, aura does not support -l flag yet :)
alias p='sudo pacman'
alias a='sudo aura'
alias y='yay'
##─────
alias pu='sudo pacman -Syy'
# alias au='sudo aura -Au'
alias au='yay -Sau'
##─────
# alias u='sudo pacman -Su; sudo aura -Ayu'
alias u='yay -Syu'
##─────
alias sc='sudo aura -Bc'
alias cc='yay -Scc'
alias co='sudo pacman -Rns $(pacman -Qtdq)'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias pkg='pacman -Qeq > ~/.dots/pkg.txt'

##──── Quick cd ──────────────────────────────────────────────────────
alias dc='cd $DS'
alias ac='cd $AW'
alias vc='cd $NV'

##──── Mirrors ───────────────────────────────────────────────────────
alias mr="reflector -f 30 -l 30 -n 15 --verbose"     # --save /etc/pacman.d/mirrorlist"
alias mrd="reflector --latest 50 -n 20 --sort delay" # --save /etc/pacman.d/mirrorlist"
alias mrs="reflector --latest 50 -n 20 --sort score" # --save /etc/pacman.d/mirrorlist"

##──── Git ───────────────────────────────────────────────────────────
alias g='git'
alias ga="git add"
alias gau='git au'
alias gaa='git aa'
alias grt='git rt'
alias gbr='git br'
alias gco='git co'
alias gck='git co'
alias gcl='git cl'
alias gcm='git cm'
alias gss='git ss'
alias grb='git rb'
alias gft='git ft'
alias gpl='git pl'
alias gps='git ps'
alias grm='git rm'
alias grs='git rs'
alias gst='git st'
alias grl='git rl'
alias glg='git lg'
alias gll='git ll'
alias gtg='git tag'
alias gta='git ta'
alias gsm='git sm'
alias gkd='git kd'

##──── Shorthand for [Neo]vi[m] ──────────────────────────────────────
alias v="nvim"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
##─────
alias sv="sudo nvim"
alias snv="sudo nvim"
alias svi="sudo nvim"
alias svim="sudo nvim"

##──── Colorize grep ─────────────────────────────────────────────────
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias rg='rg --color=auto'

##──── Change ls to exa ──────────────────────────────────────────────
exa_default='--icons --classify --color=always --color-scale --group-directories-first --time-style=iso'
alias l='exa -a --ignore-glob="*.git|.zoom" ${exa_default}'
alias ls='exa -la --ignore-glob="*.git|.zoom" ${exa_default}'
alias ld='exa -laD --ignore-glob="*.git|.zoom" ${exa_default}'
alias lt='exa -laT --ignore-glob="*.git|.zoom" ${exa_default}'

##──── Short cd ──────────────────────────────────────────────────────
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
##─────
alias c1="cd .."
alias c2="cd ../.."
alias c3="cd ../../.."
alias c4="cd ../../../.."
alias c5="cd ../../../../.."

##──── Yt-dlp ────────────────────────────────────────────────────────
## This need to be convert from youtube-dl to yt-dlp
# alias yta-aac="youtube-dl --extract-audio --audio-format aac "
# alias yta-best="youtube-dl --extract-audio --audio-format best "
# alias yta-flac="youtube-dl --extract-audio --audio-format flac "
# alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
# alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
# alias yta-opus="youtube-dl --extract-audio --audio-format opus "
# alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
# alias yta-wav="youtube-dl --extract-audio --audio-format wav "
# alias ytv-best="youtube-dl -f bestvideo+bestaudio "

##──── Bruh ──────────────────────────────────────────────────────────
alias btw='pfetch' # neofetch
alias nf='neofetch'
alias of='onefetch'
alias pf='pfetch'
alias net='ping -q archlinux.org -c 100 -i .002'
alias now='date +"[%T] %a, %d/%m/%Y"'
alias path='echo -e ${PATH//:/\\n}'
alias jctl="journalctl -q -p 3 -xb"
alias ta='Xephyr :5 -ac -br -reset -screen 1900x1068 & sleep 1; DISPLAY=:5 awesome'
alias tk='/bin/bash "/home/kritiqual/Projects/kasis/kasis"'
alias tp='picom -b --experimental-backends --config ~/.dots/home/.config/picom/picom.conf'
alias d='kitty +kitten diff'
alias ip='ip -c'
alias cls='clear'
alias cat='bat'
alias f='fzf'
alias r='ranger'
alias i='irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
##==================================================================##
##                                                                  ##
##                            BEGIN UTILS                           ##
##                                                                  ##
##==================================================================##
[[ -f "${DS}/home/.bash_utils" ]] && source ${DS}/home/.bash_utils
##──── Pfetch ────────────────────────────────────────────────────────
export PF_INFO="ascii title kernel os shell pkgs uptime memory"
# export PF_COL1=1
# export PF_COL2=6
# export PF_COL3=4
# export PF_SEP=""
##─────
# if [[ $TERM_PROGRAM == "" && $TERMINAL_EMULATOR == "" && $FLOATERM == "" ]]; then
#     pfetch # neofetch
# fi

##──── Kitty shell integration ───────────────────────────────────────
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled no-cursor"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

##──── Complete alias ────────────────────────────────────────────────
__cmp_aliases_array=(
    "p" "y" "a" "cp" "mv" "ln" "rm" "chown" "chmod" "nf" "of" "pf"
    "g" "ga" "gaa" "grt" "gbr" "gco" "gck" "gcl" "gcm" "gss" "grb" "gft"
    "gpl" "gps" "grm" "grs" "gst" "grl" "glg" "gll" "gtg" "gta" "gsm" "gkd"
)
for item in ${_cmp_aliases_array[@]}; do
    complete -F _complete_alias ${item}
done
##==================================================================##
##                                                                  ##
##                 BEGIN STARSHIP (NEED TO BE HERE)                 ##
##                                                                  ##
##==================================================================##
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
[[ -f /usr/bin/starship ]] && e() {
    return $1
}
eval "$(starship init bash)"
