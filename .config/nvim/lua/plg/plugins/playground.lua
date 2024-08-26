return {
  "nvim-treesitter/playground",
  dependencies = "nvim-treesitter",
  lazy = true,
  keys = { { "<leader>T", "<cmd>TSPlaygroundToggle<CR>", desc = "Toggle [T]reesitter playground" } },
}
