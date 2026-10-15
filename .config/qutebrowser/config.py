from os import path

config.load_autoconfig(False)

dirname = path.dirname(path.abspath(__file__))
theme_filename = path.join(dirname, "theme.py")
with (open(theme_filename)) as f:
    exec(f.read())

config.bind('<Ctrl+c>', 'mode-leave', mode='caret')
config.bind('<Ctrl+c>', 'mode-leave', mode='command')
config.bind('<Ctrl+c>', 'mode-leave', mode='hint')
config.bind('<Ctrl+c>', 'mode-leave', mode='insert')
config.bind('<Ctrl+c>', 'mode-leave', mode='passthrough')
config.bind('<Ctrl+c>', 'mode-leave', mode='prompt')
config.bind('<Ctrl+c>', 'mode-leave', mode='register')
config.bind('<Ctrl+c>', 'mode-leave', mode='yesno')

config.bind('<ctrl-Shift-p>', 'spawn --userscript qute-pass --username-target secret --username-pattern "username: (.+)"', mode='insert')
config.bind('<ctrl-Shift-p>', 'spawn --userscript qute-pass --username-target secret --username-pattern "username: (.+)"')

config.bind(',M', 'spawn --verbose --detach mpv {url} --input-ipc-server=/tmp/mpvsocket ytdl-format=bestvideo[height<=?1080]+bestaudio/best')
config.bind(',m', 'hint links spawn --verbose --detach mpv {hint-url} --input-ipc-server=/tmp/mpvsocket ytdl-format=bestvideo[height<=?1080]+bestaudio/best')

config.bind(',Z', "spawn --userscript qute-zotero")
config.bind(',z', "hint links userscript qute-zotero")

config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')

config.bind('>', 'tab-move +')
config.bind('<', 'tab-move -')

config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')

c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.url.start_pages = "http://medion:8082"
