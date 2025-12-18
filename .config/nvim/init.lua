--        _
-- __   _(_)_ __ ___  _ __ ___
-- \ \ / / | '_ ` _ \| '__/ __|
--  \ V /| | | | | | | | | (__
-- (_)_/ |_|_| |_| |_|_|  \___|
--

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
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
vim.o.exrc = true
vim.o.secure = true

-- }}}

-- MAPS --------------------------------------------------------------------- {{{

-- Disable some maps to break my bad habits
local bad_str = "BAD!!!!!!"
local disabled_keys = {
  i = { "<C-c>" },
  n = { "{", "}", ":" },
  v = { "{", "}", ":" },
}

-- Helpers for long commands
local search_replace_norm = [[:%s/\(<C-r><C-w>\)//gI<Left><Left><Left>]]
local search_replace_visu = [["hy:%s/\(<C-r>h\)//gI<Left><Left><Left>]]
local word_count = "y<Esc>:!echo '<C-r>0' | wc -w<CR>"

local clear = function()
  vim.cmd("nohlsearch")
  vim.notify.dismiss()
end

-- Enable colour column on startup
local toggle_column = function()
  vim.cmd([[execute "set colorcolumn=" . (&colorcolumn == "" ? "+1" : "")]])
end
toggle_column()

local keymaps = {

  -- normal
  { "n", "j", "gj", "[j] through wrap" },
  { "n", "k", "gk", "[k] through wrap" },
  { "n", "Y", "y$", "[Y] like D, C" },
  { "n", "zz", "zz<C-w>=", "Center & equal splits" },

  -- Ex
  { { "n", "v" }, ";", ":", "Ex command" },

  -- clipboard
  { { "n", "v" }, "<leader>y", '"+y', "[y]ank to clipboard" },
  { "n", "<leader>Y", '"+Y$', "[Y]ank till $ to clipboard" },
  { { "n", "v" }, "<leader>p", '"+p', "[p]aste to clipboard" },
  { "n", "<leader>P", '"+P', "[P]aste till $ to clipboard" },

  -- find and replace word/selection
  { "n", "<c-s>", search_replace_norm, "[s]earch and replace word under cursor" },
  { "v", "<c-s>", search_replace_visu, "[s]earch and replace visual" },

  -- visual
  { "v", "<", "<gv", "Reselect visual after [<]" },
  { "v", ">", ">gv", "Reselect visual after [>]" },
  { "v", "K", ":m '<-2<CR>gv=gv", "Auto indent block on move up" },
  { "v", "J", ":m '>+1<CR>gv=gv", "Auto indent block on move down" },
  { "v", "<leader>w", word_count, "word count" },

  -- leaders
  { "n", "<leader>W", "<cmd>set wrap!<CR>", "Toggle [w]rap" },
  { "n", "<leader>L", toggle_column, "Toggle [l]ine at textwidth" },
  { "n", "<leader>S", "<cmd>source $MYVIMRC<CR>", "[S]ource config file" },
  { "n", "<leader>a", "ggVG", "select [a]ll" },

  -- spelling
  { "n", "<leader>S", "<cmd>set spell!<CR>", "Toggle [s]pelling)" },
  { "i", "<C-s>", "<c-g>u<Esc>[s1z=`]a<c-g>u", "Fix last spelling mistake" },

  -- buffer/tab management
  { "n", "<leader>x", "<cmd>bd<CR>", "Close buffer" },
  { "n", "<C-w>h", "<C-W>s" },

  -- brackets and lists
  { "n", "<leader>C", "<cmd>copen<CR>", "open quickfix list" },
  { "n", "<leader>cd", vim.diagnostic.setqflist, "quickfix [d]iagnostics" },
  { "n", "[t", "<cmd>tabprev<CR>", "Previous [t]ab" },
  { "n", "]t", "<cmd>tabnext<CR>", "Next [t]ab" },

  -- testing: from reddit
  { "n", "yc", "yy<cmd>normal gcc<CR>p", "[y]ank, [c]omment and re-paste line" },
  { "n", "<C-c>", "ciw", "[C]hange inside word" },
  { "i", "<C-h>", "<BS>", "delete word" },

  -- testing: heavy nav remaps
  { "i", "<C-M-d>", "<C-o>_", "Goto start of line"},
  { "i", "<C-M-c>", "<C-o>$", "Goto end of line"},

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
