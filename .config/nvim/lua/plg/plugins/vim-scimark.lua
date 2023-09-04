return {
  'mipmip/vim-scimark',
  lazy = true,
  keys = {{"<leader>ws", ":OpenInScim<CR>"}},
  config = function()
    vim.g.scimCommand = 'sc-im'
  end
}
