let g:python3_host_prog='/home/mack/apps/miniconda3/envs/tethys/bin'
" :verbose map <C-W>
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" :PluginList
" :PluginInstall(!)
" :PluginSearch(!)
" :PluginClean(!)
" :h vundle

Plugin 'gmarik/Vundle.vim'

" Colors
"Plugin 'tpope/vim-vividchalk'
" Plugin 'vim-scripts/Solarized'
Plugin 'shaunsingh/solarized.nvim'
"Plugin 'itchyny/landscape.vim'
"Plugin 'vim-scripts/Lucius'
Plugin 'folke/tokyonight.nvim'

Plugin 'numToStr/Comment.nvim'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Syntax highlighting
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'idanarye/vim-dutyl'  " Dlang
Plugin 'digitaltoad/vim-jade' " for diet/jade highlighting
Plugin 'gregsexton/MatchTag' " html tag highlighting
Plugin 'JulesWang/css.vim'
Plugin 'elubow/cql-vim'
Plugin 'gabrielelana/vim-markdown'
Plugin 'lifepillar/pgsql.vim'
Plugin 'ekalinin/Dockerfile.vim'

" Golang
Plugin 'charlespascoe/vim-go-syntax'
Plugin 'codelitt/vim-qtpl'

" Misc
Plugin 'jwhitley/vim-matchit' "for matching ML tags, etc
Plugin 'tmhedberg/SimpylFold'
Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-capslock'  " <C-G>c or gC for caps-lock
Plugin 'terryma/vim-multiple-cursors'

" Quality Of Life
Plugin 'mattn/webapi-vim'  " reads json config for emmet
Plugin 'kien/ctrlp.vim'  " fuzzy file finder
Plugin 'bling/vim-airline'  " improved statuslines
Plugin 'edkolev/tmuxline.vim'  " statusline with airline integration
Plugin 'cespare/vim-toml'
Plugin 'mhartington/formatter.nvim'

" Python
"Plugin 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plugin 'jmcantrell/vim-virtualenv'

" Flutter
"Plugin 'thosakwe/vim-flutter'
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" START LSP-ZERO
Plugin 'williamboman/mason.nvim'
Plugin 'williamboman/mason-lspconfig.nvim'

Plugin 'neovim/nvim-lspconfig'

" Autocompletion
Plugin 'hrsh7th/nvim-cmp'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'L3MON4D3/LuaSnip'

Plugin 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
" END LSP-ZERO

"Plugin 'folke/trouble.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
Plugin 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

call vundle#end()
filetype plugin indent on

" Statusline
"let g:airline_powerline_fonts = 1  " this breaks airline on void - why?
let g:airline_section_x = '%y'  " filetype (vim)
let g:airline_section_y = ''  " file encoding[fileformat] (utf-8[unix])
let g:airline_section_z = '%l/%L,%c'  " file encoding[fileformat] (utf-8[unix])

noremap <F7> <Esc>
noremap! <F7> <Esc>
cnoremap <F7> <C-C>
" noremap <F15> <Esc>
" noremap! <F15> <Esc>
" cnoremap <F15> <C-C>
" map <F19> <Esc>
" map! <F19> <Esc>
" virtual capslock
" imap <leader><F19> <Plug>CapsLockToggle
map CAPS <Esc>

" Syntax highlighting
syntax on
nnoremap <SPACE> <Nop>
let mapleader = " "
" set t_Co=256

" Search options
set ignorecase
set incsearch
set hlsearch
set wrapscan
"nnoremap <esc> :noh<return><esc>

set clipboard+=unnamed

" Cursor movement options
set backspace=indent,eol,start
":set nostartofline
set mouse=
"set mousemodel=extend
"set mousefocus
set scrolloff=1 " set lines above/below cursor

set laststatus=2
set visualbell
set t_vb= " something to do with visualbell
set cmdheight=2
set ruler
set relativenumber
set number
set showcmd
set timeoutlen=500
set colorcolumn=80
set signcolumn=number

" Use <F11> to toggle paste, nopaste
":set pastetoggle=<F11>

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
"set expandtab
filetype indent on

" Reload files instead of asking
:set autoread

" highlight current line
:set cursorline
":highlight CursorLine ctermbg=Black guibg=Black  " for dark theme?
:highlight IncSearch ctermfg=red ctermbg=blue
":highlight IncSearch ctermfg=gray  " might be nice, but ok for now
hi Pmenu ctermbg=black ctermfg=white

" pymode options
"set foldlevelstart=0
set foldlevel=4
"set fen
"set nofen

" ----------------------------
"  Shortcuts
"  to open .vimrc
nmap <leader>ev :edit ~/.vimrc<cr>
"  Close with <C-w>w
" nnoremap <C-e><C-e> :Bclose<CR>
" nnoremap <c-e>j <c-w>j
" nnoremap <c-e>k <c-w>k
" nnoremap <c-e>l <c-w>h
" nnoremap <c-e>; <c-w>l
nnoremap <leader>j :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <c-t> :tabnew<CR>

noremap i k
noremap h i
noremap k j
noremap j h

noremap I K
noremap H I
noremap K J
noremap J H

"noremap <C-n> <BS>
"noremap! <C-n> <BS>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

vnoremap < < gv
vnoremap > > gv

" Paste in insert mode
"imap <C-v> <C-r>*

"let g:pymode_lint_write = 0
" let g:pep8_ignore="E501,E265,E128"
" let g:pymode_lint_ignore="E501,E265,E128"

" move arrow keys on display lines
" nnoremap <j> gj
" nnoremap <k> gk

"au BufNewfile, BufRead *.jinja2 set filetype=html
autocmd BufNewfile, BufRead *.dt set filetype=pug
autocmd BufNewfile, BufRead Gruntfile set filetype=javascript
autocmd BufNewFile, BufRead *.jsx set filetype=javascript
autocmd BufNewFile, BufRead *.jsonl set filetype=json
"autocmd FileType scss setlocal expandtab

" replace tabs with spaces in yaml
"autocmd FileType yaml execute  ':silent! %s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'

" UI options
"set guioptions=-m "remove menu bar
"set guioptions+=lrbmTLce
"set guioptions-=lrbmTLce
set mousehide                " Turn off mouse when typing
set guioptions-=l            
set guioptions-=r            " Remove right hand scrollbar
set guioptions-=b            
set guioptions-=m           
set guioptions-=T            " Remove toolbar
set guioptions-=L            " Remove left-hand scrollbar (for v-split)
set guioptions+=c            " Use console dialogs when possible
set guioptions-=e            
set visualbell t_vb=         " Turn off flashing (needs to be in gvimrc too)
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

"set guicursor=a:blinkon4000-blinkoff4000  " Slow down cursor blinking speed"
set guicursor=a:blinkon0  " Turn off cursor blinking
set guicursor=i:ver1000-iCursor

" toggle line highlight on changing insert mode
":autocmd InsertEnter,InsertLeave * set cul!

" highlight colons to distinguish them from semicolons
"match todo /;/

" fix == to indent, aligns at function parentheses
"set cino+=(0
"setlocal cinoptions-=(2s
"setlocal cinoptions+=(s

" Javscript settings (.js)
autocmd FileType javascript,javascriptreact set sw=2
autocmd FileType javascript,javascriptreact set ts=2
autocmd FileType javascript,javascriptreact set sts=2
autocmd FileType javascript,javascriptreact set textwidth=79
autocmd FileType javascript,javascriptreact set expandtab

"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
autocmd FileType typescript,.tsx set sw=2
autocmd FileType typescript,.tsx set ts=2
autocmd FileType typescript,.tsx set sts=2
autocmd FileType typescript,.tsx set expandtab

autocmd FileType typescriptreact set sw=2
autocmd FileType typescriptreact set ts=2
autocmd FileType typescriptreact set sts=2
autocmd FileType typescriptreact set expandtab

set nomodeline

"set background=dark
if empty($DISPLAY)
else
	" set background=light
	" colorscheme	solarized
	" colorscheme	tokyonight-day
	colorscheme	tokyonight-night
endif

"colorschemes for bright colors:
"zellner, shine
"colorscheme slate
"set gfn=Droid\ Sans\ Mono\ 10
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ Book\ 10

" trailing double slace avoids name collision; i dont like it
set undodir=/tmp/vim/
set backupdir=/tmp/vim/
set directory=/tmp/vim/

" coc things
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" highlight CocErrorHighlight guibg=#660000 guifg=NONE gui=italic
" highlight CocWarningHighlight guibg=#666600 guifg=#ffa600 gui=bold,underline
"nnoremap ,q :CocRestart<cr>
"inoremap <silent><expr> ,q coc#refresh()

"set nobackup
"set nowritebackup

lua require('Comment').setup()
lua << EOF
-- require('Comment').setup({
-- opleader = {
--         ---Line-comment keymap
--         line = ',c',
--         ---Block-comment keymap
--         block = ',b',
--     },
-- })
-- EOF
