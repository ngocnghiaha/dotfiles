-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

config.max_fps = 90
config.enable_wayland = false
config.enable_tab_bar = false
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

config.initial_cols = 90
config.initial_rows = 25

config.force_reverse_video_cursor = true

config.font = wezterm.font 'Maple Mono'
config.harfbuzz_features = {'cv01', 'vc02', 'cv03', 'cv04','ss01', 'ss02', 'ss03', 'ss04', 'ss05'}
config.font_size = 13

config.color_scheme = 'Tokyo Night'

return config
