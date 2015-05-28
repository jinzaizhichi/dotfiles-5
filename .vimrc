
" Make it IMproved
set nocompatible

" Create dirs if they do not exists
call system('mkdir -p $HOME/.vim/{backups,bundle,swaps,syntax,undo}')

" Check/install Vundle
let has_vundle=1
if !filereadable($HOME.'/.vim/bundle/Vundle.vim/README.md')
	echo 'Installing Vundle...'
	silent !git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim
	let has_vundle=0
endif

" Initialize vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Themes and colorshemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
" Status bar
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Buffers and sidebars
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
" Autocomplete
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
" Find in files
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
" Code format and check (Dont forget to install linters)
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdcommenter'
" Languages
Plugin 'spf13/PIV'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'markcornick/vim-vagrant'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'
" Git
Plugin 'tpope/vim-fugitive'
" Misc
Plugin 'ap/vim-css-color' " Color HEX colores son css
Plugin 'rgarver/Kwbd.vim' "Keep window open on close last buffer

call vundle#end()
if has_vundle == 0
	:silent! PluginInstall
	:qa
endif

filetype plugin indent on

" Airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2

" Set the theme (I like solarized, molokai and Tomorrow-Night-Eighties)
set background=dark
colorscheme molokai

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

" Hate distributed swap files. Have it all in .vim dir
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

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
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:▸\ ,trail:·,nbsp:_
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

" Don't like buffergator default keymaps
let g:buffergator_suppress_keymaps=1
noremap <leader>b :BuffergatorToggle<CR>

" Nerdtree keymaps
noremap <leader>n :NERDTreeToggle<CR>


" Open NERDTree at startup if called without arguments
autocmd VimEnter * if !argc() | NERDTree | endif

" Tagbar toggle
noremap <Leader>t :TagbarToggle<CR>

" Toggle Gundo tree
nnoremap <leader>u :GundoToggle<CR>

" Ack search
nnoremap <leader>a :Ack ""<Left>

" Open a new tab and Ack search for word under cursor
nnoremap <leader>A :Ack <C-r><C-w><CR>

" Default ident styles per language
autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab

" Turn default multicursor mappings
let g:multi_cursor_use_default_mapping=0

" Change multicursor mappings
let g:multi_cursor_next_key='<C-d>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" ctrlp config
" let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
"
" use silver searcher for ctrlp
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""''"'"

