return {
  "kawre/leetcode.nvim",
  lazy = true,
  cmd = { "Leet" },
  build = "<cmd>TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    { "MunifTanjim/nui.nvim", lazy = true },
  },
  opts = {},
}
