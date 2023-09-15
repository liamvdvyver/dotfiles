return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      lazy = true, keys = {
        {"<F5>", function() require("dap").continue() end},
        {"<F10>", function() require("dap").step_over() end},
        {"<F11>", function() require("dap").step_into() end},
        {"<F12>", function() require("dap").step_out() end},
        {"<Leader>db", function() require("dap").toggle_breakpoint() end, {desc = "Toggle [D]AP [b]reakpoint"}},
        {"<Leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc = "Toggle conditional [D]AP [B]reakpoint"}},
        {"<Leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc = "Toggle [D]AP [l]og point"}},
        {"<Leader>dr", function() require("dap").repl.open() end, {desc = "Open [D]AP [r]epl"}},
        {"<Leader>d.", function() require("dap").run_last() end, {desc = "Run last [D]AP debug"}},
      }
    },
    { "nvim-dap-virtual-text" }
  },
  lazy = true, keys = {
    {"<leader>dw", function() require("dapui").toggle() end, { desc = "Toggle [D]AP [w]indow" }},
  },
  opts = {}
}
