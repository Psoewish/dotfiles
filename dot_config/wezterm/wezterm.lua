local wezterm = require("wezterm")
wezterm.add_to_config_reload_watch_list(wezterm.config_dir)

local config = {
  default_prog = { 'fish' },

  color_scheme = 'rose-pine',
  font = wezterm.font 'CaskaydiaCove Nerd Font',
  font_size = 12,
  window_background_opacity = 0.800000,

  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = 'NeverPrompt',

  window_padding = {
    left = 10,
    right = 10,
    bottom = 10,
    top = 10,
  },
};

return config
