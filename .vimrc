
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
set list lcs=tab:\|\ " Show tabs 
set mouse=a " Enable mouse scroll on CoC floating window

filetype plugin indent on " For NERDCommenter

nnoremap <C-j> :terminal<cr><C-w>J
vmap < <gv " Vmap for maintain Visual Mode after shifting <
vmap > >gv " Vmap for maintain Visual Mode after shifting > 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim'          " Material Themes (y like the lighter one)
Plug 'morhetz/gruvbox'                  " Retro cool theme
Plug 'haishanh/night-owl.vim'           " A 'Night Time' cool theme
Plug 'tpope/vim-sensible'               " Sensible defaults
Plug 'itchyny/lightline.vim'            " Simple status line
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " File navigator
Plug 'preservim/nerdcommenter'          " Use <leader>c<space> for comments
Plug 'Xuyuanp/nerdtree-git-plugin'      " File git status on NERDTree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install fuzzy finder
Plug 'junegunn/fzf.vim'                 " <C-P> (find files) o
Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Make Vim work like an IDE (requires node)
Plug 'liuchengxu/vista.vim'             " Like ctags but for coc
Plug 'dense-analysis/ale'               " To use PHPCS or flake8 to check syntax errors
call plug#end()

" Material, NightOwl and Grubox theme settings
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:gruvbox_italic=1
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight' " 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material "material gruvbox night-owl

" NERDTreeToggle keymaps
noremap <leader>n :NERDTreeToggle<cr>
inoremap <C-,> <esc>:NERDTreeToggle<cr>
let NERDTreeShowHidden=1


" FZF keymaps
nnoremap <C-p> :Files<cr>
nnoremap <C-g> :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>b :Buffers<cr>

" Vista 
nnoremap <leader>t :Vista!!<cr>

" CoC https://github.com/neoclide/coc.nvim#example-vim-configuration
" Enable 'wordpress' in ~/.config/coc/extensions/node_modules/coc-phpls/package.json
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-phpls',
    \ 'coc-marketplace',
    \ 'coc-markdownlint'
    \]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
"set shortmess+=c
set shortmess=aFc
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
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
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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

" Vista.Vim
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']


function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Lightline with Material Theme, CoC  and Vista status support
let g:lightline = {
  \ 'colorscheme': 'material',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'method', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'method': 'NearestMethodOrFunction'
  \ },
  \ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


" ALE PHPCS 
let g:ale_fix_on_save = 1
let g:ale_fixers = {'php': ['phpcbf']}

" Wrap on markdown files
autocmd BufRead,BufNewFile *.md setlocal wrap
