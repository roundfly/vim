"" Plugin path
call plug#begin('~/.vim/plugged')

"" IDE Features
Plug 'preservim/nerdtree'

"" Vim LSP related
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ryanolsonx/vim-lsp-swift'
" Swift
Plug 'keith/swift.vim'

call plug#end()

"" Standard setting
inoremap jk <ESC>
let mapleader = " "
map <C-o> :NERDTreeToggle<CR>r
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set tabstop=4


" SourceKit-LSP configuration
if executable('~/Documents/Dev/sourcekit-lsp/.build/debug/sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

autocmd FileType swift setlocal omnifunc=lsp#complete
autocmd FileType swift nnoremap <C-]> :LspDefinition<CR>

