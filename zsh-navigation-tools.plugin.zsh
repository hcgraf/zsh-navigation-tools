#!/usr/bin/env zsh

REPO_DIR=${0%/*}
CONFIG_DIR=~/.config/znt

#
# Copy configs
#

if ! test -d $CONFIG_DIR; then
    mkdir -p $CONFIG_DIR
fi

set n-aliases.conf n-env.conf n-history.conf n-list.conf n-panelize.conf n-cd.conf n-functions.conf n-kill.conf n-options.conf n-preview.conf

for i; do
    if ! test -f "$CONFIG_DIR/$i"; then
        cp $REPO_DIR/.config/znt/$i $CONFIG_DIR/
    fi
done

# load functions

autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize
autoload znt-usetty-wrapper znt-history-widget znt-cd-widget
alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
alias nkill=n-kill noptions=n-options npanelize=n-panelize

zle -N znt-history-widget
bindkey '^R' znt-history-widget
setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
