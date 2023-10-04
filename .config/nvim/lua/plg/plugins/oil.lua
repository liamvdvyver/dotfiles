return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    name = "tree-nvim-web-devicons",
  },
  lazy = true,
  keys = {
    { "-", function() require("oil").open() end, { desc = "Open parent directory" } },
    { "<leader>U", function() require("oil").open("~/.local/state/nvim/swap") end, { desc = "Open swap directory" } },
  },
  opts = { default_file_explorer = false },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
