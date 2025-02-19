vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd('CursorHold', {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
			--border = 'rounded',
			source = 'always',
			prefix = ' ',
			scope = 'cursor',
		}
		vim.diagnostic.open_float(nil, opts)
	end
})

-- local zero = require('lsp-zero')

-- require 'lspconfig'.dartls.setup({
-- 	cmd = { 'dart', 'language-server', '--protocol=lsp' },
-- })

-- -- zero.dartls.setup({
-- -- 	cmd = { 'dart', 'language-server', '--protocol=lsp' },
-- -- })
-- -- zero.eslint.setup({})
-- -- zero.gopls.setup({})
-- -- zero.ts_ls.setup({})
-- -- zero.pyright.setup({})
-- -- require('lspconfig').ast_grep.setup({})
-- zero.setup_servers({
-- 	'dartls',
-- 	'html',
-- 	'htmx',
-- 	'jinja_lsp',
-- 	'lua_ls',
-- 	'pyright',
-- 	-- 'salt_lsp',
-- 	'rust_analyzer',
-- })
--
-- require 'lspconfig'.dartls.setup {}
-- require 'lspconfig'.dart.setup {}
--
-- -- lsp_zero.set_preferences({
-- -- 	sign_icons = {}
-- -- })
--
-- zero.on_attach(function(client, bufnr)
-- 	-- see :help lsp-zero-keybindings
-- 	-- to learn the available actions
-- 	zero.default_keymaps({ buffer = bufnr })
--
-- 	-- format on save
-- 	vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
--
-- 	-- updatetime affects CursorHold
-- 	vim.o.updatetime = 250
--
-- 	vim.api.nvim_create_autocmd('CursorHold', {
-- 		buffer = bufnr,
-- 		callback = function()
-- 			local opts = {
-- 				focusable = false,
-- 				close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
-- 				--border = 'rounded',
-- 				source = 'always',
-- 				prefix = ' ',
-- 				scope = 'cursor',
-- 			}
-- 			vim.diagnostic.open_float(nil, opts)
-- 		end
-- 	})
--
-- 	-- lsp_lines
-- 	vim.diagnostic.config({
-- 		virtual_text = false,
-- 		virtual_lines = false,
-- 		signs = true,
-- 		float = {
-- 			border = 'single',
-- 			format = function(diagnostic)
-- 				return string.format(
-- 					"%s (%s) [%s]",
-- 					diagnostic.message,
-- 					diagnostic.source,
-- 					diagnostic.code or diagnostic.user_data.lsp.code
-- 				)
-- 			end,
-- 		},
-- 	})
-- end)
--
--
-- zero.setup()
