local lsp = require('lsp-zero')
local cmp = require('cmp')
local lspkind = require('lspkind')

lsp.preset({
  name  = 'recommended',
  suggest_lsp_servers = false,
  set_lsp_keymaps = {
    omit = {'<C-k>', 'gd', 'go', 'gr', 'gi', },
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

-- Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

cmp.setup({
  sources = {
    {name = 'luasnip'   , priority = 8},
    {name = 'nvim_lsp'  , priority = 5},
    {name = 'nvim_lua'  , priority = 5},
    {name = 'path'      , priority = 1},
    {name = 'cmp_nvim_r', priority = 9},
    -- {name = 'omni'},
  },
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      menu = ({
        path = "[Path]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        cmp_nvim_r = "[Nvim-R]",
      }),
      -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        TESTING = {entry, vim_item}
        return vim_item
      end
    })
  },
  window = {
    documentation = cmp.config.window.bordered(),
  }
})

local ls = require('luasnip')
ls.filetype_extend("markdown", { "tex" })
