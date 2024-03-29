return {
  "preservim/vimux",
  lazy = false,
  keys = {
    { "<leader>vk", function() vim.cmd[[VimuxCloseRunner]] end },
    { "<leader>vo", function() vim.cmd[[VimuxOpenRunner]] end },
    { "<leader>vs", function() vim.cmd[[VimuxPromptCommand]] end },
    { "<leader>vc", function() vim.cmd[[VimuxInterruptRunner]] end },
    { "<leader>vl", function() vim.cmd[[VimuxRunLastCommand]] end },
  }
}
