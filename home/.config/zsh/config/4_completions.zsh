zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache

# zstyle ':completion:*' list-prompt ''

# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# if [[ -d "$ZI[PLUGINS_DIR]/Aloxaf---fzf-tab" ]]; then
#     zstyle ':completion:*:corrections' format '[%d]'
#     zstyle ':completion:*:descriptions' format '[%d]'
#     zstyle ':completion:*:messages' format '[%d]'
#     zstyle ':completion:*:warnings' format '[no matches found]'
#     zstyle ':completion:*' format '[%d]'
# else
#     zstyle ':completion:*:corrections' format ' %F{green} -- %d (errors: %e) --%f'
#     zstyle ':completion:*:descriptions' format ' %F{yellow} -- %d --%f'
#     zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
#     zstyle ':completion:*:warnings' format ' %F{red} -- no matches found --%f'
#     zstyle ':completion:*' format ' %F{yellow} -- %d --%f'
# fi
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' menu select
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
# zstyle ':completion:*' use-cache true
# zstyle ':completion:*' rehash true

##-----TEST--------------------------------------------
# do not include pwd after ../
zstyle ':completion:*' ignore-parents parent pwd

zstyle ':completion:*' insert-sections on

# remove slash if argument is a directory
zstyle ':completion:*' squeeze-slashes on

# Enable completion caching, use rehash to clear
zstyle ':completion:*' use-cache on

# cd -opt
zstyle ':completion:*' complete-options on

# delims for modifiers
zstyle ':completion:*' delimiters '@' '/' ',' '%'

# this the description separator in compsys option completions (ls -<tab>)
# and the separator for function se() between row number and learning
export ZPWR_CHAR_LOGO='<<)(>>'
# group description leading chars
export ZPWR_DESC_PRE='-<<'
# group description trailing chars
export ZPWR_DESC_POST='>>-'
# group description text color ANSI codes
export ZPWR_DESC_TEXT_COLOR='34'
# group description leading chars color ANSI codes
export ZPWR_DESC_PRE_COLOR='1;31'
# group description trailing chars color ANSI codes
export ZPWR_DESC_POST_COLOR='1;31'
# file prefix compsys colors
export ZPWR_COMMON_ZSTYLE_OPTS='reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)(*)==37;45=37;43=34}:${(s.:.)LS_COLORS}")'

# Make the list prompt friendly
zstyle ':completion:*' list-prompt \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%SAt %s\e[44;37m%M%p\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%S, Hit TAB for more, or the characters to insert%s\e[0;'$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%SScrolling active: current selection at %s\e[37;44m%p\e[0;'$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

# formatting and messages, blue text with red punctuation
zstyle ':completion:*' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%d\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

zstyle ':completion:*:descriptions' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%d\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

zstyle ':completion:*:corrections' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%d (errors: %e)\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

zstyle ':completion:*:messages' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%d\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

zstyle ':completion:*:explanations' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'m%d\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

zstyle ':completion:*:warnings' format \
    $'\e['$ZPWR_DESC_PRE_COLOR'm'$ZPWR_DESC_PRE$'\e[0;'$ZPWR_DESC_TEXT_COLOR$'mNo Matches for %d'$'\e['$ZPWR_DESC_POST_COLOR'm'$ZPWR_DESC_POST$'\e[0m'

# # Make the list prompt friendly
# zstyle ':completion:*' list-prompt \
#     "%SAt %s%M%pS, Hit TAB for more, or the characters to insert%s"

# # Make the selection prompt friendly when there are a lot of choices
# zstyle ':completion:*' select-prompt \
#     "%SScrolling active: current selection at %s%p"

# # formatting and messages, blue text with red punctuation
# zstyle ':completion:*' format \
#     "$ZPWR_DESC_PRE%d$ZPWR_DESC_POST"

# zstyle ':completion:*:descriptions' format \
#     "$ZPWR_DESC_PRE%d$ZPWR_DESC_POST"

# zstyle ':completion:*:corrections' format \
#     "$ZPWR_DESC_PRE%d (errors: %e)$ZPWR_DESC_POST"

# zstyle ':completion:*:messages' format \
#     "$ZPWR_DESC_PRE%d$ZPWR_DESC_POST"

# zstyle ':completion:*:explanations' format \
#     "$ZPWR_DESC_PRE%d$ZPWR_DESC_POST"

# zstyle ':completion:*:warnings' format \
#     "No Matches for %d"

zstyle ':completion:*' list-separator "$ZPWR_CHAR_LOGO"
zstyle ':completion:*' auto-description 'Specify: %d'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# using tag name as group name so ordering the groups by tag name here
zstyle ':completion:*' group-order \
    zpwr-regen \
    zpwr-clean \
    zpwr-travis \
    zpwr-learn \
    zpwr-search \
    zpwr-env \
    zpwr-update \
    zpwr-cd \
    zpwr-clipboard \
    zpwr-emacs \
    zpwr-vim \
    zpwr-github \
    zpwr-gitrepos \
    zpwr-git \
    zpwr-misc \
    zpwr-send \
    zpwr-forgit \
    zpwr-log c options commands aliases alias global-aliases \
    suffix-aliases functions builtins reserved-words parameters argument-rest \
    strings identifiers hosts commits heads commit-tags heads-local heads-remote \
    recent-branches tags commit-objects remote-branch-names-noprefix corrections \
    packages npm-search npm-cache remote-crate remote-gem remote-pip original \
    globbed-files files fasd-file fasd zdir local-directories tmux contexts \
    last-ten \
    last-clip

# show command descriptions if available
zstyle ':completion:*' extra-verbose on

# don't complete duplicates for these commands
zstyle ':completion::*:(git-add|git-rm|less|rm|vi|vim|v):*' ignore-line on

#insert unambiguous for correct completer
zstyle ':completion:*:correct:*' insert-unambiguous on

# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' 'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' 'r:|?=** m:{a-z\-}={A-Z\_}'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors \
    '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*' list-colors 'ma=37;1;4;44'
# main option for menu selection colors
zstyle ':completion:*:*:*:*:builtins' list-colors '=(#b)(*)=1;30=1;37;4;43'
zstyle ':completion:*:*:*:*:executables' list-colors '=(#b)(*)=1;30=1;37;44'
zstyle ':completion:*:*:*:*:parameters' list-colors '=(#b)(*)=1;30=1;32;45'

zstyle ':completion:*:abs-directories' list-colors '=(#b)(*)=1;30=1;32;45'

zstyle ':completion:*:reserved-words' list-colors '=(#b)(*)=1;30=1;4;37;45'
zstyle ':completion:*:functions' list-colors '=(#b)(*)=1;30=1;37;41'
zstyle ':completion:*:*:*:*:aliases' list-colors '=(#b)(*)=1;30=34;42;4'
zstyle ':completion:*:*:*:*:alias' list-colors '=(#b)(*)=1;30=34;42;4'
zstyle ':completion:*:*:*:*:suffix-aliases' list-colors '=(#b)(*)=1;30=1;34;41;4'
zstyle ':completion:*:*:*:*:global-aliases' list-colors '=(#b)(*)=1;30=1;34;43;4'
zstyle ':completion:*:*:*:*:users' list-colors '=(#b)(*)=1;30=1;37;42'
zstyle ':completion:*:*:*:*:hosts' list-colors '=(#b)(*)=1;30=1;37;43'
zstyle ':completion:*:*:*:*:global-aliases' list-colors '=(#b)(*)=1;30=1;34;43;4'

zstyle ':completion:*:*:*:*:corrections' list-colors '=(#b)(*)=1;30=1;37;4;43'
zstyle ':completion:*:*:*:*:original' list-colors '=(#b)(*)=1;30=34;42;4'

# separate colors for sections of manual pages
zstyle ':completion:*:*:*:*:manuals.1' list-colors '=(#b)(*)=1;30=1;36;44'
zstyle ':completion:*:*:*:*:manuals.2' list-colors '=(#b)(*)=1;30=1;37;42'
zstyle ':completion:*:*:*:*:manuals.3' list-colors '=(#b)(*)=1;30=1;37;43'
zstyle ':completion:*:*:*:*:manuals.4' list-colors '=(#b)(*)=1;30=37;46'
zstyle ':completion:*:*:*:*:manuals.5' list-colors '=(#b)(*)=1;30=1;34;43;4'
zstyle ':completion:*:*:*:*:manuals.6' list-colors '=(#b)(*)=1;30=1;37;41'
zstyle ':completion:*:*:*:*:manuals.7' list-colors '=(#b)(*)=1;30=34;42;4'
zstyle ':completion:*:*:*:*:manuals.8' list-colors '=(#b)(*)=1;30=1;34;41;4'
zstyle ':completion:*:*:*:*:manuals.9' list-colors '=(#b)(*)=1;30=1;36;44'
zstyle ':completion:*:*:*:*:manuals.n' list-colors '=(#b)(*)=1;30=1;4;37;45'
zstyle ':completion:*:*:*:*:manuals.0p' list-colors '=(#b)(*)=1;30=37;46'
zstyle ':completion:*:*:*:*:manuals.1p' list-colors '=(#b)(*)=1;30=37;46'
zstyle ':completion:*:*:*:*:manuals.3p' list-colors '=(#b)(*)=1;30=37;46'

# pgrep and kill
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b)(*)=1;30=1;36;44'
zstyle ':completion:*:*:*:*:processes-names' list-colors '=(#b)(*)=1;30=1;37;43'
zstyle ':completion:*:*:*:*:pname' list-colors '=(#b)(*)=1;30=1;37;43'

zstyle -e ':completion:*:*:*:*:local-directories' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:*:f:*:*' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:*:*:*:globbed-files' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:argument-rest:*' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:*:*:*:all-files' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:*:*:*:files' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
zstyle -e ':completion:*:*:*:*:directories' list-colors "$ZPWR_COMMON_ZSTYLE_OPTS"
#zstyle -e ':completion:*:named-directories' list-colors "$COMMON_ZSTYLE_OPTS_NAMED"
zstyle ':completion:*:*:*:*:named-directories' list-colors '=(#b)(*)=1;30=1;37;46'

zstyle ':completion:*:("|''|)killall("|''|):*' command 'ps -o command'

# use tag names as menu select separators
zstyle ':completion:*' group-name ''

# divide man pages by sections
zstyle ':completion:*:manuals' separate-sections on

# Ignore compsys completion functions
#zstyle ':completion:*:functions' ignored-patterns '_*'

# zstyle ':completion:*' ignored-patterns '*..' # BREAKS find -ctime <tab>

# ignore .. as completion option
zstyle ':completion:*:files' ignored-patterns '*..'
zstyle ':completion:*:files' ignored-patterns '*.'

zstyle ':completion:*:*:*:*:options' list-colors '=(#b)([-<)(>]##)[ ]#([a-zA-Z0-9_.,:?@#-]##)[ ]#([<)(>]#)[ ]#([a-zA-Z0-9+?.,()@3-]#)*=1;32=1;31=34=1;31=34'
