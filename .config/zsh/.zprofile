if [[ "$(tty)" = "/dev/tty1" ]]; then
    wms="xwmux\ni3"
    wm=$(echo $wms | fzf)
    if [ -z "$wm" ]; then
        wm=xwmux
    fi
    startx "$XINITRC" "$wm"
fi
