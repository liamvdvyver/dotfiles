return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", { desc = "Previous [g]it hunk" })
    vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", { desc = "Next [g]it hunk" })
    vim.keymap.set("n", "<leader>gx", ":Gitsigns reset_hunk<CR>", { desc = "Reset [g]it hunk" })
    vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk<CR>", { desc = "Preview [d]iff of [g]it hunk" })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "[g]it [b]lame current line" })
    vim.keymap.set(
      "n",
      "<leader>gB",
      ":Gitsigns toggle_current_line_blame<CR>",
      { desc = "toggle [g]it [b]lame current line" }
    )
    vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_hunk<CR>", { desc = "[a]dd [g]it hunk" })
    vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", { desc = "[u]nstage [g]it hunk" })
    vim.keymap.set("n", "vig", ":Gitsigns select_hunk<CR>", { desc = "[i]nner [g]it hunk" })
  end,
}
