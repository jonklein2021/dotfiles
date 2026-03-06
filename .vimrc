"""""""""" OPTIONS """"""""""

syntax on
colorscheme habamax

set tabstop=4
set shiftwidth=4
set expandtab
set number
set ignorecase
set smartcase
set incsearch
set autoindent

"""""""""" KEYMAPS """"""""""

" I'm sorry
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

" H/L to jump to the beginning/end of a line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Use U for redo (and u for undo)
nnoremap U <C-r>

