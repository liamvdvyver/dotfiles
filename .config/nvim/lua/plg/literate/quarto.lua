return {
  "https://github.com/quarto-dev/quarto-nvim",
  config = {
    lspFeatures = {
      -- NOTE: put whatever languages you want here:
      languages = { "r", "python", "rust" },
      chunks = "all",
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },
      completion = {
        enabled = true,
      },
    },
    keymap = {
      -- NOTE: setup your own keymaps:
      hover = "H",
      definition = "gd",
      rename = "<leader>rn",
      references = "gr",
      format = "<leader>gf",
    },
    codeRunner = {
      enabled = true,
      default_method = "molten",
    },
  },
}
