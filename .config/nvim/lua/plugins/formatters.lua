return {
	{
		"stevearc/conform.nvim",
		opts = function()
			local opts = {
				format = {
					timeout_ms = 1000,
					async = false,
					lsp_fallback = true,
					-- quiet = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clang_format" },
				},
			}
			return opts
		end,
	},
}
