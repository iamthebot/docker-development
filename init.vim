" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ https://raw. githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" initiate vim-plug
call plug#begin()

Plug 'gergap/wombat256'
Plug 'Rip-Rip/clang_complete'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'dcharbon/vim-flatbuffers'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --gocode-completer --system-libclang' }

call plug#end()

let g:deoplete#enable_at_startup = 1
colorscheme wombat256

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'wombat'
nmap <F8> :TagbarToggle<CR>
map <F4> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>
let g:autoformat_autoindent = 0
filetype plugin on
filetype indent on
set ruler
set number
set ignorecase
set hlsearch
set incsearch
set noerrorbells
set novisualbell
set tm=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set tabstop=4
set expandtab
set shiftwidth=4
set foldmethod=syntax
:let mapleader = ","
map j gj
map k gk
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
