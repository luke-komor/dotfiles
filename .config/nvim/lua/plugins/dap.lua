return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "mason.nvim",
		opts = {
			automatic_installation = false,
			handlers = {
				function(config)
					-- all sources with no handler get passed here

					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
				cppdbg = function(config)
					config.configurations = {
						{
							name = "Launch file blbla",
							type = "cppdbg",
							request = "launch",
							program = function()
								return vim.fn.input("Path to  asdasdasd: ", vim.fn.getcwd() .. "/", "file")
							end,
							cwd = "${workspaceFolder}",
							stopAtEntry = true,
						},
					}
					require("mason-nvim-dap").default_setup(config) -- don't forget this!
				end,
			},
			ensure_installed = {},
		},
		-- config = function(_, opts)
		--     require("mason-nvim-dap").setup(opts)
		-- end
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.adapters.perl = {
				type = "executable",
				command = vim.env.MASON .. "/bin/perl-debug-adapter",
				args = {},
			}

			dap.configurations.perl = {
				{
					type = "perl",
					request = "launch",
					name = "Launch Perl",
					program = "${workspaceFolder}/${relativeFile}",
				},
			}
			-- this is optional but can be helpful when starting out
			dap.set_log_level("TRACE")
		end,
	},
}
