return {
  "creativenull/efmls-configs-nvim",
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "neovim/nvim-lspconfig",
  },

  config = function()
    local languages = {}

    -- selecting presets
    languages = vim.tbl_extend("force", languages, {
      python = {
        require("efmls-configs.linters.flake8"), -- install with mason
        require("efmls-configs.formatters.black"), -- install with mason
      },
      sh = { -- shellcheck included with LSP
        require("efmls-configs.formatters.shfmt"), -- install with pacman
      },
      lua = { -- TODO: automate installation
        require("efmls-configs.linters.luacheck"), -- install with mason
        require("efmls-configs.formatters.stylua"), -- install with mason
      },
    })

    languages.sh[1].formatCommand = languages.sh[1].formatCommand .. "i 4 -" -- use 4 space indents
    languages.python[2].formatCommand = languages.python[2].formatCommand .. "l 71 -" -- black match flake8 line length
    languages.lua[2].formatCommand = languages.lua[2].formatCommand .. "-search-parent-directories -"

    local opts = {
      filetypes = vim.tbl_keys(languages),
      settings = { rootMarkers = { ".git/" }, languages = languages },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }

    require("lspconfig").efm.setup(opts)
  end,
}
