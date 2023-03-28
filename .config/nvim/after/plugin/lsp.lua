local lsp = require('lsp-zero')

lsp.preset({
  name  = 'recommended',
  suggest_lsp_servers = false,
  set_lsp_keymaps = {
    omit = {'<C-k>'},
    preserve_mappings = false
  },
})

lsp.ensure_installed({
  'lua_ls',
  'pyright',
  'bashls',
  'texlab',
  'r_language_server',
  'marksman',
})

lsp.setup_nvim_cmp({
  sources = {
    {name = 'luasnip'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'path'},
    -- {name = 'omni'},
    {name = 'cmp_nvim_r'},
  },
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local ls = require('luasnip')
ls.filetype_extend("markdown", { "tex" })
