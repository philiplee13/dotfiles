1   -- Pull in the wezterm API
  1 local wezterm = require("wezterm")
  2
  3 -- This will hold the configuration.
  4 local config = wezterm.config_builder()
  5
  6 -- This is where you actually apply your config choices
  7
  8 config.font = wezterm.font("MesloLGS Nerd Font Mono")
  9 config.font_size = 19
 10
 11 config.enable_tab_bar = false
 12
 13 config.color_scheme = "Catppuccin Frappe"
 14
 15
 16 config.window_decorations = "RESIZE"
 17
 18 config.window_background_opacity = 0.8
 19 config.macos_window_background_blur = 10
 20
 21 -- and finally, return the configuration to wezterm
 22 return config
~
