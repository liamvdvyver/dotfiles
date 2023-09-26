return {
  "lukas-reineke/indent-blankline.nvim",
  opts = { show_current_context = true },
  config = function(_, opts)
    require("indent_blankline").setup(opts)
    vim.keymap.set("n", "zc", "zc:IndentBlanklineRefresh<CR>")
    vim.keymap.set("n", "zo", "zo:IndentBlanklineRefresh<CR>")
    vim.keymap.set("n", "zM", "zM:IndentBlanklineRefresh<CR>")
    vim.keymap.set("n", "zR", "zR:IndentBlanklineRefresh<CR>")
  end,
}
