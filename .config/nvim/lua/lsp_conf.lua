local ret = {
  lsps = {
    "lua_ls",
    "pyright",
    "bashls",
    "texlab",
    "marksman",
    "efm",
    "clangd",
    "ansiblels",
    "jdtls",
    "ts_ls",
    "emmet_language_server",
    "nixd"
  },
  formatters = {
      "black",
      "stylua",
      "shfmt",
      "prettier",
      "fourmolu",
      "google-java-format",
      "dprint",
  },
  linters = {
      "flake8",
      "luacheck",
      "shellcheck",
      "ansible-lint",
      "eslint-lsp",
  },
  debuggers = {
   "bash", "codelldb", "python", --[[ "haskell", ]]"javadbg", "javatest" 
  },
  elsewhere_enabled = {
    jdtls = 1,
    efm = 1,
  },
  use_mason = false,
}

for _, name in ipairs(ret.lsps) do
  if not ret.elsewhere_enabled[name] then
    vim.lsp.enable(name)
  end
end

local function filter_formatters(client)
  local format_servers = { efm = true, clangd = true }
  return not not format_servers[client.name]
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition" })
vim.keymap.set("n", "gD", vim.diagnostic.setqflist, { desc = "EMPTY" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "EMPTY" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy [f]ind [d]iagnostics" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Fuzzy [f]ind [r]eferences" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Fuzzy [f]ind [s]ymbols in document" })
vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Fuzzy [f]ind symbols in [w]orkspace" })
vim.keymap.set("n", "<leader>F", function()
  vim.lsp.buf.format({ filter = filter_formatters })
end, { desc = "[F]ormat buffer" })
vim.keymap.set("v", "<leader>F", function()
  vim.lsp.buf.format({ filter = filter_formatters })
end, { desc = "[F]ormat buffer" })

return ret
