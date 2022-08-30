if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
for f in $ZDOTDIR/config/*.zsh; do
  [[ ! -f $f ]] || source $f
done
eval "$(zoxide init zsh --cmd j)"

[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
