return {
  "tpope/vim-fugitive",
  lazy = true,
  cmd = { "G" },
  keys = {
    { "<leader>gs", "<cmd>G<CR>", desc = "[g]it [m]ergetool" },
    { "<leader>gm", "<cmd>Git mergetool<CR>", desc = "[g]it [m]ergetool" },
    { "<leader>gv", "<cmd>Gvdiffsplit!<CR>", desc = "open [g]it diff [s]plit" },
    { "<leader>gh", "<cmd>diffget //2<CR>", desc = "get changes from left" },
    { "<leader>gl", "<cmd>diffget //3<CR>", desc = "get changes from right" },
  },
}
