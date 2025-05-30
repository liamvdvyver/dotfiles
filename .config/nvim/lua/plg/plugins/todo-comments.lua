return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  event = { "VimEnter" }, -- HACK: this fixes startup screen closing
  config = function()
    require("todo-comments").setup()
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Fuzzy [f]ind [t]ODOs" })
    vim.keymap.set("n", "<leader>qt", "<cmd>TodoQuickFix<CR>", { desc = "[q]uickfix [t]ODOs" })
  end,
}
