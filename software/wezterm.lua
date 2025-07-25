-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Latte"
-- config.color_scheme = "ChallengerDeep"

-- This is the font configuration.  If unset, we default to the font.
wezterm.on("update-right-status", function(window, pane)
	-- "Wed Mar 3 08:14"
	local date = wezterm.strftime("%a %b %-d %H:%M ")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.mdi_clock .. " " .. date },
	}))
end)

-- keymap setting ups
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
-- font setting ups
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16
-- add scroll bar
config.enable_scroll_bar = true
config.scrollback_lines = 10000
config.min_scroll_bar_height = "2cell"
config.window_background_opacity = 1.0
-- and finally, return the configuration to wezterm
return config
