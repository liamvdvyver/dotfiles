return {
  "preservim/vimux",
  lazy = false,
  keys = {
    {
      "<leader>vx",
      function()
        vim.cmd([[VimuxCloseRunner]])
      end,
      desc = "[V]imux: close runner",
    },
    {
      "<leader>vo",
      function()
        vim.cmd([[VimuxOpenRunner]])
      end,
      desc = "[V]imux: [o]pen runner",
    },
    {
      "<leader>vs",
      function()
        vim.cmd([[VimuxPromptCommand]])
      end,
      desc = "[V]imux: [s]end command",
    },
    {
      "<leader>vc",
      function()
        vim.cmd([[VimuxInterruptRunner]])
      end,
      desc = "[V]imux: send <C-[c]>",
    },
    {
      "<leader>v.",
      function() vim.cmd([[
      VimuxOpenRunner
      call VimuxSendKeys('Up')
      call VimuxSendKeys('Enter')
      ]])
      end,
      desc = "[V]imux: run last command",
    },
  },
}
