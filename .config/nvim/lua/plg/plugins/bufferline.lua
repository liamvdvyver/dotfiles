return {
  'akinsho/bufferline.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons', name = 'nvim-web-devicons-bufferline'},
  config = function()
    require("bufferline").setup()
    vim.keymap.set("n", "<M-h>", ":BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<M-l>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<M-,>", ":BufferLineMovePrev<CR>")
    vim.keymap.set("n", "<M-.>", ":BufferLineMoveNext<CR>")
  end
}
