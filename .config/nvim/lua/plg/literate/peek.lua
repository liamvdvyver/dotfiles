return {
  enabled = false,
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  options = {
    app = 'browser'
  },
  config = function(_, opts)
    require("peek").setup(opts)
    -- refer to `configuration to change defaults`
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
