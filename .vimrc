"" Path at which plugins are installed. 
call plug#begin('~/.vim/plugged')

"" IDE Features
Plug 'preservim/nerdtree'

"" Vim LSP related
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"" Standard setting
"" Maps escape to j-k character sequence
inoremap jk <ESC>
let mapleader = " "

"" NerdTree SETUP
"" Sets NerdTree sidemenu width
:let g:NERDTreeWinSize=45

"" Maps the toggle command to ctrl + o
map <C-o> :NERDTreeToggle<CR>

set modifiable
syntax on
set clipboard=unnamedplus
set tabstop=4
set encoding=utf-8

filetype plugin indent on

"" SourceKit-LSP configuration
if executable('~/Documents/Dev/sourcekit-lsp/.build/debug/sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

"" Enables tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd FileType swift setlocal omnifunc=lsp#complete
autocmd FileType swift nnoremap <C-]> :LspDefinition<CR>

