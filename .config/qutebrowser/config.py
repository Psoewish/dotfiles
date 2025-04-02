import c
import config

import themes.rosepine

config.load_autoconfig(False)

themes.rosepine.setup(c, 'rose-pine', True)

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"
c.colors.webpage.preferred_color_scheme = "dark"

c.content.autoplay = False
c.content.cookies.accept = "all"
c.content.blocking.method = "both"
c.content.javascript.clipboard = "access"

c.auto_save.session = True

c.scrolling.bar = 'never'
c.scrolling.smooth = True

c.statusbar.show = 'in-mode'

c.hints.chars = "arstneio"

c.tabs.last_close = 'startpage'
c.tabs.pinned.shrink = False
c.tabs.pinned.frozen = True
c.tabs.position = 'top'
c.tabs.padding = {'bottom': 8, 'left': 8, 'right': 8, 'top': 8}
c.tabs.width = 250
c.tabs.show = "multiple"

c.downloads.position = "bottom"
c.downloads.remove_finished = 300000

c.fonts.default_family = 'CaskaydiaCove Nerd Font'
c.fonts.default_size = '12pt'

config.bind('<Alt+Ctrl+C>', 'config-cycle tabs.show always never')
config.bind('Alt+Ctrl+Left', 'set tabs.position left')
config.bind('Alt+Ctrl+Bottom', 'set tabs.position bottom')
config.bind('Alt+Ctrl+Up', 'set tabs.position top')
config.bind('Alt+Ctrl+Right', 'set tabs.position right')

{"DEFAULT": "https://duckduckgo.com/?q={}", "yt": "https://youtube.com/results?search_query={}"}
