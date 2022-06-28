import subprocess

config.load_autoconfig(False)

config.bind('<ctrl-Shift-p>', 'spawn --userscript qute-pass --username-target secret --username-pattern "username: (.+)"', mode='insert')
config.bind('<ctrl-Shift-p>', 'spawn --userscript qute-pass --username-target secret --username-pattern "username: (.+)"')

config.bind(',M', 'spawn --verbose --detach mpv {url} --input-ipc-server=/tmp/mpvsocket ytdl-format=bestvideo[height<=?1080]+bestaudio/best')
config.bind(',m', 'hint links spawn --verbose --detach mpv {hint-url} --input-ipc-server=/tmp/mpvsocket ytdl-format=bestvideo[height<=?1080]+bestaudio/best')
'J', 'tab-prev'

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

c.content.blocking.enabled = True
c.content.blocking.method = "both"


# READ XRESOURCES ---------------------------------------------------------- {{{

# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")
xresources.update(read_xresources("rice"))

# }}}

# SET COLOURS ------------------------------------------------------------- {{{

c.colors.statusbar.normal.bg = xresources["*background"]
c.colors.statusbar.command.bg = xresources["*background"]
c.colors.statusbar.insert.bg = xresources["*color10"]
c.colors.statusbar.caret.selection.bg = xresources["*color5"]
c.colors.statusbar.passthrough.bg = xresources["*color4"]
c.colors.statusbar.normal.fg = xresources["*foreground"]
c.colors.statusbar.command.fg = xresources["*foreground"]
c.colors.statusbar.progress.bg = xresources["*foreground"]
c.colors.statusbar.insert.fg = xresources["*background"]
c.colors.statusbar.caret.selection.fg = xresources["*background"]
c.colors.statusbar.passthrough.fg = xresources["*background"]

c.colors.statusbar.url.fg = xresources["*color10"]
c.colors.statusbar.url.hover.fg = xresources["*color12"]
c.colors.statusbar.url.success.http.fg = xresources["*color10"]
c.colors.statusbar.url.success.https.fg = xresources["*color10"]
c.colors.statusbar.url.warn.fg = xresources["rice*urgent"]
c.colors.statusbar.url.error.fg = xresources["rice*urgent"]
c.statusbar.show = "always"

c.colors.tabs.even.bg = xresources["rice.background.inactive"]
c.colors.tabs.odd.bg = xresources["rice.background.inactive"]
c.colors.tabs.even.fg = xresources["rice.foreground.inactive"]
c.colors.tabs.odd.fg = xresources["rice.foreground.inactive"]
c.colors.tabs.selected.even.bg = xresources["rice.background.focused"]
c.colors.tabs.selected.odd.bg = xresources["rice.background.focused"]
c.colors.tabs.selected.even.fg = xresources["rice.foreground.focused"]
c.colors.tabs.selected.odd.fg = xresources["rice.foreground.focused"]

c.colors.tabs.indicator.error = xresources["rice*urgent"]
c.colors.tabs.indicator.start = xresources["*color4"]
c.colors.tabs.indicator.stop = xresources["*color2"]

c.tabs.show = "multiple"

c.colors.downloads.bar.bg = xresources["*background"]
c.colors.downloads.error.fg = xresources["*background"]
c.colors.downloads.error.bg = xresources["rice*urgent"]
c.colors.downloads.start.bg = xresources["*color4"]
c.colors.downloads.stop.bg = xresources["*color2"]
c.colors.downloads.start.fg = xresources["*background"]
c.colors.downloads.stop.fg = xresources["*background"]

c.colors.hints.bg = xresources["*background"]
c.colors.hints.fg = xresources["*foreground"]
c.colors.hints.match.fg = xresources["rice*urgent"]
c.colors.keyhint.bg = xresources["*background"]
c.colors.keyhint.fg = xresources["*foreground"]
c.colors.keyhint.suffix.fg = xresources["rice*urgent"]

c.colors.completion.odd.bg = xresources["rice.background.inactive"]
c.colors.completion.even.bg = xresources["rice.background.inactive"]
c.colors.completion.fg = xresources["rice.foreground.inactive"]
c.colors.completion.match.fg = xresources["rice*urgent"]

c.colors.completion.category.bg = xresources["rice.background.active"]
c.colors.completion.category.fg = xresources["rice.foreground.active"]
c.colors.completion.category.border.top = xresources["rice.background.active"]
c.colors.completion.category.border.bottom = xresources["rice.background.active"]

c.colors.completion.item.selected.bg = xresources["rice.background.focused"]
c.colors.completion.item.selected.fg = xresources["rice.foreground.focused"]
c.colors.completion.item.selected.match.fg = xresources["rice*urgent"]
c.colors.completion.item.selected.border.top = xresources["rice.background.focused"]
c.colors.completion.item.selected.border.bottom = xresources["rice.background.focused"]

c.colors.completion.scrollbar.bg = xresources["*background"]
c.colors.completion.scrollbar.fg = xresources["rice.foreground.alt"]

c.colors.messages.error.bg = xresources["rice*urgent"]
c.colors.messages.error.border = xresources["rice*urgent"]
c.colors.messages.error.fg = xresources["*background"]
c.colors.messages.info.bg = xresources["rice.background.inactive"]
c.colors.messages.info.border = xresources["rice.background.inactive"]
c.colors.messages.info.fg = xresources["rice.foreground.inactive"]
c.colors.messages.warning.bg = xresources["rice.background.focused"]
c.colors.messages.warning.border = xresources["rice.background.focused"]
c.colors.messages.warning.fg = xresources["rice.foreground.focused"]

c.colors.prompts.fg = xresources["*foreground"]
c.colors.prompts.bg = xresources["*background"]
c.colors.prompts.border = xresources["*background"]
c.colors.prompts.selected.fg = xresources["*foreground"]
c.colors.prompts.selected.bg = xresources["*background"]

#if xresources["rice.background"] == "dark":
#    c.colors.webpage.darkmode.enabled = True
#elif xresources["rice.background"] == "light":
#    c.colors.webpage.darkmode.enabled = False

# }}}
