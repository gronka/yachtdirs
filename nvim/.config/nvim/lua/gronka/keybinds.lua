local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<C-f>', builtin.git_files, { desc = 'Telescope git files' })
-- vim.keymap.set('n', '<leader>fs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end, { desc = 'Telescope grep files' })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- from Primeagen. not working
-- vim.keymap.set("v", "I", ":m '>+1<CR>gv=gv'")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

-- use vhw to select and paste over a word
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "Q", "<nop>")

vim.api.nvim_set_keymap('n',
	'<leader>do',
	'<cmd>lua vim.diagnostic.open_float()<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n',
	'<leader>d[',
	'<cmd>lua vim.diagnostic.goto_prev()<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n',
	'<leader>d]',
	'<cmd>lua vim.diagnostic.goto_next()<CR>',
	{ noremap = true, silent = true })

-- The following command requires plug-ins "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", and optionally "kyazdani42/nvim-web-devicons" for icon support
vim.api.nvim_set_keymap('n',
	'<leader>dd',
	'<cmd>Telescope diagnostics<CR>',
	{ noremap = true, silent = true })

-- require('Comment').setup({
-- 	toggler = {
-- 		line = ',c',
-- 		block = ',b',
-- 	},
-- 	opleader = {
-- 		line = ',c',
-- 		block = ',b',
-- 	},
-- })
