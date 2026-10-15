return {
  "lervag/vimtex", -- Lazy loading breaks inverse search
  config = function()
    vim.cmd([[autocmd Filetype markdown call vimtex#init()]])
  end,
}
