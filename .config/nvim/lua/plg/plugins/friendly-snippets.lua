return {
  "rafamadriz/friendly-snippets",
  enabled = false,
  dependencies = { "L3MON4D3/LuaSnip" },
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
