return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "G" },
  keys = {
    { "<leader>gs", "<cmd>G<CR>", desc = "[g]it [m]ergetool" },
    { "<leader>gm", "<cmd>Git mergetool<CR>", desc = "[g]it [m]ergetool" },
    { "<leader>gv", "<cmd>Gvdiffsplit!<CR>", desc = "open [g]it diff [s]plit" },
    { "<leader>go", ":diffget", desc = "[g]it [o]btain changes" },
  },
}
