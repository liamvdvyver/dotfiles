#!/bin/bash

pkill -f flameshot
pkill -f dunst
pkill -f nm-applet
pkill -f blueman-applet

flameshot &
dunst &
nm-applet &
blueman-applet &
