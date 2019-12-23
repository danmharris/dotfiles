call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/bufexplorer.zip'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

map <leader>o :BufExplorer<cr>
map <leader>f :MRU<cr>
map <c-n> :NERDTreeToggle<cr>
let g:ctrlp_map = '<c-p>'

set noshowmode
set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

set termguicolors
colorscheme base16-onedark
