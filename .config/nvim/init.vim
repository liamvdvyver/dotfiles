"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
" (_)_/ |_|_| |_| |_|_|  \___|
"

" SETS --------------------------------------------------------------------- {{{

set termguicolors
set autochdir
set signcolumn=auto
set textwidth=80
set cursorline
set number relativenumber
"set guicursor=
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
set clipboard+=unnamedplus
set background=dark
set list
set conceallevel=1

" }}}

" LETS --------------------------------------------------------------------- {{{

let mapleader = " "

" plugin lets
let g:airline_powerline_fonts = 1
let NERDTreeShowHidden=1
let g:tokyonight_transparent_background = 0
let R_assign = 0
let g:floaterm_keymap_toggle = '<C-t>'
let g:UltiSnipsExpandTrigger = "<c-cr>"
let g:tex_conceal='abdmg'
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"

" coc extensions
" install languageserver R package for coc-r-lsp
" install shellcheck and shfmt system packages for coc-diagnostic
let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-vimtex',
            \ 'coc-r-lsp',
            \ 'coc-diagnostic',
            \ ]

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
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
" language/syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mboughaba/i3config.vim'
Plug 'chrisbra/Colorizer'
Plug 'preservim/tagbar' " install system package ctags
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" other
Plug 'christoomey/vim-tmux-navigator'
Plug 'voldikss/vim-floaterm'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" auto detect i3 config
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" source coc maps
source ~/.config/nvim/coc.vim

" }}}

" MAPS --------------------------------------------------------------------- {{{

" normal remaps
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <A-y> <c-w><
nnoremap <A-u> <c-w>+
nnoremap <A-i> <c-w>-
nnoremap <A-o> <c-w>>

" visual remaps indent
vnoremap < <gv
vnoremap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" leaders
nnoremap <leader>w :set wrap!<CR>
nnoremap <leader>l :execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>
nnoremap <leader>ch :noh<CR>
nnoremap <leader>o :set spell!<CR>
nnoremap <leader>s  :!
nnoremap <leader>S :source $MYVIMRC<CR>
nnoremap <leader>f :Ranger<CR>

" plugin maps
nnoremap <leader>n :NERDTreeToggle %:p:h<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>c :ColorToggle<CR>
nnoremap <c-p> :GFiles<CR>
nnoremap <c-f> :Files<CR>
nnoremap <leader>rg :Rg<CR>

" }}}

" AUTOCMDS  ---------------------------------------------------------------- {{{

" .tex
autocmd Filetype tex nnoremap <localleader>wc :!pdftotext *.pdf - \| wc -w<CR>
autocmd Filetype tex set wrap spell

" python
autocmd Filetype python nnoremap <localleader>r :w<bar>!python %<CR>
autocmd Filetype python nnoremap <localleader>R :w<bar>!$TERMINAL -e python %<CR><CR>
autocmd Filetype python set textwidth=79

" bash
autocmd Filetype sh nnoremap <localleader>r :w<bar>!bash %<CR>

" }}}

" OTHER STUFF -------------------------------------------------------------- {{{

syntax enable
colorscheme gruvbox

" }}}
