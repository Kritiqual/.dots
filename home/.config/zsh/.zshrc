if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for f in $ZDOTDIR/config/*.zsh; do
  [[ ! -f $f ]] || source $f
done

eval "$(zoxide init zsh --cmd j)"
