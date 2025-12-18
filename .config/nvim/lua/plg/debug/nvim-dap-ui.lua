return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "Jorenar/nvim-dap-disasm"
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
