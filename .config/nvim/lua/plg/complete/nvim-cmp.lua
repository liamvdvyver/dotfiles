return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    { "onsails/lspkind.nvim" },
    { "L3MON4D3/LuaSnip" },
    -- Sources
    -- { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-cmdline" },
    { "R-nvim/cmp-r" },
    { "jmbuhr/otter.nvim" },
    {
      "liamvdvyver/cmp-bibtex",
      opts = {
        files = { "~/Documents/zotero/bib.bib" },
        filetypes = { "markdown", "tex" },
      },
    },
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local ls = require("luasnip")

    -- hack from https://github.com/hrsh7th/nvim-cmp/issues/1797
    local function fast_cmp_visible()
      if not (cmp.core.view and cmp.core.view.custom_entries_view) then
        return false
      end
      return cmp.core.view.custom_entries_view:visible()
    end

    local opts = {

      sources = {
        { name = "cmp_r", priority = 5 },
        { name = "nvim_lsp", priority = 4 },
        { name = "nvim_lua", priority = 3 },
        { name = "path", priority = 2 },
        { name = "luasnip", priority = 1 },
        { name = "bibtex" },
        { name = "otter" },
      },

      completion = {
        completeopt = "menu,menuone,noinsert,noselect",
      },

      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if fast_cmp_visible() then
            cmp.confirm({ select = true })
          elseif ls.expandable() then
            ls.expand()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function()
          if ls.jumpable() then
            ls.jump(1)
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end, { "i", "s" }),
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- show only symbol annotations
          menu = {
            path = "[Path]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            cmp_r = "[R.nvim]",
          },
          -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            return vim_item
          end,
        }),
      },

      window = {
        -- documentation = cmp.config.window.bordered(),
        -- completion = cmp.config.window.bordered(),
      },
    }

    cmp.setup(opts)

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
      formatting = {
        fields = { "abbr" },
      },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    ls.filetype_extend("markdown", { "tex" })
  end,
}
