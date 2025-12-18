return {
  "https://github.com/quarto-dev/quarto-nvim",
  lazy = true,
  filetypes = { "markdown" },
  dependencies = {
    "jmbuhr/otter.nvim",
    opts = {},
    dependencies = { "nvim-treesitter" },
  },
  opts = {
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
  config = function(_, opts)
    require("quarto").setup(opts)
    -- from molten wiki
    local runner = require("quarto.runner")
    vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
    vim.keymap.set("n", "<localleader>rg", runner.run_above, { desc = "run cell and above", silent = true })
    vim.keymap.set("n", "<localleader>rG", runner.run_all,   { desc = "run all cells", silent = true })
    vim.keymap.set("n", "<localleader>rr", runner.run_line,  { desc = "run line", silent = true })
    vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
    vim.keymap.set("n", "<localleader>RG", function()
      runner.run_all(true)
    end, { desc = "run all cells of all languages", silent = true })
  end,
}
