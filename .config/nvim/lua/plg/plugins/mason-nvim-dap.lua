return {
  "jay-babu/mason-nvim-dap.nvim",
  lazy = true,
  dependencies = { "mason.nvim" },
  opts = {
    ensure_installed = { "bash", "codelldb", "python", "haskell", "javadbg", "javatest" },
    handlers = {
      function(config)
        -- all sources with no handler get passed here

        -- Keep original functionality
        require("mason-nvim-dap").default_setup(config)
      end,
      -- python = function(config)
      --   config.adapters = {
      --     type = "executable",
      --     command = "/usr/bin/python3",
      --     args = {
      --       "-m",
      --       "debugpy.adapter",
      --     },
      --   }
      --   require("mason-nvim-dap").default_setup(config) -- don't forget this!
      -- end,
    },
  },
  config = function(_, opts)
    require("mason").setup()
    require("mason-nvim-dap").setup(opts)
  end,
}
