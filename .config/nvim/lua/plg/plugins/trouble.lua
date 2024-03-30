return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    name = "tree-nvim-web-devicons",
  },
  opts = {},
  keys = {
    {
      "]t",
      function()
        require("trouble").next({ skip_groups = true, jump = true })
      end,
      desc = "Next [t]rouble item",
    },
    {
      "[t",
      function()
        require("trouble").previous({ skip_groups = true, jump = true })
      end,
      desc = "Previous [t]rouble item",
    },
    {
      "<leader>tq",
      function()
        require("trouble").toggle("quickfix")
      end,
      desc = "Toggle [t]rouble [q]uickfix list",
    },
    {
      "<leader>tl",
      function()
        require("trouble").toggle("loclist")
      end,
      desc = "Toggle [t]rouble [l]ocation list",
    },
    {
      "<leader>td",
      function()
        require("trouble").toggle("workspace_diagnostics")
      end,
      desc = "Toggle [t]rouble [d]iagnostics",
    },
    {
      "<leader>to",
      function()
        require("trouble").toggle("todo")
      end,
      desc = "Toggle [t]rouble t[o]dos",
    },
  },
}
