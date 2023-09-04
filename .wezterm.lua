local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false }, 
  }
}

config.color_scheme = 'GruvboxDarkHard'
config.colors = {
  foreground = 'bdbbb4', 
  background = '282727',
  ansi = {
    '282727', -- black
    'cb231d', -- red
    '98961a', -- green
    'd69821', -- yellow
    '458487', -- blue
    '918b86', -- magenta
    '689c69', -- cyan
    'a89883', -- white
  },
  brights = {
    '918b86', -- black
    'fa4834', -- red
    'b8ba26', -- green
    'f9bc2f', -- yellow
    '83a497', -- blue
    'fb4833', -- magenta
    '918b86', -- cyan
    'bdbbb4', -- white
  },
}
config.font = wezterm.font 'FiraCode Nerd Font Mono'

return config
