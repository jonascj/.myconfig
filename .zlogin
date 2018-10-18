if [[ -z $DISPLAY && $XDG_VTNR -le 3 ]] ; then
    startx -- -keeptty 1> $HOME/.xsession-errors 2>&1 &
fi
