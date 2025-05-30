return {
  "lervag/vimtex", -- Lazy loading breaks inverse search
  config = function()
    vim.g.latex_view_general_viewer = "zathura"
    vim.g.vimtex_view_method = "zathura"
    vim.cmd([[autocmd Filetype markdown call vimtex#init()]])
  end,
}
