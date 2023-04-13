local lsp = require('lsp-zero')
local lspkind = require('lspkind')

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
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        TESTING = {entry, vim_item}
        return vim_item
      end
    })
  }
})

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

local ls = require('luasnip')
ls.filetype_extend("markdown", { "tex" })
