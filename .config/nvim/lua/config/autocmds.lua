-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "*" },
-- 	callback = function()
-- 		vim.b.autoformat = false
-- 	end,
-- })
vim.cmd("autocmd FileType gitcommit,gitrebase,gitconfig,gitsendmail set bufhidden=delete")

vim.cmd("au TermOpen * setlocal nospell")
vim.cmd("autocmd BufNewFile,BufRead .vim-arsync setfiletype bash")
vim.cmd("autocmd BufNewFile,BufRead *.jrnl setfiletype markdown")
-- vim.cmd("autocmd BufNewFile,BufRead *.log setfiletype c")
vim.cmd("au TermOpen * lua vim.b.miniindentscope_disable = true")

vim.api.nvim_create_user_command("StartGbserverOnRemote", function()
	vim.fn.jobstart({
		-- os.execute(

		-- ),
	}, {
		on_exit = vim.api.nvim_echo({ { "done" } }, false, {}),
		on_stdout = vim.api.nvim_echo({ { "msg" } }, false, {}),
		on_stderr = vim.api.nvim_echo({ { "err" } }, false, {}),
	})
end, { bang = true })
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = "LspAttach_inlayhints",
--   callback = function(args)
--     if not (args.data and args.data.client_id) then
--       return
--     end
--
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     require("lsp-inlayhints").on_attach(client, bufnr)
--   end,
-- })
