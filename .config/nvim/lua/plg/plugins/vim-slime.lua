return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_no_mappings = 1
  end,
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = { socket_name = "default", target_pane = "1" }
    vim.g.slime_dont_ask_default = 1
  end,
  keys = {
    { "<leader>s", "<Plug>SlimeMotionSend", desc = "[S]lime: send motion to repl" },
    { "<leader>ss", "<Plug>SlimeLineSend", desc = "[S]lime: send line to repl" },
    { "<leader>s", "<Plug>SlimeRegionSend", mode = "v", desc = "[S]lime: send selection to repl" },
  },
}
