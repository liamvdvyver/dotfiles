return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous [g]it hunk" })
    vim.keymap.set("n", "]g", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next [g]it hunk" })
    vim.keymap.set("n", "<leader>gx", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset [g]it hunk" })
    vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview [d]iff of [g]it hunk" })
    vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "[g]it [b]lame current line" })
    vim.keymap.set(
      "n",
      "<leader>gB",
      "<cmd>Gitsigns toggle_current_line_blame<CR>",
      { desc = "toggle [g]it [b]lame current line" }
    )
    vim.keymap.set("n", "<leader>ga", "<cmd>Gitsigns stage_hunk<CR>", { desc = "[a]dd [g]it hunk" })
    vim.keymap.set("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "[u]nstage [g]it hunk" })
    vim.keymap.set("n", "vig", "<cmd>Gitsigns select_hunk<CR>", { desc = "[i]nner [g]it hunk" })
  end,
}
