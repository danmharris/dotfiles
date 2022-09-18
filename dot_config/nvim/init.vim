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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'

" Language plugins
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'rodjek/vim-puppet'
Plug 'nathangrigg/vim-beancount'
Plug 'jvirtanen/vim-hcl'
Plug 'fatih/vim-go'

"" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

set noshowmode
set number relativenumber
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set noswapfile
set colorcolumn=80
set splitbelow splitright

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:gitgutter_preview_win_floating = 0
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

set termguicolors
set background=dark
colorscheme nord

map <leader>o :BufExplorer<cr>
map <leader>f :MRU<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>m :NERDTreeFind<cr>
map <leader>p :GFiles<cr>
map <c-f>     :Rg<cr>

map <leader>h :wincmd h<cr>
map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>l :wincmd l<cr>

map <leader>gs :G<cr>
map <leader>gc :Git commit<cr>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufNewFile,BufRead *.tt setf tt2html
autocmd FileType markdown setlocal spell spelllang=en_gb
