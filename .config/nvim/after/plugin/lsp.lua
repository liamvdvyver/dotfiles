local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'sumneko_lua',
  'pyright',
  'bashls',
  'texlab',
  'r_language_server',
  'marksman',
})

lsp.setup()

-- Configure lua language server for neovim
lsp.nvim_workspace()
