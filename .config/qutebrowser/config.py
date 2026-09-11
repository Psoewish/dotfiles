# ruff: noqa
# pyright: reportUndefinedVariable=false, reportUnknownMemberType=false
config.load_autoconfig()

c.url.searchengines["default"] = "https://duckduckgo.com/?q={}"

config.set("auto_save.session", True)

config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.images", "never")
config.set("colors.webpage.preferred_color_scheme", "dark")

config.set("content.autoplay", False)

config.set("downloads.position", "bottom")
config.set("downloads.remove_finished", 3000)

config.set("hints.chars", "arstneio")
config.set("scrolling.bar", "never")
config.set("scrolling.smooth", True)
config.set("statusbar.show", "in-mode")

config.set("tabs.last_close", "startpage")
config.set("tabs.max_width", 250)
config.set("tabs.show", "multiple")

config.bind("<Ctrl-Shift-C>", "config-cycle tabs.show multiple never", mode="normal")
config.bind("<Ctrl-Shift-Down>", "set tabs.position bottom", mode="normal")
config.bind("<Ctrl-Shift-Left>", "set tabs.position left", mode="normal")
config.bind("<Ctrl-Shift-Right>", "set tabs.position right", mode="normal")
config.bind("<Ctrl-Shift-Up>", "set tabs.position top", mode="normal")

c.tabs.padding = {"top": 8, "bottom": 8, "left": 8, "right": 8}
