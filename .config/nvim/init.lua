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
vim.o.background = "dark"
vim.o.list = true
vim.o.conceallevel = 1

-- }}}

-- MAPS --------------------------------------------------------------------- {{{

vim.g.mapleader = " "

-- normal
vim.keymap.set("n", "j", "gj") -- hjkl through wrap
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "Y", "y$") -- Y consistent with D,C
vim.keymap.set("n", "<A-y>", "<c-w><") -- resize splits
vim.keymap.set("n", "<A-u>", "<c-w>+")
vim.keymap.set("n", "<A-i>", "<c-w>-")
vim.keymap.set("n", "<A-o>", "<c-w>>")
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- keep centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y") -- yank
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"+d") -- delete
vim.keymap.set("v", "<leader>d", "\"+d")
vim.keymap.set("n", "<leader>p", "\"+p") -- paste
vim.keymap.set("v", "<leader>p", "\"+p")

-- visual
vim.keymap.set("v", "<", "<gv") -- keep selected after indent
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- auto indent visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

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
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<c-f>", builtin.find_files, {})
vim.keymap.set("n", "<c-p>", builtin.git_files, {})
vim.keymap.set("n", "<c-g>", builtin.live_grep, {})
vim.keymap.set("n", "<c-b>", builtin.buffers, {})
vim.keymap.set("n", "<c-8>", builtin.grep_string, {})
vim.keymap.set("n", "<c-/>", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<c-e>", builtin.help_tags, {})
vim.keymap.set("n", "<c-m>", builtin.keymaps, {})
vim.keymap.set("n", "<c-r>", builtin.lsp_references, {}) -- lsp
vim.keymap.set("n", "<c-i>", builtin.lsp_implementations, {})
vim.keymap.set("n", "<c-s>", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<c-w>", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<c-d>", builtin.diagnostics, {})

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
