xrdb ~/.config/Xresources &
xset s off &
xset -dpms &

picom --experimental-backends -c &
~/.config/arandr.sh &
cat ~/.config/rice/pape | xargs pape &

sxhkd &
mpd &
mpDris2 &
spotifyd &
flameshot &
dunst &

exec i3
