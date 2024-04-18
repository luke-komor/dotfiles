-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.shiftwidth = 4
opt.tabstop = 4
opt.spell = true
opt.scrollback = 1000
opt.grepprg="grep -n $* /dev/null"
opt.grepformat="%f:%l:%m,%f:%l%m,%f  %l%m"

vim.g.autoformat = false -- globally
vim.b.autoformat = false -- buffer-local
vim.g.base16_colorspace = 256
-- vim.o.autoread = true

-- opt.listchars="tab:>-,trail:~,extends:>,precedes:<"
vim.o.guifont = "JetBrainsMono Nerd Font:h10" -- text below applies for VimScript
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"
vim.opt.fillchars = vim.opt.fillchars + "diff: "

if vim.g.neovide == true then
	-- vim.g.neovide_transparency = 0.95

	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- vim.g.neovide_profiler = true
	vim.g.neovide_refresh_rate = 60
	-- vim.g.neovide_fullscreen = true

    vim.g.neovide_cursor_animation_length = 0
    vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_scale_factor = 1.0

	vim.api.nvim_set_keymap(
		"n",
		"<C-=>",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-->",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ silent = true }
	)
	vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1.0<CR>", { silent = true })
	vim.cmd("cd ~")
end

vim.cmd [[
    let g:github_enterprise_urls = ['https://github.com']
    let g:loaded_netrwPlugin = 1
]]


package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
