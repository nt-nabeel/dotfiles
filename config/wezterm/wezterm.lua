local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.use_fancy_tab_bar = false

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.0
config.line_height = 1.2

config.color_schemes = {
	["Solarized Osaka Dark"] = {
		foreground = "#839395",
		background = "#001419",
		cursor_bg = "#839395",
		cursor_border = "#839395",
		cursor_fg = "#001419",
		selection_bg = "#1a6397",
		selection_fg = "#839395",

		ansi = { "#001014", "#db302d", "#849900", "#b28500", "#268bd3", "#d23681", "#29a298", "#9eabac" },
		brights = { "#001419", "#db302d", "#849900", "#b28500", "#268bd3", "#d23681", "#29a298", "#839395" },

		tab_bar = {
			inactive_tab_edge = "#002c38",
			background = "#191b28",

			active_tab = {
				fg_color = "#268bd3",
				bg_color = "#001419",
			},

			inactive_tab = {
				bg_color = "#002c38",
				fg_color = "#063540",
			},

			inactive_tab_hover = {
				bg_color = "#002c38",
				fg_color = "#268bd3",
			},

			new_tab_hover = {
				fg_color = "#002c38",
				bg_color = "#268bd3",
			},

			new_tab = {
				fg_color = "#268bd3",
				bg_color = "#191b28",
			},
		},
	},
}
config.color_scheme = "Solarized Osaka Dark"

return config
