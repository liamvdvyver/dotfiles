return {
  "creativenull/efmls-configs-nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  -- define overrides here
  opts = nil,
  config = function(_, opts)
    -- default settings
    -- local languages = require("efmls-configs.defaults").languages()
    local languages = {}
    -- selecting presets
    languages = vim.tbl_extend("force", languages, {
      python = {
        require("efmls-configs.linters.flake8"),   -- install with pacman
        require("efmls-configs.formatters.black"), -- install with pacman
      },
      sh = {
        require("efmls-configs.formatters.shfmt"), -- install with pacman
      },
    })

    languages.sh[1].formatCommand = languages.sh[1].formatCommand .. "i 4 -"
    languages.python[2].formatCommand = languages.python[2].formatCommand .. "l 71 -"

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = {
        rootMarkers = { ".git/" },
        languages = languages,
      },
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true,
      },
    }
    require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, opts))
  end,
}
