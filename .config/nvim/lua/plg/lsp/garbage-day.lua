return {
  "zeioth/garbage-day.nvim",
  dependencies = "neovim/nvim-lspconfig",
  event = "VeryLazy",
  enabled = false,
  opts = {
    grace_period = 10,
    notifications = true,
  },
}
