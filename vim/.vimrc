execute pathogen#infect()
syntax on
filetype plugin indent on
" using tabedit with C-n and C-p because recovering from emacs
map <C-N> :bn<CR>
map <C-P> :bp<CR>
" navigate splits when holding ctrl
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" set colors
set t_Co=256
"colorscheme onehalfdark
colorscheme seoul256
set background=dark
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" use backspace
set bs=2
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Set arbitrary line marker
set colorcolumn=80

" have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable nerdtree with F3
map <F3> :NERDTreeToggle<CR>
" Enable focus mode with F5
map <F5> :Goyo<CR>
" Enable superfocus with F6
map <F6> :Limelight1<CR>
map <S-F6> :Limelight!<CR>
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1
