#!/bin/bash

pkill -f flameshot
pkill -f dunst
#pkill -f nm-applet

flameshot &
dunst &
#nm-applet &
