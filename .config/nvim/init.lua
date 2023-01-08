--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

require("plugins")

vim.cmd.syntax("enable")
vim.cmd.colorscheme("gruvbox")

-- SETS --------------------------------------------------------------------- {{{

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.autochdir = true
vim.o.signcolumn = "yes"
vim.o.textwidth = 80
vim.o.cursorline = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.backspace = "eol,start,indent"
vim.o.scrolloff = 8
vim.o.fdm = "marker"
vim.o.wrap = false
vim.o.formatoptions = true
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.background = "dark"
vim.o.list = true
vim.o.conceallevel = 1

-- }}}

-- MAPS --------------------------------------------------------------------- {{{

vim.g.mapleader = " "

-- normal
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<A-y>", "<c-w><")
vim.keymap.set("n", "<A-u>", "<c-w>+")
vim.keymap.set("n", "<A-i>", "<c-w>-")
vim.keymap.set("n", "<A-o>", "<c-w>>")

-- visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- leaders
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>")
vim.keymap.set("n", "<leader>l", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>')
vim.keymap.set("n", "<leader>ch", ":noh<CR>")
vim.keymap.set("n", "<leader>o", ":set spell!<CR>")
vim.keymap.set("n", "<leader>s", ":!")
vim.keymap.set("n", "<leader>S", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<leader>x", ":! chmod +x %<CR>")

-- plugin maps
vim.keymap.set("n", "<leader>n", ":NERDTreeToggle %:p:h<CR>")
vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>")
vim.keymap.set("n", "<leader>c", ":ColorToggle<CR>")
vim.keymap.set("n", "<c-p>", ":GFiles<CR>")
vim.keymap.set("n", "<c-f>", ":Files<CR>")
vim.keymap.set("n", "<c-b>", ":Buffers<CR>")
vim.keymap.set("n", "<c-g>", ":Rg<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- }}}

-- AUTOCMDS  ---------------------------------------------------------------- {{{

-- .tex
vim.cmd[[autocmd Filetype tex nnoremap <localleader>wc :!pdftotext *.pdf - \| wc -w<CR>]]
vim.cmd[[autocmd Filetype tex set wrap spell]]

-- python
vim.cmd[[autocmd Filetype python nnoremap <localleader>r :w<bar>!python %<CR>]]
vim.cmd[[autocmd Filetype python nnoremap <localleader>R :w<bar>!$TERMINAL -e python %<CR><CR>]]
vim.cmd[[autocmd Filetype python set textwidth=79]]

-- bash
vim.cmd[[autocmd Filetype sh nnoremap <localleader>r :w<bar>!bash %<CR>]]

-- lua
vim.cmd[[autocmd Filetype lua set shiftwidth=2]]
vim.cmd[[autocmd Filetype lua set tabstop=2]]

-- config
vim.cmd[[autocmd BufEnter sxhkdrc set ft=sxhkdrc]]

-- }}}
