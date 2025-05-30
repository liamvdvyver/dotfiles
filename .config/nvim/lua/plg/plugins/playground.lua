return {
  "nvim-treesitter/playground",
  dependencies = "nvim-treesitter",
  lazy = true,
  keys = { { "<leader>P", "<cmd>TSPlaygroundToggle<CR>", desc = "Toggle treesitter [P]layground" } },
}
