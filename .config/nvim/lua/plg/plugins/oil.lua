return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- I like to open oil directly from within ranger
  lazy = false,
  keys = {
    {
      "-",
      function()
        require("oil").open()
      end,
      { desc = "Open parent directory" },
    },
    {
      "<leader>U",
      function()
        require("oil").open("~/.local/state/nvim/swap")
      end,
      { desc = "Open swap directory" },
    },
  },
  opts = { default_file_explorer = false },
}
