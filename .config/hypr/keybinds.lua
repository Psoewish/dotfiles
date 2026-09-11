local mod = "SUPER"

-- Default applications
local terminal = "foot"
local browser = "firefox"
local filemanager = ""

-- Noctalia stuff
local ipc = "noctalia msg "

local launcher = ipc .. "panel-toggle launcher"
local settings = ipc .. "settings-toggle"

local screenshot_area = ipc .. "screenshot-region"
local screenshot_monitor = ipc .. "screenshot-fullscreen pick"
local screenshot_all = ipc .. "screenshot-fullscreen all"

hl.bind(mod .. "+Slash", hl.dsp.exec_cmd(launcher))
hl.bind(mod .. "+RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. "+E", hl.dsp.exec_cmd(filemanager))
hl.bind(mod .. "+I", hl.dsp.exec_cmd(settings))
hl.bind(mod .. "+B", hl.dsp.exec_cmd(browser))

hl.bind("PRINT", hl.dsp.exec_cmd(screenshot_area))
hl.bind("SHIFT+PRINT", hl.dsp.exec_cmd(screenshot_monitor))
hl.bind("SHIFT+CTRL+PRINT", hl.dsp.exec_cmd(screenshot_all))

hl.bind(mod .. "+V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. "+Q", hl.dsp.window.close())
hl.bind(mod .. "+F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod .. "+SHIFT+F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mod .. "+left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. "+up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. "+down", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. "+SHIFT+left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. "+SHIFT+right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. "+SHIFT+up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. "+SHIFT+down", hl.dsp.window.move({ direction = "down" }))

hl.bind(mod .. "+CTRL+left", hl.dsp.window.resize({ x = -50, y = 0 }))
hl.bind(mod .. "+CTRL+right", hl.dsp.window.resize({ x = 50, y = 0 }))
hl.bind(mod .. "+CTRL+up", hl.dsp.window.resize({ x = 0, y = -50 }))
hl.bind(mod .. "+CTRL+down", hl.dsp.window.resize({ x = 0, y = 50 }))

hl.bind(mod .. "+1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. "+2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. "+3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. "+4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. "+5", hl.dsp.focus({ workspace = 5 }))

hl.bind(mod .. "+SHIFT+1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mod .. "+SHIFT+2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mod .. "+SHIFT+3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mod .. "+SHIFT+4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mod .. "+SHIFT+5", hl.dsp.window.move({ workspace = 5 }))

hl.bind(mod .. "+mouse:272", hl.dsp.window.drag())
hl.bind(mod .. "+mouse:273", hl.dsp.window.resize())
