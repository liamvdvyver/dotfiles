--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

vim.g.mapleader = " "
require("plugins")

vim.cmd.syntax("enable")
vim.cmd.colorscheme("gruvbox")

P = function(v)
  print(vim.inspect(v))
end

Pm = function(v)
  print(vim.inspect(getmetatable(v)))
end

Run = function(cmd)
  local vimcmd = "VimuxRunCommand('clear; ' . " .. cmd .. ")"
  vim.cmd(vimcmd)
end

-- NETRW -------------------------------------------------------------------- {{{

vim.g.netrw_keepdir = 1
vim.g.netrw_winsize = 25
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- use <C-l> to move windows without opening duplicate netrw
vim.cmd([[
function! NetrwMapping()
    silent! unmap <buffer> <C-l>
endfunction
augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END
]])

-- }}}

-- SETS --------------------------------------------------------------------- {{{

vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.autochdir = false
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
vim.o.showmode = false
vim.o.background = "dark"
vim.o.list = true
vim.o.spelllang = "en_au"
vim.o.splitbelow = true
vim.o.splitright = true

-- }}}

-- MAPS --------------------------------------------------------------------- {{{

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

-- left and right
vim.keymap.set("n", "H", "^", { desc = "Start of line" })
vim.keymap.set("n", "L", "$", { desc = "End of line" })

-- clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "[y]ank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "[y]ank visual to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y$', { desc = "[Y]ank till $ to clipboard" })
vim.keymap.set("n", "<leader>d", '"+d', { desc = "[d]elete to clipboard" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "[d]elete visual to clipboard" })
vim.keymap.set("n", "<leader>D", '"+D', { desc = "[D]elete till $ to clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "[p]aste to clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "[p]aste visual to clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "[P]aste till $ to clipboard" })

-- find and replace word/selection
vim.keymap.set(
  "n",
  "<c-s>",
  [[:%s/\(<C-r><C-w>\)//gI<Left><Left><Left>]],
  { desc = "[s]earch and replace word under cursor" }
)
vim.keymap.set("v", "<c-s>", [["hy:%s/\(<C-r>h\)//gI<Left><Left><Left>]], { desc = "[s]earch and replace visual" })

-- visual
vim.keymap.set("v", "<", "<gv", { desc = "Reselect visual after [<]" })
vim.keymap.set("v", ">", ">gv", { desc = "Reselect visual after [>]" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Auto indent block on move up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Auto indent block on move down" })

-- leaders
vim.keymap.set("n", "<leader>W", ":set wrap!<CR>", { desc = "Toggle [w]rap" })
vim.keymap.set(
  "n",
  "<leader>L",
  ':execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>',
  { desc = "Toggle [l]ine at textwidth" }
)
vim.keymap.set("n", "<leader>S", ":source $MYVIMRC<CR>", { desc = "[S]ource config file" })

-- spelling
vim.keymap.set("n", "<leader>O", ":set spell!<CR>", { desc = "Toggle [o]rthography (spelling)" })
vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Fix last spelling mistake" })

-- buffer/tab management
vim.keymap.set("n", "<leader>k", ":bd<CR>", { desc = "[k]ill buffer" })
vim.keymap.set("n", "<leader>P", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>N", ":tabnext<CR>")
vim.keymap.set("n", "<leader>C", ":tabnew<CR>", { desc = "[N]ew tab" })
vim.keymap.set("n", "<leader>X", ":tabclose<CR>", { desc = "[K]ill tab" })
vim.keymap.set("n", "<C-w>h", "<C-W>s")

-- brackets and lists
vim.keymap.set("n", "[l", ":lprev<CR>zz", { desc = "Previous [l]ocation" })
vim.keymap.set("n", "]l", ":lnext<CR>zz", { desc = "Next [l]ocation" })
vim.keymap.set("n", "[q", ":cprev<CR>zz", { desc = "Previous [q]uickfix item" })
vim.keymap.set("n", "]q", ":cnext<CR>zz", { desc = "Next [q]uickfix item" })
vim.keymap.set("n", "<leader>q", ":cclose<CR>", { desc = "close [q]uickfix list" })
vim.keymap.set("n", "<leader>Q", ":cwindow<CR>", { desc = "show [q]uickfix list" })

-- }}}

-- AUTOCMDS  ---------------------------------------------------------------- {{{

-- general
vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}]])

-- .tex
vim.cmd([[autocmd Filetype tex nnoremap <localleader>wc :!detex % \| wc -w<CR>]])
vim.cmd([[autocmd Filetype tex setlocal wrap spell]])
vim.cmd([[autocmd Filetype tex setlocal conceallevel=1]])
vim.cmd([[autocmd Filetype tex setlocal formatoptions -=t]])

-- markdown
vim.cmd([[autocmd Filetype markdown setlocal nowrap spell]])
vim.cmd([[autocmd Filetype markdown setlocal formatoptions -=t]])

-- python
vim.cmd([[autocmd Filetype python nnoremap <localleader>x :w<bar>!python %<CR>]])
vim.cmd([[autocmd Filetype python setlocal textwidth=79]])

-- bash
vim.cmd([[autocmd Filetype sh nnoremap <localleader>x :w<bar>!bash %<CR>]])

-- lua
vim.cmd([[autocmd Filetype lua setlocal shiftwidth=2]])
vim.cmd([[autocmd Filetype lua setlocal tabstop=2]])
vim.cmd([[autocmd Filetype lua nnoremap <localleader>x :source %<CR>]])

-- yaml
vim.cmd([[autocmd Filetype yaml setlocal shiftwidth=2]])
vim.cmd([[autocmd Filetype yaml setlocal tabstop=2]])

-- config
vim.cmd([[autocmd BufEnter sxhkdrc setlocal ft=sxhkdrc]])

-- r
vim.cmd([[autocmd Filetype r setlocal shiftwidth=2]])
vim.cmd([[autocmd Filetype r setlocal tabstop=2]])

-- c
vim.cmd([[autocmd Filetype c nnoremap <localleader>x :make %:r<CR>]])
vim.cmd([[autocmd Filetype c nnoremap <localleader>X :split<CR>:terminal ./%:r<CR>i]])

-- haskell
vim.cmd([[autocmd Filetype haskell nnoremap <localleader>t :w<bar>!doctest %<CR>]])

-- }}}
