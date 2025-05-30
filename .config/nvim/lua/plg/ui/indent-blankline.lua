return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {},
  config = function(_, opts)
    require("ibl").setup(opts)
    vim.keymap.set("n", "zc", "zc:lua require'ibl'.debounced_refresh(0)<CR>")
    vim.keymap.set("n", "zo", "zo:lua require'ibl'.debounced_refresh(0)<CR>")
    vim.keymap.set("n", "zM", "zM:lua require'ibl'.debounced_refresh(0)<CR>")
    vim.keymap.set("n", "zR", "zR:lua require'ibl'.debounced_refresh(0)<CR>")
  end,
}
