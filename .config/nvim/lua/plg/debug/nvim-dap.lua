return {
  "mfussenegger/nvim-dap",
  dependencies = {
  "jay-babu/mason-nvim-dap.nvim",
  "theHamsta/nvim-dap-virtual-text",
  "mfussenegger/nvim-dap-python",
  },
  lazy = true,
  keys = {
    {
      "<Leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "DAP: continue"
    },
    {
      "<Leader>dj",
      function()
        require("dap").step_over()
      end,
      desc = "DAP: step over"
    },
    {
      "<Leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "DAP: step into"
    },
    {
      "<Leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "DAP: step out"
    },
    {
      "<Leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle [D]AP [b]reakpoint",
    },
    {
      "<Leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Toggle conditional [D]AP [B]reakpoint",
    },
    {
      "<Leader>dl",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      desc = "Toggle [D]AP [l]og point",
    },
    {
      "<Leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Open [D]AP [r]epl",
    },
    {
      "<Leader>d.",
      function()
        require("dap").run_last()
      end,
      desc = "Run last [D]AP debug",
    },
  },

  -- Allow lldb to attach to running process
  config = function()
    local dap = require("dap")
    dap.configurations.cpp[#dap.configurations.cpp+1] = {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'codelldb',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
    }
  end
}
