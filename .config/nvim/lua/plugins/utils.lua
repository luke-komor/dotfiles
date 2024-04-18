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
		end,
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
		{ "akinsho/toggleterm.nvim", version = "*", config = true },
	},
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
}
