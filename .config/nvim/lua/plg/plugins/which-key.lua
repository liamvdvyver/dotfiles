return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    local wk = require("which-key")
    wk.setup()
    wk.add({ "<leader>f", group = "[F]ind" })
    wk.add({ "<leader>d", group = "[D]AP" })
    wk.add({ "<leader>g", group = "[G]it" })
    wk.add({ "<leader>g", group = "[V]imux" })
    wk.add({ "<leader>w", group = "[W]iki" })
    wk.add({ "<leader>w", group = "[W]iki" })
  end,
}
