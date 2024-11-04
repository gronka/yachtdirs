vim.opt.clipboard = 'unnamedplus'

vim.cmd [[colorscheme tokyonight-night]]

-- from Primeagen (for transparency, I think)
-- function ColorMyPencils(color)
-- 	color = color or "tokyonight-night"
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- ColorMyPencils()
--

-- " Statusline
-- "let g:airline_powerline_fonts = 1  " this breaks airline on void - why?
-- %y - filetype
-- %F - full filepath
vim.cmd [[let g:airline_section_x = '']]
vim.cmd [[let g:airline_section_y = '%y']]
vim.cmd [[let g:airline_section_z = '%l/%L,%c']]
vim.cmd [[let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#']]

-- vim.cmd [[set iskeyword=@,48-57,_,192-255]]

-- " Search options
vim.cmd [[set ignorecase]]
vim.cmd [[set incsearch]]
vim.cmd [[set hlsearch]]
vim.cmd [[set wrapscan]]

-- set clipboard+=unnamed

-- " Cursor movement options
vim.cmd [[set backspace=indent,eol,start]]
vim.cmd [[set mouse=]]
vim.opt.scrolloff = 4 -- padding at end of file

vim.cmd [[set laststatus=2]]
vim.cmd [[set visualbell]]
vim.cmd [[set t_vb= " something to do with visualbell]]
vim.cmd [[set cmdheight=2]]
vim.cmd [[set ruler]]
vim.cmd [[set relativenumber]]
vim.cmd [[set number]]
vim.cmd [[set showcmd]]
vim.cmd [[set timeoutlen=500]]
vim.cmd [[set colorcolumn=80]]
vim.cmd [[set signcolumn=number]]

-- " Use <F11> to toggle paste, nopaste
-- ":set pastetoggle=<F11>

-- " Indentation
vim.cmd [[set shiftwidth=2]]
vim.cmd [[set softtabstop=2]]
vim.cmd [[set tabstop=2]]
-- "set expandtab
vim.cmd [[filetype indent on]]

-- " Reload files instead of asking
vim.cmd [[set autoread]]

-- " highlight current line
vim.cmd [[set cursorline]]
-- ":highlight CursorLine ctermbg=Black guibg=Black  " for dark theme?
vim.cmd [[highlight IncSearch ctermfg=red ctermbg=blue]]
-- ":highlight IncSearch ctermfg=gray  " might be nice, but ok for now
vim.cmd [[hi Pmenu ctermbg=black ctermfg=white]]

-- "set foldlevelstart=0
vim.cmd [[set foldlevel=4]]
-- "set fen
-- "set nofen

vim.cmd [[nnoremap <leader>j :tabprevious<CR>]]
vim.cmd [[nnoremap <leader>l :tabnext<CR>]]
vim.cmd [[nnoremap <c-t> :tabnew<CR>]]

-- CamelCaseMotion plugin for skipping periods, etc, with w
vim.cmd [[map <silent> w <Plug>CamelCaseMotion_w]]
vim.cmd [[map <silent> b <Plug>CamelCaseMotion_b]]
vim.cmd [[map <silent> e <Plug>CamelCaseMotion_e]]
vim.cmd [[sunmap w]]
vim.cmd [[sunmap b]]
vim.cmd [[sunmap e]]

vim.cmd [[vnoremap < < gv]]
vim.cmd [[vnoremap > > gv]]

-- " Paste in insert mode
-- "imap <C-v> <C-r>*

-- "let g:pymode_lint_write = 0
-- " let g:pep8_ignore="E501,E265,E128"
-- " let g:pymode_lint_ignore="E501,E265,E128"

-- "au BufNewfile, BufRead *.jinja2 set filetype=html
vim.cmd [[autocmd BufNewfile, BufRead *.dt set filetype=pug]]
vim.cmd [[autocmd BufNewfile, BufRead Gruntfile set filetype=javascript]]
vim.cmd [[autocmd BufNewFile, BufRead *.jsx set filetype=javascript]]
vim.cmd [[autocmd BufNewFile, BufRead *.jsonl set filetype=json]]
-- "autocmd FileType scss setlocal expandtab

-- " replace tabs with spaces in yaml
-- "autocmd FileType yaml execute  ':silent! %s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

-- " UI options
vim.cmd [[set mousehide]]     -- turn off mouse when typing
vim.cmd [[set guioptions-=l]]
vim.cmd [[set guioptions-=r]] -- no right hand scrollbar
vim.cmd [[set guioptions-=b]]
vim.cmd [[set guioptions-=m]]
vim.cmd [[set guioptions-=T]]    -- remove toolbar
vim.cmd [[set guioptions-=L]]    -- remove left-hand scrollbar when v-split
vim.cmd [[set guioptions+=c]]    -- use console dialogs when possible
vim.cmd [[set guioptions-=e]]
vim.cmd [[set visualbell t_vb=]] -- turn off flashing (needs to be in gvimrc too)
vim.cmd [[highlight Cursor guifg=white guibg=black]]
vim.cmd [[highlight iCursor guifg=white guibg=steelblue]]

-- "set guicursor=a:blinkon4000-blinkoff4000  " Slow down cursor blinking speed"
vim.cmd [[set guicursor=a:blinkon0]] -- turn off cursor blinking
vim.cmd [[set guicursor=i:ver1000-iCursor]]

-- " toggle line highlight on changing insert mode
-- ":autocmd InsertEnter,InsertLeave * set cul!

-- " highlight colons to distinguish them from semicolons
-- "match todo /;/

-- " fix == to indent, aligns at function parentheses
-- "set cino+=(0
-- "setlocal cinoptions-=(2s
-- "setlocal cinoptions+=(s

-- " Javscript settings (.js)
vim.cmd [[autocmd FileType javascript,javascriptreact set sw=2]]
vim.cmd [[autocmd FileType javascript,javascriptreact set ts=2]]
vim.cmd [[autocmd FileType javascript,javascriptreact set sts=2]]
vim.cmd [[autocmd FileType javascript,javascriptreact set textwidth=79]]
vim.cmd [[autocmd FileType javascript,javascriptreact set expandtab]]

-- "autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
vim.cmd [[autocmd FileType typescript,.tsx set sw=2]]
vim.cmd [[autocmd FileType typescript,.tsx set ts=2]]
vim.cmd [[autocmd FileType typescript,.tsx set sts=2]]
vim.cmd [[autocmd FileType typescript,.tsx set expandtab]]

vim.cmd [[autocmd FileType typescriptreact set sw=2]]
vim.cmd [[autocmd FileType typescriptreact set ts=2]]
vim.cmd [[autocmd FileType typescriptreact set sts=2]]
vim.cmd [[autocmd FileType typescriptreact set expandtab]]

vim.cmd [[set nomodeline]]

-- set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 10

-- " trailing double slace avoids name collision; i dont like it
vim.cmd [[set undodir=/tmp/$USER]]
vim.cmd [[set backupdir=/tmp/$USER]]
vim.cmd [[set directory=/tmp/$USER]]

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- from Primeagen, idk what they do
vim.opt.termguicolors = true
vim.opt.updatetime = 250

-- "set nobackup
-- "set nowritebackup

vim.filetype.add {
	extension = {
		jinja = 'jinja',
		jinja2 = 'jinja',
		j2 = 'jinja',
		sls = 'jinja',
	},
}
