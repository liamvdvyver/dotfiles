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
vim.keymap.set("i", "<c-c>", "<esc>", { desc = "Escape" })

-- normal
vim.keymap.set("n", "j", "gj", { desc = "[j] through wrap" })
vim.keymap.set("n", "k", "gk", { desc = "[k] through wrap" })
vim.keymap.set("n", "Y", "y$", { desc = "[Y] like D, C" })
vim.keymap.set("n", "<A-y>", "<c-w><", { desc = "Shrink split horizontally" })
vim.keymap.set("n", "<A-u>", "<c-w>+", { desc = "Grow split vertically" })
vim.keymap.set("n", "<A-i>", "<c-w>-", { desc = "Shrink split vertically" })
vim.keymap.set("n", "<A-o>", "<c-w>>", { desc = "Grow split horizontally" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center after scroll up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center after scroll down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center after [n]ext result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center after previous result" })

-- clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "[y]ank to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "[y]ank visual to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y$", { desc = "[Y]ank till $ to clipboard" })
vim.keymap.set("n", "<leader>d", "\"+d", { desc = "[d]elete to clipboard" })
vim.keymap.set("v", "<leader>d", "\"+d", { desc = "[d]elete visual to clipboard" })
vim.keymap.set("n", "<leader>D", "\"+D", { desc = "[D]elete till $ to clipboard" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "[p]aste to clipboard" })
vim.keymap.set("v", "<leader>p", "\"+p", { desc = "[p]aste visual to clipboard" })
vim.keymap.set("n", "<leader>P", "\"+P", { desc = "[P]aste till $ to clipboard" })

-- find and replace word/selection
vim.keymap.set("n", "<c-s>", [[:%s/\(<C-r><C-w>\)//gI<Left><Left><Left>]], { desc = "[s]earch and replace word under cursor" })
vim.keymap.set("v", "<c-s>", [["hy:%s/\(<C-r>h\)//gI<Left><Left><Left>]], { desc = "[s]earch and replace visual" })

-- visual
vim.keymap.set("v", "<", "<gv", { desc = "Reselect visual after [<]" })
vim.keymap.set("v", ">", ">gv", { desc = "Reselect visual after [>]" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Auto indent block on move up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Auto indent block on move down" })

-- leaders
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { desc = "Toggle [w]rap" })
vim.keymap.set("n", "<leader>l", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>', { desc = "Toggle [l]ine at textwidth" })
vim.keymap.set("n", "<leader>ch", ":noh<CR>", { desc = "[c]lear [h]ighlight" })
vim.keymap.set("n", "<leader>o", ":set spell!<CR>", { desc = "Toggle [o]rthography (spelling)" })
vim.keymap.set("n", "<leader>s", ":!", { desc = "Begin [s]hell command" })
vim.keymap.set("n", "<leader>S", ":source $MYVIMRC<CR>", { desc = "[S]ource config file" })
vim.keymap.set("n", "<leader>x", ":! chmod +x %<CR>", { desc = "Add e[x]ecute mode to current file" })

-- plugin maps
vim.keymap.set("n", "<leader>n", ":NERDTreeToggle %:p:h<CR>", { desc = 'Toggle [n]ERDTree' })
vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", { desc = "Toggle [t]agbar" })
vim.keymap.set("n", "<leader>c", ":ColorToggle<CR>", { desc = "Toggle html [c]olours" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle [u]ndotree" })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<c-f>", builtin.find_files, { desc = "Fuzzy find [f]iles in working directory" })
vim.keymap.set("n", "<c-p>", builtin.git_files, { desc = "Fuzzy find files in git [p]roject" })
vim.keymap.set("n", "<c-g>", builtin.live_grep, { desc = "[g]rep through files in working directory" })
vim.keymap.set("n", "<c-b>", builtin.buffers, { desc = "Fuzzy find [b]uffer" })
vim.keymap.set("n", "<c-8>", builtin.grep_string, { desc = "grep word under cursor in working directory" })
vim.keymap.set("n", "<c-/>", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find in current buffer" })
vim.keymap.set("n", "<c-e>", builtin.help_tags, { desc = "Fuzzy find h[e]lp tags" })
vim.keymap.set("n", "<c-m>", builtin.keymaps, { desc = "Fuzzy find key[m]aps" })

-- lsp
vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Fuzzy find [r]eferences" })
vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Fuzzy find [i]mplementations" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Fuzzy [f]ind [s]ymbols in document" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Fuzzy [f]ind symbols in [w]orkspace" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy [f]ind [d]iagnostics" })

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
