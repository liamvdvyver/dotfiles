return {
  "mason-org/mason-lspconfig.nvim",
  -- lazy = true, event = "VeryLazy", -- HACK: This is ~50ms slower but using "VeryLazy" breaks nvim-ansible
  lazy = false,
  enabled = require("lsp_conf").use_mason;
  dependencies = {
    "mason.nvim",
    "mfussenegger/nvim-ansible",
    "tjdevries/telescope.nvim",
  },

  config = function(opts, _)
    local lsp_conf = require("lsp_conf")

    if lsp_conf.use_mason then
      opts.ensure_installed = lsp_conf.lsps
      opts.automatic_enable = {exclude = {}}
      for k, _ in ipairs(lsp_conf.elsewhere_enabled) do
        opts.automatic_enable.exclude.insert(k)
      end
    end
    require("mason-lspconfig").setup(opts)

end,
}
