-- local function get_pipenv_dir()
--   return vim.fn.trim(vim.fn.system 'pipenv --venv')
-- end

-- require 'nvim-treesitter.install'.compilers = { "gcc" }

local lsp_zero = require('lsp-zero')


require('mason').setup({
	-- PATH = "prepend",
})
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls", "gopls", "tsserver" },
	handlers = {
		lsp_zero.default_setup,
	}
})

require('lspconfig').dartls.setup({
	cmd = { "dart", 'language-server', '--protocol=lsp' },
})
require('lspconfig').eslint.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').pylsp.setup({})
-- require('lspconfig').ast_grep.setup({})
lsp_zero.setup_servers({
	'html',
	'htmx',
	'lua_ls',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		--['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		--['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	})
})

lsp_zero.set_preferences({
	sign_icons = {}
})

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	local opts = { buffer = bufnr }
	vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

	-- format on save
	-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

	-- updatetime affects CursorHold
	vim.o.updatetime = 250

	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				--border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})

	-- lsp_lines
	vim.diagnostic.config({
		virtual_text = false,
		virtual_lines = false,
		signs = true,
		float = {
			border = "single",
			format = function(diagnostic)
				return string.format(
					"%s (%s) [%s]",
					diagnostic.message,
					diagnostic.source,
					diagnostic.code or diagnostic.user_data.lsp.code
				)
			end,
		},
	})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		'html',
		-- 'htmx',
	},
	handlers = {
		lsp_zero.default_setup,
	}
})

-- diagnostics aka errors
local function setup_lsp_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			virtual_text = false,
			signs = true,
			update_in_insert = false,
			underline = true,
		}
	)
end

require("lsp_lines").setup()

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

-- If you don't want to use the telescope plug-in but still want to see all the errors/warnings, comment out the telescope line and uncomment this:
-- vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

--vim.fn.sign_define('DiagnosticSignError', { text = 'EE', texthl = 'DiagnosticSignError' })
--
lsp_zero.setup()


require('Comment').setup({
	toggler = {
		line = ',c',
		block = ',b',
	},
	opleader = {
		line = ',c',
		block = ',b',
	},
})
