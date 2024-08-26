--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

vim.g.mapleader = " "
require("plugins")

vim.cmd.syntax("enable")
vim.cmd.colorscheme("catppuccin")

P = function(v)
  print(vim.inspect(v))
end

Pm = function(v)
  print(vim.inspect(getmetatable(v)))
end

Run = function(cmd)
  cmd = cmd:gsub("'", "'..\"'\"..'")
  local vimcmd = "VimuxRunCommand('" .. cmd .. "')"
  vim.cmd(vimcmd)
end

Cwd_matches = function(query)
  local dir = vim.fn.getcwd()
  local p = io.popen('find "' .. dir .. '" -maxdepth 1 -type f -name "' .. query ..'"')
  for file in p:lines() do
    P(file)
    return not not file
  end
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

-- breaking bad habits
vim.keymap.set("i", "<C-c>", function() vim.notify("BRUH XDDDDD") end)
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
vim.keymap.set("n", "}", "}zz", { desc = "Center after scroll up" })
vim.keymap.set("n", "{", "{zz", { desc = "Center after scroll down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center after [n]ext result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center after previous result" })

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
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Auto indent block on move up" })
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Auto indent block on move down" })

-- leaders
vim.keymap.set("n", "<leader>W", "<cmd>set wrap!<CR>", { desc = "Toggle [w]rap" })
vim.keymap.set(
  "n",
  "<leader>L",
  ':execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>',
  { desc = "Toggle [l]ine at textwidth" }
)
vim.keymap.set("n", "<leader>S", "<cmd>source $MYVIMRC<CR>", { desc = "[S]ource config file" })

-- spelling
vim.keymap.set("n", "<leader>O", "<cmd>set spell!<CR>", { desc = "Toggle [o]rthography (spelling)" })
vim.keymap.set("i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Fix last spelling mistake" })

-- buffer/tab management
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>P", "<cmd>tabprevious<CR>", { desc = "[P]revious tab" })
vim.keymap.set("n", "<leader>N", "<cmd>tabnext<CR>", { desc = "[N]ext tab" })
vim.keymap.set("n", "<leader>C", "<cmd>tabnew<CR>", { desc = "[C]reate tab" })
vim.keymap.set("n", "<leader>X", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<C-w>h", "<C-W>s")

-- brackets and lists
vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz", { desc = "Previous [l]ocation" })
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz", { desc = "Next [l]ocation" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Previous [q]uickfix item" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next [q]uickfix item" })
vim.keymap.set("n", "<leader>Q", "<cmd>cclose<CR>", { desc = "close [q]uickfix list" })
vim.keymap.set("n", "<leader>q", "<cmd>cwindow<CR>", { desc = "show [q]uickfix list" })

-- }}}

-- AUTOCMDS  ---------------------------------------------------------------- {{{

-- general
vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}]])

-- config
vim.cmd([[autocmd BufEnter sxhkdrc setlocal ft=sxhkdrc]])

-- }}}
