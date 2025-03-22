import themes.rosepine

config.load_autoconfig(True)

themes.rosepine.setup(c, 'rose-pine', True)

c.colors.webpage.darkmode.enabled = True
c.auto_save.session = True
c.scrolling.bar = 'never'
c.scrolling.smooth = True
c.statusbar.show = 'in-mode'
c.hints.chars = "arstneio"

c.tabs.pinned.shrink = False
c.tabs.pinned.frozen = True
c.tabs.position = 'top'
c.tabs.last_close = 'startpage'
c.tabs.padding = {'bottom': 8, 'left': 8, 'right': 8, 'top': 8}
c.tabs.width = 200

c.fonts.default_family = 'CaskaydiaCove Nerd Font'
c.fonts.default_size = '12pt'

config.bind('<Alt+Ctrl+C>', 'config-cycle tabs.show always never')

c.content.autoplay = False
