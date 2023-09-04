return {
  'img-paste-devs/img-paste.vim',
  lazy = true, ft = {'markdown'},
  config = function()
    vim.cmd[[
      autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
    ]]
  end
}
