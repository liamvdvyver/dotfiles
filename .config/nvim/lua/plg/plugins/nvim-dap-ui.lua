return  {
  "rcarriga/nvim-dap-ui",
  lazy = true, key = {"<leader>D"},
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {desc = "toggle [b]reakpoint"})
        vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc = "toggle conditional [B]reakpoint"})
        vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set("n", "<Leader>dr", dap.repl.open)
        vim.keymap.set("n", "<Leader>dl", dap.run_last)
      end
    },
    'nvim-dap-virtual-text'
  },
  config = function()
    require("dapui").setup()
    local dapui = require("dapui")
    vim.keymap.set("n", "<leader>D", dapui.toggle, { desc = "Toggle [D]AP window" })
  end
}
