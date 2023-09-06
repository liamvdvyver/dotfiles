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
        {"<Leader>b", function() require("dap").toggle_breakpoint() end, {desc = "Toggle [b]reakpoint"}},
        {"<Leader>B", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc = "Toggle conditional [B]reakpoint"}},
        {"<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc = "Toggle [l]og [point]"}},
        {"<Leader>dr", function() require("dap").repl.open() end, {desc = "Open [d]ap [r]epl"}},
        {"<Leader>dl", function() require("dap").run_last() end, {desc = "Run [l]ast [d]ebug"}},
      }
    },
    { "nvim-dap-virtual-text" }
  },
  lazy = true, keys = {
    {"<localleader>D", function() require("dapui").toggle() end, { desc = "Toggle [D]AP window" }},
  },
  opts = {}
}
