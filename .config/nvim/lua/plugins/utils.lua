return {
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
	},
	{
		"OscarCreator/rsync.nvim",
		build = "make",
        cmd = "RsyncUp",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("rsync").setup()
		end
    },
	{
		"LunarVim/bigfile.nvim",
		lazy = false,
	},
	{
		"stevearc/oil.nvim",
        cmd = "Oil",
		opts = {
			default_file_explorer = false,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
			require("oil").setup(opts)
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"dfendr/clipboard-image.nvim",
        branch = "patch-1",
        cmd = "PasteImg"
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	},
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
	{
		"nvim-neorg/neorg",
		lazy = true,
		build = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								work = "~/notes/work",
								home = "~/notes/home",
							},
						},
					},
				}, -- configuration here
			})
		end,
	},
	{
		"https://gitlab.com/itaranto/plantuml.nvim",
		version = "*",
		config = function()
			require("plantuml").setup()
		end,
	},
	{
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},
	{
		"javiorfo/nvim-soil",
		lazy = true,
		ft = "plantuml",
		config = function()
			-- If you want to change default configurations
		end,
	},

	-- Optional for puml syntax highlighting:
	{ "javiorfo/nvim-nyctophilia" },
	{
		"amitds1997/remote-nvim.nvim",
        cmd = "RemoteStart",
		version = "*", -- This keeps it pinned to semantic releases
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			-- This would be an optional dependency eventually
			"nvim-telescope/telescope.nvim",
		},
		config = true, -- This calls the default setup(); make sure to call it
	},
	{
		"3rd/image.nvim",
		event = "BufEnter *.md",
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			},
			max_width = nil,
			max_height = nil,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			kitty_method = "normal",
            tmux_show_only_in_active_window = false,
		},
	},
    {
"dhruvasagar/vim-table-mode",
        lazy = false
    }
}
