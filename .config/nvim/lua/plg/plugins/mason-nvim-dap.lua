return {
  "jay-babu/mason-nvim-dap.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = { "mason.nvim" },
  after = { "mason.nvim" },
  opts = {
    ensure_installed = { "python", "bash", "codelldb" },
    handlers = {},
  },
  config = function(_, opts)
    require("mason").setup()
    require("mason-nvim-dap").setup(opts)
  end,
}
