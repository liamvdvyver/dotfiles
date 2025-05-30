return {
  "mipmip/vim-scimark",
  lazy = true,
  keys = { { "<leader>ws", "<cmd>OpenInScim<CR>", { desc = "Edit table in [s]c-im" } } },
  config = function()
    vim.g.scimCommand = "sc-im"
  end,
}
