local wezterm = require("wezterm")
local config = {}
local action = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- zsh stays the login shell; fish is the interactive shell
local brew_prefix = wezterm.target_triple:find("darwin") and "/opt/homebrew" or "/home/linuxbrew/.linuxbrew"
config.default_prog = { brew_prefix .. "/bin/fish", "-l" }

config.keys = {
	-- Splitting and closing panes
	{ key = "d", mods = "CMD", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "CMD", action = action.CloseCurrentPane({ confirm = false }) },
	-- Selecting active pane
	{ key = "LeftArrow", mods = "CMD|ALT", action = action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD|ALT", action = action.ActivatePaneDirection("Right") },
	{ key = "DownArrow", mods = "CMD|ALT", action = action.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "CMD|ALT", action = action.ActivatePaneDirection("Up") },
	-- Maximise pane
	{ key = "Enter", mods = "CMD|SHIFT", action = action.TogglePaneZoomState },
	-- Natural text editing
	{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
}

config.color_scheme = "Gruvbox dark, hard (base16)"

config.colors = {
	foreground = "bdbbb4",
	background = "282727",
	selection_fg = "ebdbb2",
	selection_bg = "504945",
	ansi = {
		"3c3836", -- black
		"cb231d", -- red
		"98961a", -- green
		"d69821", -- yellow
		"458487", -- blue
		"918b86", -- magenta
		"689c69", -- cyan
		"a89883", -- white
	},
	brights = {
		"665c54", -- black
		"fa4834", -- red
		"b8ba26", -- green
		"f9bc2f", -- yellow
		"918b86", -- blue
		"fb4833", -- magenta
		"918b86", -- cyan
		"bdbbb4", -- white
	},
}

config.bold_brightens_ansi_colors = true
config.inactive_pane_hsb = {
	saturation = 1,
	brightness = 0.7,
}
config.hide_tab_bar_if_only_one_tab = true
-- Keep the title bar but leave it empty
wezterm.on("format-window-title", function()
	return ""
end)

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 14
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.default_cursor_style = 'SteadyBlock'

return config
