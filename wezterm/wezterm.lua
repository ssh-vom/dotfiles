-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local dimmer = { brightness = 0.05}
local wallpaper_list = require 'wallpaperList'
-- This is where you actually apply your config choices
local file_path= wallpaper_list[4]
if file_path == wallpaper_list[3] then offset_y = '-80%' else offset_y = '0%' end

config.background = {
	{
		source = {
			File=file_path
		},
		
		hsb = dimmer,
		vertical_offset = offset_y
	}
}
-- For example, changing the color scheme:



-- and finally, return the configuration to wezterm
return config
