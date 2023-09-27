return {
  "creativenull/efmls-configs-nvim",
  dependencies = {
    "VonHeikemen/lsp-zero.nvim",
    "neovim/nvim-lspconfig",
    "mason.nvim",
  },
  lazy = true,
  event = "VeryLazy",

  config = function()
    local languages = {}

    -- ensure installed
    local mason = require("mason-registry")
    local mason_ensure_installed = {
      "flake8",
      "black",
      "luacheck",
      "stylua",
      "shfmt",
      "shellcheck",
    }

    for _, v in ipairs(mason_ensure_installed) do
      if not mason.is_installed(v) then
        vim.cmd("MasonInstall " .. v)
      end
    end

    -- selecting presets
    languages = vim.tbl_extend("force", languages, {
      python = {
        require("efmls-configs.linters.flake8"),
        require("efmls-configs.formatters.black"),
      },
      sh = { -- shellcheck included with LSP
        require("efmls-configs.formatters.shfmt"),
        -- require("efmls-configs.linters.shellcheck"), -- bash-language-server handles this if installed
      },
      lua = { -- TODO: automate installation
        require("efmls-configs.linters.luacheck"),
        require("efmls-configs.formatters.stylua"),
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
