return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'hrsh7th/cmp-cmdline'},
    -- {'jalvesaq/cmp-nvim-r'},
    {dir = '~/git/cmp-nvim-r/', dev = true},
    {'onsails/lspkind.nvim'},
    -- Snippets
    {
      'L3MON4D3/LuaSnip',
      dependencies = 'rafamadriz/friendly-snippets'
    },
    -- Snippet Collection (Optional)
    {
      'rafamadriz/friendly-snippets',
      config = function() require("luasnip.loaders.from_vscode").lazy_load() end
    },
  },
  config = function()

    local lsp = require('lsp-zero')
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    -- local cmp_action = lsp.cmp_action()
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local ls = require('luasnip')

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
      -- preselect = 'Item',
      completion = {
        completeopt = 'menu,menuone,noselect'
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
        completion = cmp.config.window.bordered(),
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'cmdline' },
      },
      formatting = {
        fields = { "abbr" },
      },
    })

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )

    ls.filetype_extend("markdown", { "tex" })

    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Open diagnostics" })
    vim.keymap.set("n", "gr", builtin.lsp_references)
    vim.keymap.set("n", "gi", builtin.lsp_implementations)
    vim.keymap.set("n", "gd", builtin.lsp_definitions)
    vim.keymap.set("n", "go", builtin.lsp_type_definitions)
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy [f]ind [d]iagnostics" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Fuzzy [f]ind [s]ymbols in document" })
    vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Fuzzy [f]ind symbols in [w]orkspace" })

  end
}