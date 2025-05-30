return {
  "tpope/vim-dispatch",
  keys = {
    {"<leader>b", function () vim.cmd[[Make %]] end, desc = "[b]uild file"},
    {"<leader>B", function() vim.cmd[[Make]] end, desc = "[b]uild project"},
  },
  cmd = {
    "Dispatch",
    "Make"
  }
}
