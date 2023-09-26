return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    name = "tree-nvim-web-devicons",
  },
  lazy = true,
  keys = { { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } } },
  opts = { default_file_explorer = false },
}
