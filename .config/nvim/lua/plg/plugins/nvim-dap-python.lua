return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  config = function()
    -- Ensure debugpy installed in this env
    -- Automatically picks up on env change
    require("dap-python").setup("/usr/bin/python")
  end,
}
