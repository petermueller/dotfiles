set rtp+=~/.config/nvim/bundle/Vundle.vim
call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'godlygeek/tabular'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" For vim-monokai and vim-polyglot
syntax on
" For vim-monokai
colorscheme monokai
set termguicolors

if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set nu
