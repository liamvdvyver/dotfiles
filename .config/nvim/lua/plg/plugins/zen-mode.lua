return {
  "folke/zen-mode.nvim",
  enabled = false,
  depencies = { "folke/twilight.nvim" },
  opts = {
    plugins = {
      tmux = { enabled = true}
    }
  },
  keys = { { "<leader>z", ":ZenMode<CR>", { desc = "Toggle [z]en mode" } } },
}
