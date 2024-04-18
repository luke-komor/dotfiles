vim.keymap.set(
	"n",
	"<Leader>fh",
	':lua require"telescope.builtin".find_files({ hidden = true, no_ignore=true })<CR>',
	{ desc = "Find files hidden also", noremap = true, silent = true }
)

local wk = require("which-key")
wk.register({
	g = {
		name = "+Git",
		h = {
			name = "+Github",
			c = {
				name = "+Commits",
				c = { "<cmd>GHCloseCommit<cr>", "Close" },
				e = { "<cmd>GHExpandCommit<cr>", "Expand" },
				o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
				p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
				z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
			},
			i = {
				name = "+Issues",
				p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
			},
			l = {
				name = "+Litee",
				t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
			},
			r = {
				name = "+Review",
				b = { "<cmd>GHStartReview<cr>", "Begin" },
				c = { "<cmd>GHCloseReview<cr>", "Close" },
				d = { "<cmd>GHDeleteReview<cr>", "Delete" },
				e = { "<cmd>GHExpandReview<cr>", "Expand" },
				s = { "<cmd>GHSubmitReview<cr>", "Submit" },
				z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
			},
			p = {
				name = "+Pull Request",
				c = { "<cmd>GHClosePR<cr>", "Close" },
				d = { "<cmd>GHPRDetails<cr>", "Details" },
				e = { "<cmd>GHExpandPR<cr>", "Expand" },
				o = { "<cmd>GHOpenPR<cr>", "Open" },
				p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
				r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
				t = { "<cmd>GHOpenToPR<cr>", "Open To" },
				z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
			},
			t = {
				name = "+Threads",
				c = { "<cmd>GHCreateThread<cr>", "Create" },
				n = { "<cmd>GHNextThread<cr>", "Next" },
				t = { "<cmd>GHToggleThread<cr>", "Toggle" },
			},
		},
	},
	D = {
		name = "+diff",
		d = { "<cmd>DiffviewOpen<cr>", "Open git diff" },
		c = { "<cmd>DiffviewClose<cr>", "Close diff" },
		f = { "<cmd>DiffviewToggleFiles<cr>", "Toggle files diff" },
		l = { "<cmd>DiffviewFocusFiles<cr>", "Focus files" },
		h = { "<cmd>DiffviewFileHistory %<cr>", "Current file history" },
		m = { "<cmd>DiffviewOpen main -- % <cr>", "Diff this file with main branch" },
	},
}, { prefix = "<leader>" })
--
vim.keymap.set("n", "<C-h>", "<cmd> wincmd h | NvimTmuxNavigateLeft <cr>")
vim.keymap.set("n", "<C-j>", "<cmd> wincmd j | NvimTmuxNavigateDown <cr>")
vim.keymap.set("n", "<C-k>", "<cmd> wincmd k | NvimTmuxNavigateUp <cr>")
vim.keymap.set("n", "<C-l>", "<cmd> wincmd l | NvimTmuxNavigateRight <cr>")

local opts = { noremap = true, silent = false }

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { dir = 'pages', title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap(
	"n",
	"<leader>zf",
	"<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
	opts
)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)
