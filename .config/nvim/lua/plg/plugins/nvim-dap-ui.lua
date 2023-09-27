return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  lazy = true,
  keys = {
    {
      "<leader>dw",
      function()
        require("dapui").toggle()
      end,
      { desc = "Toggle [D]AP [w]indow" },
    },
  },
  opts = {},
}
