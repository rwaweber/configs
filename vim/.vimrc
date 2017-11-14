execute pathogen#infect()
syntax on
filetype plugin indent on
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>
set t_Co=256
colorscheme monokai
au BufRead,BufNewFile *.qs set filetype=sh
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab
"
