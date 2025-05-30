return {
  "akinsho/bufferline.nvim",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons", name = "tree-nvim-web-devicons" },
  opts = {
    options = {
      buffer_close_icon = "",
      close_icon = "",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.keymap.set("n", "<M-h>", "<cmd>BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<M-l>", "<cmd>BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<M-,>", "<cmd>BufferLineMovePrev<CR>")
    vim.keymap.set("n", "<M-.>", "<cmd>BufferLineMoveNext<CR>")
  end,
}
