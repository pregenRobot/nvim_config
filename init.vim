call plug#begin()
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/Conque-Shell'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'google/vim-jsonnet'
" Plug 'puremourning/vimspector'
" Plug 'ycm-core/YouCompleteMe'
set encoding=UTF-8
call plug#end()

inoremap jj <Esc>
let mapleader=" "
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
vnoremap p "_dP

set clipboard+=unnamedplus

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set number
set foldmethod=syntax
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=10
syntax enable
set title
set titlestring=%F
" ========== NERD TREE ========== "

nnoremap <leader><tab> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let NERDTreeShowHidden=1

" ========== FZF ========== "
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -name target -name debug -o -name .git \) -prune -o -print'
let g:fzf_preview_window = ['right,50%', 'ctrl-/']
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <space><space> :GFiles<CR>
nnoremap <space>f :Rg<CR>

" ========== COC ========== "

set signcolumn=yes

nnoremap <silent> K :call ShowDocumentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <leader>w  :<C-u>CocList diagnostics<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" ========== COLOR SCHEME ========== "
" https://vimcolorschemes.com/

set termguicolors     " enable true colors support
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
colorscheme gruvbox

" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
" ========== AIRLINE ========== "

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'


" ========== ETC CONFIGURATIONS ==========

