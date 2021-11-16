syntax on

set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set cmdheight=2
set updatetime=300
set scrolloff=2

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"for c/c++:
set exrc
set secure

"""""""""" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"Always load vim-devicons last
Plug 'ryanoasis/vim-devicons'

call plug#end()

"Vim Indent Guide
nnoremap <F4> :IndentGuidesToggle<CR>

"UndoTree Setup
nnoremap <F5> :UndotreeToggle<CR>

"Polyglot Setup 
set nocompatible

"Individual language packs can be disable by using
"let g:polyglot_disabled = ['markdown']

"Theme Setup
colorscheme gruvbox
set background=dark background

"Use fuzzyfinder in vim
set rtp+=/usr/local/opt/fzf

if executable('rg')
    let g:rg_derivitive_root='true'
endif

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0

"if you need to adjust vim's make command to have custom arguments or even a
"different build command, you can change it here 
" set makeprg=make\ -C\ .../build\ -j9
" set makeprg=gcc\ -o\ %<\ %    #(this does gcc file.c -o file)

" Save and make current file.o
function! Make()
    let curr_dir = expand('%:h')
    if curr_dir == ''
        let curr_dir = '.'
    endif
    echo curr_dir
    execute 'lcd ' . curr_dir
    execute 'make %:r.o'
    execute 'lcd -'
endfunction

nnoremap <F7> :update<CR>:call Make()<CR>

"VimIndentGuides Setup
let g:indent_guides_enable_on_vim_startup = 0

"YouCompleteMe Setup
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"Airline Setup
let g:airline_powerline_fonts = 1

"NerdTree Setup
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
