return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  lazy = true,
  keys = {
    {
      "<leader>dw",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle [D]AP [w]indow",
    },
  },
  opts = {},
}
