return {
  "img-paste-devs/img-paste.vim",
  lazy = true,
  ft = { "markdown" },
  keys = {
    { "<localleader>p", ":call mdip#MarkdownClipboardImage() <CR><CR><BS><ESC>" },
  },
  config = function()
    -- vim.cmd([[
    --   autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
    -- ]])
  end,
}
