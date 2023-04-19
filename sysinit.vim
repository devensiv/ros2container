set undofile
set nocompatible
set number relativenumber
let mapleader = " "
set shiftwidth=2
set tabstop=2
set nohlsearch

vnoremap . :normal .<CR>
nnoremap <leader>= :%!calc -p<CR>
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>
inoremap <c-c> <ESC>

