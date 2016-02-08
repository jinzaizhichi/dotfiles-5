
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
Plugin 'ronny/birds-of-paradise.vim'
" Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'airblade/vim-gitgutter'
" Buffers and sidebars
Plugin 'jeetsukumaran/vim-buffergator' " List of buffers on the sidebar
Plugin 'scrooloose/nerdtree'           " Filetree on the sidebar
"Plugin 'majutsushi/tagbar'            " Class outliner on the sidebar
Plugin 'sjl/gundo.vim'
"Plugin 'terryma/vim-multiple-cursors'
" Autocomplete
Plugin 'marioy47/emmet-vim'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ervandew/supertab'
"Plugin 'MarcWeber/vim-addon-mw-utils' " required by snipmate
"Plugin 'tomtom/tlib_vim'              " required by snimate
"Plugin 'garbas/vim-snipmate'          " the snipmate plugin
"Plugin 'honza/vim-snippets'           " set of snippets
"Plugin 'justinj/vim-react-snippets'
Plugin 'ternjs/tern_for_vim'
"Plugin 'mattn/webapi-vim'             " required by gist-vm
"Plugin 'mattn/gist-vim'
" Find and Visual Helpers
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/MatchTagAlways'
"Plugin 'easymotion/vim-easymotion'
" Code format and check (Dont forget to install linters)
Plugin 'bronson/vim-trailing-whitespace' " Removes trailing whitespace
Plugin 'editorconfig/editorconfig-vim'   " Obey .editorconfig configuration
Plugin 'scrooloose/syntastic'            " Linting
Plugin 'jiangmiao/auto-pairs'            " Closes quotes
Plugin 'Townk/vim-autoclose'             " Auto add closing ) ] } etc
Plugin 'scrooloose/nerdcommenter'        " Toggle comments on a line
Plugin 'godlygeek/tabular'               " Lineup text
" Languages
Plugin 'spf13/PIV' " PHP
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-markdown'
Plugin 'markcornick/vim-vagrant'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'evanmiller/nginx-vim-syntax'
" Git
"Plugin 'tpope/vim-fugitive'
" Misc
Plugin 'ap/vim-css-color' " Color HEX colores son css
"Plugin 'rgarver/Kwbd.vim' "Keep window open on close last buffer

call vundle#end()
if has_vundle == 0 "Install plugins if vundle is not present
	:silent! PluginInstall
	echo 'Install tern-js and add support for meteor'
	!cd ~/.vim/bundle/tern_for_vim && npm install && cd node_modules/tern/plugin && curl https://raw.githubusercontent.com/Slava/tern-meteor/master/meteor.js >> meteor.js
	echo 'Install YouCompleteMe'
	! cd ~/.vim/bundle/YouCompleteMe && python install.py --tern-completer
	:qa
endif

filetype plugin indent on

" Set the theme (I like solarized, molokai and Tomorrow-Night-Eighties)
set background=dark
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
"let g:solarized_termcolors=256 " Only if using solarized in vim but not in your term

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Paste chuncks of code
set pastetoggle=<F2>
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
"set gdefault
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
" Hide instead of close
set hidden
" insert tabs on the start of a line according to shiftwidth, not tabstop"
set smarttab

" Strip trailing whitespace
noremap <leader>ss :FixWhitespace<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Go to next window with ,w or Ctr-W
nnoremap <leader>w <C-W>W

" Airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#syntastic#enabled = 1


" Don't like buffergator default keymaps. Use ,b
let g:buffergator_suppress_keymaps=1
noremap <leader>b :BuffergatorToggle<CR>


" Show NERDTree with ,n
noremap <leader>n :NERDTreeToggle<CR>

" Open NERDTree at startup if called without arguments
autocmd VimEnter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen=1 " Auto close NERDTree
let NERDTreeShowHidden=1 " Show hidden files

" Gundo Configuration
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_width = 50          " Pane widht
let g:gundo_preview_height = 20 " Bottom height
let g:gundo_close_on_revert = 1 " Autoclose on select

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1


" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_max_height = 25
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
" Ignore node_modules and .git dir
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }

" User silver searcher for grep and CtrlP https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Tagbar toggle
noremap <Leader>t :TagbarToggle<CR>

" Ack search
nnoremap <leader>a :Ack ""<Left>
" Open a new tab and Ack search for word under cursor
nnoremap <leader>A :Ack <C-r><C-w><CR>
" Ack auto close
let g:ack_autoclose=1

noremap <leader>m :!open -a Marked %<CR><CR>

" Default ident styles per language
"autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
"autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype bash setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype less setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab
"autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab

" Turn Off default multicursor mappings
let g:multi_cursor_use_default_mapping=0

" Change multicursor mappings
let g:multi_cursor_next_key='<C-d>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Load local conf file if exists (http://blog.sanctum.geek.nz/local-vimrc-files/)
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Set checkers for syntastic
let g:syntastic_javascript_checkers = ['eslint']
"
" Allow JSX in normal JS files https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0