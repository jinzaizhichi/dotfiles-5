
let mapleader = ","

set number
set hlsearch
set ignorecase
set smartcase
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smartcase
set noswapfile
set list lcs=tab:\|\        " Show tabs
set mouse=a                 " Enable mouse on all modes

filetype plugin indent on   " Detect filetype 

" Keep VisualMode after indent with > or <
vmap < <gv 
vmap > >gv 

" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle terminal
nnoremap <C-j> :terminal<cr><C-w>J

" Wrap on markdown files
autocmd BufRead,BufNewFile *.md setlocal wrap 

" Install vim-plug for vim and neovim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  silent !mkdir -p ~/.config/nvim/autoload/ && ln -s ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Themes (I usually switch between them)
Plug 'kaicataldo/material.vim'                                    " Material Themes
Plug 'morhetz/gruvbox'                                            " Retro cool theme
Plug 'haishanh/night-owl.vim'                                     " A 'Night Time' cool theme

" Utilities
Plug 'itchyny/lightline.vim'                                      " Simple status line
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }           " File navigator
Plug 'preservim/nerdcommenter'                                    " Use <leader>c<space> for comments
Plug 'Xuyuanp/nerdtree-git-plugin'                                " Git status on NERDTree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install fuzzy finder
Plug 'junegunn/fzf.vim'                                           " <C-P> (find files) o
Plug 'godlygeek/tabular'

" Misc
Plug 'tpope/vim-sensible'                                         " Sensible defaults

" Make Vim work like an IDE (requires node)
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " Autocomplete
Plug 'liuchengxu/vista.vim'                                       " Like ctags but for coc
Plug 'dense-analysis/ale'                                         " To use PHPCS or flake8 to check syntax errors
call plug#end()

" Most of the themes share configuration. Lest do them all toghether 
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:gruvbox_italic=1
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight' " Options ara:'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:lightline = { 'colorscheme': 'material' }
colorscheme material " Options are: material gruvbox night-owl palenight

" NERDTree
noremap <leader>n :NERDTreeToggle<cr> 
let NERDTreeShowHidden=1


" FZF keymaps
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>b :Buffers<cr>

" Vista.Vim
nnoremap <leader>t :Vista!!<cr>
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%'] " This is very cool Ctrl-P preview!!!

" ALE
let g:ale_fix_on_save = 1
let g:ale_fixers = {'php': ['phpcbf']} " Use phpcbf for PHP code formatting

" CoC Install Extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-phpls',
    \ 'coc-marketplace',
    \ 'coc-markdownlint'
    \]

" {{{ 
" CoC START!!!!
" - Taken from https://github.com/neoclide/coc.nvim#example-vim-configuration
" - Enable 'wordpress' in ~/.config/coc/extensions/node_modules/coc-phpls/package.json

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" CoC END!!!! 
" }}}
