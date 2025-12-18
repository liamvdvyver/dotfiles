return {
  "folke/snacks.nvim",
  -- priority = 1000,
  -- lazy = false,
  lazy = true,
  ft = { "markdown", "latex" },
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true ,
      doc = {
        enabled = true,
        max_width = 100,
        max_height = 100,
      },
    }
  },
}
