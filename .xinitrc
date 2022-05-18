xrdb .Xresources &

picom --experimental-backends &
~/.config/arandr.sh &
cat ~/.config/rice/pape | xargs pape &

sxhkd &
mpd &
mpDris2 &
spotifyd &
flameshot &
dunst &

exec i3
