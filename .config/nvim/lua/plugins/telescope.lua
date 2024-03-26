return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-live-grep-args.nvim",
			"princejoogie/dir-telescope.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{ "<leader>sg", "<cmd>Telescope live_grep_args<cr>", desc = "Live grep args" },
			{ "<leader>tp", "<cmd>Telescope pickers<cr>", desc = "pickers" },
			{ "<leader>sG", "<cmd>Telescope dir live_grep<CR>", desc = "Dir live grep" },
			{ "<leader>fd", "<cmd>Telescope dir find_files<CR>", desc = "Dir find files" },
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					prompt_position = "top",
					width = 0.95,
					height = 0.95,
				},
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					i = {
						["<C-e>"] = function()
							local prompt_bufnr = vim.api.nvim_get_current_buf()
							return require("telescope.actions.layout").toggle_preview(prompt_bufnr)
						end,
						["<C-Down>"] = require("telescope.actions").cycle_history_next,
						["<C-Up>"] = require("telescope.actions").cycle_history_prev,
					},
				},
				preview = {
					hide_on_startup = false, -- hide previewer when picker starts
				},
				-- vimgrep_arguments = {
				-- 	"grep",
				-- 	"--extended-regexp",
				-- 	"--color=never",
				-- 	"--with-filename",
				-- 	"--line-number",
				-- 	"-b", -- grep doesn't support a `--column` option :(
				-- 	"--ignore-case",
				-- 	"--recursive",
				-- 	"--no-messages",
				-- 	"--exclude-dir=*cache*",
				-- 	"--exclude-dir=*.git",
				-- 	"--exclude=.*",
				-- 	"--binary-files=without-match",
				-- },
			},
			pickers = {
				current_buffer_fuzzy_find = {
					previewer = false,
				},
			},
			extensions = {
				advanced_git_search = {

					-- fugitive or diffview
					diff_plugin = "diffview",
					-- customize git in previewer
					-- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
					git_flags = {},
					-- customize git diff in previewer
					-- e.g. flags such as { "--raw" }
					git_diff_flags = {},
					-- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
					show_builtin_git_pickers = false,
					entry_default_author_or_date = "author", -- one of "author" or "date"

					-- Telescope layout setup
					telescope_theme = {
						function_name_1 = {
							-- Theme options
						},
						function_name_2 = "dropdown",
						-- e.g. realistic example
						show_custom_functions = {
							layout_config = { width = 0.4, height = 0.4 },
						},
					},
				},
				live_grep_args = {
					auto_quoting = false, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = function()
								return require("telescope-live-grep-args.actions").quote_prompt()
							end,
							["<C-i>"] = function()
								return require("telescope-live-grep-args.actions").quote_prompt({
									postfix = " --iglob ",
								})
							end,
						},
					},
				},
			},
		},
		config = function(_, opts)
			-- require("telescope").load_extension("fzf")
			require("telescope").setup(opts)
			require("telescope").load_extension("live_grep_args")
			require("telescope").load_extension("dir")
			require("telescope").load_extension("advanced_git_search")
		end,
	},
}
