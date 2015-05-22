
" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" VUNDLE
Plugin 'gmarik/vundle'
" Themes and colorshemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
" Status bar
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Buffers and sidebars
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
" Find in files
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
" Code format and check (Dont forget to install linters)
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
" Languages
Plugin 'spf13/PIV'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'markcornick/vim-vagrant'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
" SnipMate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" End Vundle
" filetype on (not requiered. Enabled further)

" Airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=0

" Make Vim more useful
"set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace
noremap <leader>ss :FixWhitespace<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


" Neocomplete activated by default
let g:neocomplete#enable_at_startup = 1

" Don't like buffergator default keymaps
let g:buffergator_suppress_keymaps=1
noremap <leader>b :BuffergatorToggle<CR>

" Nerdtree keymaps
noremap <leader>n :NERDTreeToggle<CR>

" Open a new tab and serarch for something
nmap <leader>a :tab split<CR>:Ack ""<Left>

" Open a new tab and search for word under cursor
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Tab navigation
noremap <C-H> :tabp<CR>
noremap <C-L> :tabn<CR>
noremap <C-J> :tabc<CR>
noremap <C-K> :tabe<CR>

" Default ident styles per language
autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab

