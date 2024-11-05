local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
local silent = { silent = true, noremap = true }

map("", "<Space>", "<Nop>", silent)
-- leader keys set in lazy.lua
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

function remap_all(lhs, rhs)
	-- map("c", lhs, rhs, opts)
	-- map("i", lhs, rhs, opts)
	-- map("n", lhs, rhs, opts)
	-- map("v", lhs, rhs, opts)
	-- map("r", lhs, rhs, opts)
	-- map("b", lhs, rhs, opts)
	-- map("o", lhs, rhs, opts)
	vim.cmd [[noremap <F7> <Esc>]]
	vim.cmd [[noremap! <F7> <Esc>]]
	vim.cmd [[cnoremap <F7> <C-C>]]
end

function remap_motion(lhs, rhs)
	map("n", lhs, rhs, opts)
	map("v", lhs, rhs, opts)
	map("n", string.upper(lhs), string.upper(rhs), opts)
	-- map("v", string.upper(lhs), string.upper(rhs), opts)
end

remap_motion("h", "i")
remap_motion("i", "k")
remap_motion("k", "j")
remap_motion("j", "h")

-- remap_motion('y','"+y')
-- remap_motion('p','"+p')

remap_all("<F7>", "<ESC>")
remap_all("<CAPS>", "<ESC>")

map("n", "ch", "ci", opts)
