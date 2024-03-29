return {
  "vim-test/vim-test",
  requirements = { "preservim/vimux" },
  setup = function()
    vim.cmd([[ let test#strategy = 'vimux' ]])
  end,
}
