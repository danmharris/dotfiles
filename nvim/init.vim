if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/bufexplorer.zip'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/mru.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'dense-analysis/ale'

" Language plugins
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'rodjek/vim-puppet'

"" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

map <leader>o :BufExplorer<cr>
map <leader>f :MRU<cr>
map <c-n> :NERDTreeToggle<cr>
let g:ctrlp_map = '<c-p>'

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

set noshowmode
set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let base16colorspace=256
colorscheme base16-monokai

autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.tt setf tt2html
autocmd FileType markdown setlocal spell spelllang=en_gb
