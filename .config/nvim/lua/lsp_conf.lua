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

return ret
