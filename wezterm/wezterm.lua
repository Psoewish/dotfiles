local wezterm = require 'wezterm'

local config = {
  default_prog = {'nu'},
  font = wezterm.font ('CaskaydiaCove Nerd Font'),
  font_size = 14,
  color_scheme = 'rose-pine',
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = "NeverPrompt",
  enable_wayland = true,
  window_padding = {
    left = 10,
    right = 10,
    bottom = 10,
    top = 10,
  },
}

return config
