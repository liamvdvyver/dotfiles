--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

require("plugins")

vim.cmd.syntax("enable")
vim.cmd.colorscheme("gruvbox")

P = function(v)
    print(vim.inspect(v))
end

Pm = function(v)
    print(vim.inspect(getmetatable(v)))
end

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
vim.o.hlsearch = false
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

vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

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
vim.keymap.set("n", "<leader>W", ":set wrap!<CR>", { desc = "Toggle [w]rap" })
vim.keymap.set("n", "<leader>L", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>', { desc = "Toggle [l]ine at textwidth" })
vim.keymap.set("n", "<leader>h", ":noh<CR>", { desc = "[c]lear [h]ighlight" })
vim.keymap.set("n", "<leader>o", ":set spell!<CR>", { desc = "Toggle [o]rthography (spelling)" })
vim.keymap.set("n", "<leader>s", ":!", { desc = "Begin [s]hell command" })
vim.keymap.set("n", "<leader>S", ":source $MYVIMRC<CR>", { desc = "[S]ource config file" })
vim.keymap.set("n", "<leader>x", ":! chmod +x %<CR>", { desc = "Add e[x]ecute mode to current file" })
vim.keymap.set("n", "<leader>ze", ":!s eval $(emacs %)&<CR>")
vim.keymap.set("n", "<leader>.", ":Ex<CR>")

-- plugin maps
-- vim.keymap.set("n", "<leader>n", ":NERDTreeToggle %:p:h<CR>", { desc = 'Toggle [n]ERDTree' })
vim.keymap.set("n", "<leader>n", ":Lex<CR>", { desc = 'Toggle [n]etrw' })
vim.keymap.set("n", "<leader>U", ":Sex $XDG_STATE_HOME/nvim/swap/<CR>", { desc = 'Toggle [n]etrw' })
vim.keymap.set("n", "<leader>t", ":TagbarToggle<CR>", { desc = "Toggle [t]agbar" })
vim.keymap.set("n", "<leader>c", ":ColorToggle<CR>", { desc = "Toggle html [c]olours" })
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Toggle [u]ndotree" })
vim.keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "gl", ":lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostics" })
vim.keymap.set("n", "<M-h>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<M-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<M-,>", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<M-.>", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "<leader>k", ":bd<CR>")

vim.keymap.set("n", "<M-C-h>", ":tabprevious<CR>") -- tab management
vim.keymap.set("n", "<M-C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<M-C-,>", ":-tabmove<CR>")
vim.keymap.set("n", "<M-C-.>", ":+tabmove<CR>")
vim.keymap.set("n", "<leader>N", ":tabnew<CR>")
vim.keymap.set("n", "<leader>K", ":tabclose<CR>")

vim.keymap.set("n", "<leader>T", ":TSPlaygroundToggle<CR>")
vim.keymap.set("n", "<leader>[", ":Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>]", ":Gitsigns next_hunk<CR>")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>fl", builtin.find_files, { desc = "Fuzzy [f]ind fules in [l]ocal directory" })
vim.keymap.set("n", "<leader>f.", function()
    builtin.find_files({ search_dirs = {"~/.local/state/nvim/swap/"}})
end, { desc = "Fuzzy [f]ind [s]wap files" })
vim.keymap.set("n", "<leader>fp", builtin.git_files, { desc = "Fuzzy [f]ind files in git [p]roject" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fuzzy [f]ind [b]uffers" })
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy [f]ind in current buffer" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy [f]ind [h]elp tags" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Fuzzy [f]ind key[m]aps" })
vim.keymap.set("n", "<leader>gl", builtin.live_grep, { desc = "[g]rep through files in [l]ocal directory" })
vim.keymap.set("n", "<leader>g8", builtin.grep_string, { desc = "[g]rep word under cursor in working directory" })

vim.keymap.set("n", "<c-x><c-b>", ":Telescope bibtex<CR>")
vim.keymap.set("i", "<c-x><c-b>", "<Esc>:Telescope bibtex<CR>")

-- harpoon
vim.keymap.set("n", "<Leader>m", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<Leader>M", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", ";j", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", ";k", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", ";l", function() require("harpoon.ui").nav_file(3) end)

-- lsp
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Fuzzy [f]ind [r]eferences" })
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Fuzzy [f]ind [i]mplementations" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Fuzzy [f]ind [s]ymbols in document" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Fuzzy [f]ind symbols in [w]orkspace" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy [f]ind [d]iagnostics" })

-- dap
local dapui = require("dapui")
vim.keymap.set("n", "<leader>dd", dapui.toggle, { desc = "Toggle [D]AP window" })

local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set("n", "<Leader>dr", dap.repl.open)
vim.keymap.set("n", "<Leader>dl", dap.run_last)

-- wiki.vim
vim.keymap.set("n", "<leader>wp", ":WikiPages<CR>")
vim.keymap.set("n", "<leader>wt", ":WikiTags<CR>")
vim.keymap.set("n", "<leader>wv", ":MarkdownPreviewToggle<CR>")
vim.keymap.set("n", "<leader>ws", ":OpenInScim<CR>")

-- }}}

-- AUTOCMDS  ---------------------------------------------------------------- {{{

-- .tex
vim.cmd[[autocmd Filetype tex nnoremap <localleader>wc :!detex % \| wc -w<CR>]]
vim.cmd[[autocmd Filetype tex set wrap spell]]
vim.cmd[[autocmd Filetype tex set conceallevel=1]]

-- markdown
vim.cmd[[autocmd Filetype markdown set nowrap spell]]

-- python
vim.cmd[[autocmd Filetype python nnoremap <localleader>x :w<bar>!python %<CR>]]
vim.cmd[[autocmd Filetype python set textwidth=79]]

-- bash
vim.cmd[[autocmd Filetype sh nnoremap <localleader>x :w<bar>!bash %<CR>]]

-- lua
-- vim.cmd[[autocmd Filetype lua set shiftwidth=2]]
-- vim.cmd[[autocmd Filetype lua set tabstop=2]]
vim.cmd[[autocmd Filetype lua nnoremap <localleader>x :source %<CR>]]

-- yaml
vim.cmd[[autocmd Filetype yaml set shiftwidth=2]]
vim.cmd[[autocmd Filetype yaml set tabstop=2]]

-- config
vim.cmd[[autocmd BufEnter sxhkdrc set ft=sxhkdrc]]

-- iron
vim.cmd[[autocmd BufNewFile,BufRead *.sage,*.sage.python,*python :set filetype=sage]]

-- }}}
