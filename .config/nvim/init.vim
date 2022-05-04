"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|

" SETS --------------------------------------------------------------------- {{{

set termguicolors
set autochdir
set signcolumn=auto
set textwidth=80
set cursorline
set number relativenumber
set guicursor=
set shiftwidth=4
set tabstop=4
set expandtab
set ignorecase smartcase
set hlsearch
set incsearch
set showmatch
set backspace=eol,start,indent
set scrolloff=8
set fdm=marker
set nowrap
set formatoptions=
set noshowmode

" }}}

" LETS --------------------------------------------------------------------- {{{

let mapleader = " "
" let maplocalleader = " "

" plugin lets
let g:airline_powerline_fonts = 1
"let g:airline_symbols_ascii = 1
"let NERDTreeMinimalUI = 1
let g:tokyonight_transparent_background = 1
let R_assign = 0

" }}}

" MAPS --------------------------------------------------------------------- {{{

" normal remaps
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <A-h> <c-w><
nnoremap <A-j> <c-w>+
nnoremap <A-k> <c-w>-
nnoremap <A-l> <c-w>>

" leaders
nnoremap <leader>w :set wrap!<CR>
nnoremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>
nnoremap <leader>ch :noh<CR>
nnoremap <leader>o :set spell!<CR>
nnoremap <leader>s  :!

" plugin maps
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>t :TagbarToggle<CR>

" }}}

" PLUGINS  ----------------------------------------------------------------- {{{

" if not installed, install plugged
if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load plugins
call plug#begin('~/.local/share/nvim/plugged')
" IDE like/language specific
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" navigation
Plug 'preservim/nerdtree'
Plug 'francoiscabrol/ranger.vim'
" syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'mboughaba/i3config.vim'
Plug 'chrisbra/Colorizer'
Plug 'preservim/tagbar'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'lourenci/github-colors'
" other
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" install system package ctags for tagbar

" choose colorscheme
colorscheme gruvbox
set background=dark

" auto detect i3 config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" }}}

" AUTOCMDS  ---------------------------------------------------------------- {{{

" .tex
autocmd Filetype tex nnoremap <localleader>wc :!pdftotext *.pdf - \| wc -w<CR>
autocmd Filetype tex set wrap spell

" python
autocmd Filetype python nnoremap <leader>r :w<bar>!python %<CR>
autocmd Filetype python nnoremap <leader>R :w<bar>!$TERMINAL -e python %<CR><CR>
autocmd Filetype python set textwidth=79

" bash
autocmd Filetype sh nnoremap <leader>r :w<bar>!bash %<CR>

" }}}

" OTHER STUFF -------------------------------------------------------------- {{{

syntax enable

" }}}
