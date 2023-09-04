return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {"mason.nvim"},
  after = {"mason.nvim"},
  opts = {
    ensure_installed = { "python", "bash" },
    handlers = {}
  },
  config = function(_, opts)
    require("mason").setup()
    require("mason-nvim-dap").setup(opts)
  end
}
