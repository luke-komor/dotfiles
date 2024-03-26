local wezterm = require("wezterm")
local act = wezterm.action

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
		-- return 'Oxocarbon Dark (Gogh)'
	else
		return "Catppuccin Latte"
	end
end

function get_scheme_type(appearance)
	if appearance:find("Dark") then
		return "dark"
		-- return 'Oxocarbon Dark (Gogh)'
	else
		return "light"
	end
end

return {
	--	front_end = "WebGpu",
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	default_domain = "WSL:Ubuntu-20.04",
	wsl_domains = {
		{
			name = "WSL:Ubuntu-20.04",
			distribution = "Ubuntu-20.04",
			default_prog = { "/home/luke/init.sh", get_scheme_type(wezterm.gui.get_appearance()) },
			default_cwd = "/home/luke",
		},
	},
	--color_scheme = "Everforest Dark (Gogh)",
	-- colors = {
	--     background = "#242933",
	-- },
	hide_tab_bar_if_only_one_tab = true,
    win32_system_backdrop = 'Tabbed',
	-- initial_rows = 50,
	-- initial_cols = 100,
	-- window_decorations = "resize",
	window_background_opacity = 0.2,
	max_fps = 120,
	-- line_height = 1.2,
	-- font = wezterm.font("FiraCode Nerd Font", { weight = "Bold" }),
	-- font = wezterm.font("FiraCode Nerd Font"),
	-- font = wezterm.font("MesloLGM Nerd Font Mono", {weight = "Bold"}),
	-- font = wezterm.font("JetBrainsMono Nerd Font"),
	-- font = wezterm.font("MesloLGM Nerd Font Mono", {}),
	-- font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
	-- font = wezterm.font("Monaspace Neon"),
	-- freetype_load_flags = 'NO_HINTING',
	-- freetype_load_target = 'Light',
	-- freetype_render_target = 'HorizontalLcd',
	font_size = 11,
	-- harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
	font_rules = {
		-- {
		-- 	intensity = "Bold",
		-- 	italic = false,
		-- 	font = wezterm.font({ family = "Monaspace Krypton", weight = "DemiLight" }),
		-- },
		-- {
		-- 	intensity = "Bold",
		-- 	italic = true,
		-- 	font = wezterm.font({ family = "Monaspace Argon", weight = "DemiLight" }),
		-- },
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "Monaspace Neon",
				weight = "DemiLight",
				harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
				-- italic = true,
			}),
		},
		-- {
		-- 	intensity = "Normal",
		-- 	font = wezterm.font({
		-- 		family = "FiraCode Nerd Font",
		-- 		-- weight = "DemiBold",
		-- 	}),
		-- },
	},

	window_frame = {
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		font_size = 10.0,
	},
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
	keys = {
		{
			key = "F11",
			action = wezterm.action.ToggleFullScreen,
		},
		{ key = "t", mods = "SHIFT|ALT", action = act.SpawnTab("DefaultDomain") },
		{
			key = "r",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ReloadConfiguration,
		},
	},
	ssh_domains = {
		{
			name = "my.server",
			remote_address = "10.237.214.49",
			local_echo_threshold_ms = 10,
		},
	},
}
