##-----Change shell------------------------------------
alias tob="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias toz="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tof="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

##-----Command protection------------------------------
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'

##-----Dotdrop-----------------------------------------
source $HOME/.dots/dotdrop/completion/dotdrop-completion.bash
alias dotdrop='~/.dots/dotdrop.sh --cfg=~/.dots/config.yaml'

##-----Power management--------------------------------
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"
alias shutdown="systemctl shutdown"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"
# alias netre='sudo systemctl restart NetworkManager'
# alias flighton='sudo rfkill block all'
# alias flightoff='sudo rfkill unblock all'

##-----Gpg---------------------------------------------
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"          # verify signature for isos
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys" # receive the key of a developer

##-----Pacman & AUR helper-----------------------------
## While waiting for aura4 to be released, I will use yay,
## because, aura does not support -l flag yet :)
alias p='sudo pacman'
alias a='sudo aura'
alias y='yay'
#<<~>>
alias pu='sudo pacman -Syy'
# alias au='sudo aura -Au'
alias au='yay -Sau'
#<<~>>
# alias u='sudo pacman -Su; sudo aura -Ayu'
alias u='yay -Syu'
#<<~>>
alias sc='sudo aura -Bc'
alias cc='yay -Scc'
alias co='sudo pacman -Rns $(pacman -Qtdq)'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias pkg='pacman -Qeq > ~/.dots/pkg.txt'

##-----Quick cd----------------------------------------
alias dc='cd $DS'
alias ac='cd $AW'
alias vc='cd $NV'

##-----Mirrors-----------------------------------------
alias mr="reflector -f 30 -l 30 -n 15 --verbose"     # --save /etc/pacman.d/mirrorlist"
alias mrd="reflector --latest 50 -n 20 --sort delay" # --save /etc/pacman.d/mirrorlist"
alias mrs="reflector --latest 50 -n 20 --sort score" # --save /etc/pacman.d/mirrorlist"

##-----Git---------------------------------------------
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

##-----Shorthand for [Neo]vi[m]------------------------
alias v="nvim"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
#<<~>>
alias sv="sudo nvim"
alias snv="sudo nvim"
alias svi="sudo nvim"
alias svim="sudo nvim"

##-----Colorize grep-----------------------------------
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias rg='rg --color=auto'

##-----Ls to exa---------------------------------------
exa_default='--icons --classify --color=always --color-scale --group-directories-first --time-style=iso'
alias l='exa -a --ignore-glob="*.git|.zoom" ${exa_default}'
alias ls='exa -la --ignore-glob="*.git|.zoom" ${exa_default}'
alias ld='exa -laD --ignore-glob="*.git|.zoom" ${exa_default}'
alias lt='exa -laT --ignore-glob="*.git|.zoom" ${exa_default}'

##-----Short cd----------------------------------------
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
#<<~>>
alias c1="cd .."
alias c2="cd ../.."
alias c3="cd ../../.."
alias c4="cd ../../../.."
alias c5="cd ../../../../.."

##-----Yt-dlp------------------------------------------
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

##-----Stuff-------------------------------------------
alias :q="exit"
alias :Q=":q"
alias btw='pfetch' # neofetch
alias nf='neofetch'
alias of='onefetch'
alias pf='pfetch'
alias net='ping -q archlinux.org -c 10 -i .002'
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
alias pq="pacman_fzf"
alias m="man_fzf"
alias rf="ripgrep_fzf"
