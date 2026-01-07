return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  enabled = true,
  config = function()
    -- Ensure debugpy installed in this env
    -- Automatically picks up on env change
    -- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")
    require("dap-python").setup("python3")
  end,
}
