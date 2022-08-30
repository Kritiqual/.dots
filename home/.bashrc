#######################################################
#/===================================================\#
#|>              ENV VARS AND ALIASES               <|#
#\===================================================/#
#######################################################
if [[ -d $HOME/.config/bash ]]; then
    for f in $HOME/.config/bash/*.bash; do
        [[ ! -f $f ]] || source $f
    done
fi

#######################################################
#/===================================================\#
#|>                     OTHERS                      <|#
#\===================================================/#
#######################################################
##-----Kitty shell integration-------------------------
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled no-cursor"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

##-----Complete alias----------------------------------
cmp_aliases_array=(
    "p" "y" "a" "cp" "mv" "ln" "rm" "chown" "chmod" "nf" "of" "pf" "f" "r"
    "g" "ga" "gaa" "grt" "gbr" "gco" "gck" "gcl" "gcm" "gss" "grb" "gft"
    "gpl" "gps" "grm" "grs" "gst" "grl" "glg" "gll" "gtg" "gta" "gsm" "gkd"
)
complete -F _complete_alias ${cmp_aliases_array[@]}

##-----Unset var---------------------------------------
unset hstignore path_arr fzf_arr fzf_exclude D_CLR ED_CLR cmp_aliases_array
#######################################################
#/===================================================\#
#|>           STARSHIP (NEED TO BE HERE)            <|#
#\===================================================/#
#######################################################
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
e() { return $1; }
eval "$(starship init bash)"
