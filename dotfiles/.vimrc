filetype plugin indent on
syn on se title

set number
set relativenumber
set showcmd

set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set smartindent
set cindent

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

cmap w!! w !sudo tee > /dev/null %

map <C-b> :!make build<CR>
map <C-c> :!make run<CR>

map <F2> :!git status<CR>
map <F3> :!git diff<CR>
map <F4> :!git add .<CR>
map <F5> :!make<CR>
map <F6> :!make clean<CR>
map <F12> :!man
"map <S-F2> :!git commit<CR>
"map <S-F3> :!git push<CR>

set hlsearch
set incsearch
nnoremap <Enter> :noh<CR>:pc<CR>
"nnoremap <Leader>r :so $MYVIMRC<CR>
nnoremap <Leader>- :split<CR>
nnoremap <Leader><Bar> :vsplit<CR>

"inoremap {<CR>  {<CR>}<Esc>O

" Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

set laststatus=2
set noshowmode

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
