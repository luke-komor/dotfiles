return {
	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	opts = {
	-- 		render = "wrapped-compact",
	-- 		fps = 60,
	-- 		timeout = 5,
	-- 		stages = "static",
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("notify").setup(opts)
	-- 	end,
	-- },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
    {
        "xiyaowong/transparent.nvim",
        lazy = false
    },
	-- { -- Theme inspired by Atom
	--     'navarasu/onedark.nvim',
	--     priority = 1000,
	--     lazy = false,
	--     config = function()
	--     require('onedark').setup {
	--         -- Set a style preset. 'dark' is default.
	--         style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
	--     }
	--     require('onedark').load()
	--     end,
	-- },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
            local os_theme_path = vim.fn.expand("$HOME/os_theme")
            local os_theme_readable = vim.fn.filereadable(os_theme_path) == 1 and true or false

            if os_theme_readable then
                local theme = vim.fn.readfile(os_theme_path)[1]
			    vim.cmd("set background="..theme)
            end

			require("catppuccin").setup()
		end,
	},
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
        config = function(_, opts)
            require("notify").setup(opts)
        end
    },
	{
		"folke/twilight.nvim",
	},
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
	},
	{

		"HiPhish/rainbow-delimiters.nvim",
		lazy = false,
	},
	{
		"fei6409/log-highlight.nvim",
		event = "BufEnter *.log",
		config = function()
			require("log-highlight").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		keys = {
			{ "<leader>xf", "<cmd>TodoTrouble keywords=FIXIT<cr>", desc = "Fixit (Trouble)" },
		},
	},
	{
		"folke/trouble.nvim",
		opts = { use_diagnostic_signs = true },
	},
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		opts = function()
			local icons = require("lazyvim.config").icons
			local Util = require("lazyvim.util")

			vim.o.laststatus = vim.g.lualine_laststatus

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "starter", "alpha" } },
					component_separators = "|",
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
						{
							function()
								return require("nvim-navic").get_location()
							end,
							cond = function()
								return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
							end,
						},
					},
					lualine_x = {
						{
							function()
								return require("noice").api.status.command.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.command.has()
							end,
							color = Util.ui.fg("Statement"),
						},
						{
							function()
								return require("noice").api.status.mode.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.mode.has()
							end,
							color = Util.ui.fg("Constant"),
						},
						{
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
							color = Util.ui.fg("Debug"),
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = Util.ui.fg("Special"),
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
						{
							function()
								local ok, pomo = pcall(require, "pomo")
								if not ok then
									return ""
								end

								local timer = pomo.get_first_to_finish()
								if timer == nil then
									return ""
								end

								return "󰄉 " .. tostring(timer)
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree", "lazy" },
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
	},
	-- {
	--     "lvimuser/lsp-inlayhints.nvim",
	--     lazy = false
	-- }
	--
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				mode = "tabs",
			},
		},
	},
}
