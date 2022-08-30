#######################################################
#/===================================================\#
#|>                      MAIN                       <|#
#\===================================================/#
#######################################################
##-----Change shell------------------------------------
alias tob="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias toz="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tof="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

##-----Command protection------------------------------
alias cp='cp -iR'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'

alias md="mkdir -p"

##-----Power management--------------------------------
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"
alias shutdown="systemctl shutdown"
alias suspend="systemctl suspend"
alias hibernate="systemctl hibernate"
alias netrs='sudo systemctl restart NetworkManager'
# alias flighton='sudo rfkill block all'
# alias flightoff='sudo rfkill unblock all'

##-----Pacman & AUR helper-----------------------------
## Aura still not support -l flag, until aura-rust released
## I use paru until then ;)
alias p='sudo pacman'
alias a='sudo aura'
alias y='yay'
alias u='paru'
#<<~>>
alias pu='p -Syy'
# alias pu='a -Syy'
# alias pu='y -Syy'
# alias pu='u -Syy'
#<<~>>
# alias au='a -Au'
# alias au='y -Sau'
alias au='u -Sau'
#<<~>>
# alias up='a -Syu; a -Au'
# alias up='y -Syu'
alias up='u -Syu'
#<<~>>
# alias cc='y -Scc'
alias cc='u -Scc'
#<<~>>
alias sc='a -Bc'
alias co='p -Rns $(pacman -Qtdq)'
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias pkg='u -Qeq > ~/.dots/pkg.txt'

##-----Dotfiles manager--------------------------------
alias dp='DOTDROP_CONFIG=~/.dots/config.yaml ~/.dots/dotdrop.sh'
alias did='dp install -d'
alias db="dotbare"

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

##-----Colorizing some command-------------------------
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias rg='rg --color=auto'
#<<~>>
default="\
--git --icons --classify --color=always \
--color-scale --group-directories-first \
--time-style=iso --ignore-glob='*.git|.zoom'\
"
alias l="exa -a $default"
alias ls="exa -la $default"
alias ld="exa -laD $default"
alias lt="exa -laT $default"

##-----Quick cd----------------------------------------
alias dc='cd $DS'
alias ac='cd $AW'
alias vc='cd $NV'
#<<~>>
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

##-----Stuff-------------------------------------------
alias nf='neofetch'
alias of='onefetch'
alias pf='pfetch'
alias I_use_Arch_btw='pf'

alias :q="exit"
alias :Q=":q"
alias cls='clear'
alias cat='bat'
alias rl!='exec "$SHELL" -l'
alias rz!='SHELL=zsh rl!'

alias f='fzf'
alias r='ranger'
alias pq="pacman_fzf"
alias m="man_fzf"
alias rf="ripgrep_fzf"
alias ghf="githelp_fzf"

alias kd='kitty +kitten diff'
alias now='date +"[%T] %a, %d/%m/%Y"'
alias ph='echo -e ${PATH//:/\\n}'
alias fph='echo -e "${fpath// /\\n}"'

alias net='ping -q archlinux.org -c 10 -i .002'
alias jctl="journalctl -q -p 3 -xb"

alias ta='Xephyr :5 -ac -br -reset -screen 1900x1068 & sleep 1; DISPLAY=:5 awesome'
alias tk='$SHELL "/home/kritiqual/Projects/kasis/kasis"'

#######################################################
#/===================================================\#
#|>                      TRASH                      <|#
#\===================================================/#
#######################################################
alias ip='ip -c'
alias i='irssi --config=$XDG_CONFIG_HOME/irssi/config --home=$XDG_DATA_HOME/irssi'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"

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

##-----Gpg---------------------------------------------
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

##-----Mirrors-----------------------------------------
# alias mr="reflector -f 30 -l 30 -n 15 --verbose"     # --save /etc/pacman.d/mirrorlist"
# alias mrd="reflector --latest 50 -n 20 --sort delay" # --save /etc/pacman.d/mirrorlist"
# alias mrs="reflector --latest 50 -n 20 --sort score" # --save /etc/pacman.d/mirrorlist"
