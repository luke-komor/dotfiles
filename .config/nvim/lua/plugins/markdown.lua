return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
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
		lazy = false,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"dfendr/clipboard-image.nvim",
		cmd = "PasteImg",
		opts = {
			markdown = {
				img_dir = { "assets" },
				img_dir_txt = "assets",
			},
		},
	},
	{
		"https://github.com/adelarsq/image_preview.nvim",
		event = "VeryLazy",
		config = function()
			require("image_preview").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				window = {
					mappings = {
						["i"] = "image_wezterm", -- " or another map
					},
				},
				commands = {
					image_wezterm = function(state)
						local node = state.tree:get_node()
						if node.type == "file" then
							require("image_preview").PreviewImage(node.path)
						end
					end,
				},
			},
		},
	},
	-- {
	-- 	"MeanderingProgrammer/markdown.nvim",
	-- 	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter" },
	-- 	config = function()
	-- 		require("render-markdown").setup({
	-- 			headings = { "•   ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
	-- 			bullets = { "•", "○", "◆", "◇" },
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"tadmccorkle/markdown.nvim",
	-- 	ft = "markdown", -- or 'event = "VeryLazy"'
	-- 	opts = {
	-- 		-- configuration here or empty for defaults
	-- 	},
	-- },
	-- {
	-- 	"lukas-reineke/headlines.nvim",
	-- 	dependencies = "nvim-treesitter/nvim-treesitter",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("headlines").setup({
	-- 			markdown = {
	-- 				query = vim.treesitter.query.parse(
	-- 					"markdown",
	-- 					[[
	--
	--                (atx_heading [
	--                    (atx_h1_marker)
	--                    (atx_h2_marker)
	--                    (atx_h3_marker)
	--                    (atx_h4_marker)
	--                    (atx_h5_marker)
	--                    (atx_h6_marker)
	--                ] @headline)
	--
	--                (thematic_break) @dash
	--
	--                (fenced_code_block) @codeblock
	--
	--                (block_quote_marker) @quote
	--                (block_quote (paragraph (inline (block_continuation) @quote)))
	--                (block_quote (paragraph (block_continuation) @quote))
	--                (block_quote (block_continuation) @quote)
	--            ]]
	-- 				),
	-- 				headline_highlights = { "Headline" },
	-- 				bullet_highlights = {
	-- 					"@text.title.1.marker.markdown",
	-- 					"@text.title.2.marker.markdown",
	-- 					"@text.title.3.marker.markdown",
	-- 					"@text.title.4.marker.markdown",
	-- 					"@text.title.5.marker.markdown",
	-- 					"@text.title.6.marker.markdown",
	-- 				},
	-- 				bullets = { "◉", "○", "✸", "✿" },
	-- 				codeblock_highlight = "CodeBlock",
	-- 				dash_highlight = "Dash",
	-- 				dash_string = "-",
	-- 				quote_highlight = "Quote",
	-- 				quote_string = "┃",
	-- 				fat_headlines = true,
	-- 				fat_headline_upper_string = "▃",
	-- 				fat_headline_lower_string = "🬂",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
