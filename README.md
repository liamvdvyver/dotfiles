# Dotfiles

These are those of my configuration files for my system which I see fit to make
publicly available. Should anyone ever find them useful, it should be noted I
have made no effort to make these portable.

## Usage

1. Install Arch Linux, yadm, and other software in a VM (since these may break
   your system if it is not setup just as mine)

2. Yadm clone into `~`

3. Install and set default shell to zsh: `$ chsh -s /bin/zsh`

4. To use multiple monitors, create arandr.sh in ~/.config

5. Clone my [scripts repo](https://gitlab.com/liamvdvyver/scripts) to
   `~/git/scripts` (or other directory and add to path) to generate
   config files from Xresources

6. If dmenu is installed, switch themes with `$mod+t` or switch light/dark with
   `$mod+r`

## Themes

### File format

Theme files (which work with rice.sh) are kept in `~/.config/rice/themes/` with
correspondingly named wallpapers in `~/.config/rice/papes/`.

Names should be alphanumeric, with appended `-dark` or `-light` to support
light/dark switching.

### Xresources format

#### Standard:

* `color0`-`color15`: ANSI colours 0-15
* `background`: terminal/application background colour
* `foreground`: terminal/application foreground colour
* `cursorColor`: terminal cursor colour

#### GTK:

Defined in `.Xresources` but can be overwritten by themes:

* `rice.gtk.dark`: Dark GTK Widget theme
* `rice.gtk.light`: Light GTK widget theme
* `rice.icon.dark`: Dark GTK icon theme
* `rice.icon.light`: Light GTK icon theme

#### i3:

* `rice*urgent`: urgent border colour
* `rice.border.focused`: focused border colour
* `rice.border.unfocused`: unfocused/inactive border colour
* `rice.indicator.focused`: focused tiling direction indicator colour

#### i3bar:

Resources take format `rice.foreground.X` or `rice.background.X`, where X is:

* `alt`: colour of separator (`rice.foreground.alt` only)
* `focused`: focused workspace
* `active`: active workspaces (on other monitor)
* `inactive`: inactive workspaces

`rice*urgent` is used for urgent background colour with `foreground` text.

#### Other:

* `rice.theme`: name of theme (same as filename omitting `-light` or `-dark`)
* `rice.background`: background colour, either `light` or `dark`
* `rice.nvim.theme`: theme name for neovim
* `rice.nvim.background`: background colour for neovim

Resources are resused to support:

* dunst
* zathura

### Wallpapers

Wallpapers are set with xwallpaper according to the path specified in
`~.config/rice/pape`, which can be set with 'pape' from my scripts repo.
