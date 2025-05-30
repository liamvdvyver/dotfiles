--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

vim.g.mapleader = " "
vim.g.maplocalleader = ","
require("plugins")

vim.cmd.syntax("enable")
vim.cmd.colorscheme("catppuccin")

-- HELPERS ------------------------------------------------------------------ {{{

P = function(v)
  print(vim.inspect(v))
end

Pm = function(v)
  print(vim.inspect(getmetatable(v)))
end

-- }}}

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

-- Disable some maps to break my bad habits
local bad_str = "BAD!!!!!!"
local disabled_keys = {
  i = { "<C-c>" },
  n = { "{", "}" },
  v = { "{", "}" },
}

-- Helpers for long commands
local toggle_column = [[:execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")<CR>]]
local search_replace_norm = [[:%s/\(<C-r><C-w>\)//gI<Left><Left><Left>]]
local search_replace_visu = [["hy:%s/\(<C-r>h\)//gI<Left><Left><Left>]]

local clear = function()
  vim.cmd("nohlsearch")
  vim.notify.dismiss()
end

local keymaps = {

  -- normal
  { "n", "j", "gj", "[j] through wrap" },
  { "n", "k", "gk", "[k] through wrap" },
  { "n", "Y", "y$", "[Y] like D, C" },
  { "n", "<A-y>", "<c-w><", "Shrink split horizontally" },
  { "n", "<A-u>", "<c-w>+", "Grow split vertically" },
  { "n", "<A-i>", "<c-w>-", "Shrink split vertically" },
  { "n", "<A-o>", "<c-w>>", "Grow split horizontally" },
  { "n", "<C-u>", "<C-u>zz", "Center after scroll up" },
  { "n", "<C-d>", "<C-d>zz", "Center after scroll down" },
  { "n", "}", "}zz", "Center after scroll up" },
  { "n", "{", "{zz", "Center after scroll down" },
  { "n", "n", "nzzzv", "Center after [n]ext result" },
  { "n", "N", "Nzzzv", "Center after previous result" },

  -- clipboard
  { "n", "<leader>y", '"+y', "[y]ank to clipboard" },
  { "v", "<leader>y", '"+y', "[y]ank visual to clipboard" },
  { "n", "<leader>Y", '"+Y$', "[Y]ank till $ to clipboard" },
  { "n", "<leader>d", '"+d', "[d]elete to clipboard" },
  { "v", "<leader>d", '"+d', "[d]elete visual to clipboard" },
  { "n", "<leader>D", '"+D', "[D]elete till $ to clipboard" },
  { "n", "<leader>p", '"+p', "[p]aste to clipboard" },
  { "v", "<leader>p", '"+p', "[p]aste visual to clipboard" },
  { "n", "<leader>P", '"+P', "[P]aste till $ to clipboard" },

  -- find and replace word/selection
  { "n", "<c-s>", search_replace_norm, "[s]earch and replace word under cursor" },
  { "v", "<c-s>", search_replace_visu, "[s]earch and replace visual" },

  -- visual
  { "v", "<", "<gv", "Reselect visual after [<]" },
  { "v", ">", ">gv", "Reselect visual after [>]" },
  { "v", "K", ":m '<-2<CR>gv=gv", "Auto indent block on move up" },
  { "v", "J", ":m '>+1<CR>gv=gv", "Auto indent block on move down" },

  -- leaders
  { "n", "<leader>W", "<cmd>set wrap!<CR>", "Toggle [w]rap" },
  { "n", "<leader>L", toggle_column, "Toggle [l]ine at textwidth" },
  { "n", "<leader>S", "<cmd>source $MYVIMRC<CR>", "[S]ource config file" },
  { "n", "<leader>a", "ggVG", "select [a]ll" },

  -- spelling
  { "n", "<leader>O", "<cmd>set spell!<CR>", "Toggle [o]rthography (spelling)" },
  { "i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", "Fix last spelling mistake" },

  -- buffer/tab management
  { "n", "<leader>x", "<cmd>bd<CR>", "Close buffer" },
  { "n", "<leader>P", "<cmd>tabprevious<CR>", "[P]revious tab" },
  { "n", "<leader>N", "<cmd>tabnext<CR>", "[N]ext tab" },
  { "n", "<leader>C", "<cmd>tabnew<CR>", "[C]reate tab" },
  { "n", "<leader>X", "<cmd>tabclose<CR>", "Close tab" },
  { "n", "<C-w>h", "<C-W>s" },

  -- brackets and lists
  { "n", "[l", "<cmd>lprev<CR>zz", "Previous [l]ocation" },
  { "n", "]l", "<cmd>lnext<CR>zz", "Next [l]ocation" },
  { "n", "[q", "<cmd>cprev<CR>zz", "Previous [q]uickfix item" },
  { "n", "]q", "<cmd>cnext<CR>zz", "Next [q]uickfix item" },
  { "n", "<leader>Q", "<cmd>cclose<CR>", "close [q]uickfix list" },
  { "n", "<leader>q", "<cmd>cwindow<CR>", "show [q]uickfix list" },

  -- testing: from reddit
  { "n", "yc", "yy<cmd>normal gcc<CR>p", "[y]ank, [c]omment and re-paste line" },
  { "n", "<C-c>", "ciw", "[C]hange inside word" },
  { "n", "<leader>qd", vim.diagnostic.setqflist, "[q]uickfix [d]iagnostics" },

  -- clear on escape
  { "n", "<Esc>", clear, "Clear highlight" },
}

-- Set the maps
for _, map in ipairs(keymaps) do
  vim.keymap.set(map[1], map[2], map[3], { desc = map[4] })
end

-- Actually disable those keys from earlier
for mode, keys in pairs(disabled_keys) do
  for _, key in ipairs(keys) do
    vim.keymap.set(mode, key, function()
      vim.notify(bad_str)
    end, { desc = "disabled" })
  end
end

-- }}}

-- AUTOCMDS  ---------------------------------------------------------------- {{{

-- general
vim.cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}]])

-- config
vim.cmd([[autocmd BufEnter sxhkdrc setlocal ft=sxhkdrc]])

-- }}}
