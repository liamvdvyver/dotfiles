return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", {desc = "Previous git hunk"})
    vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", {desc = "Next git hunk"})
  end
}
