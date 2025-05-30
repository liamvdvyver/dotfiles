return {
  dir = "~/git/vim-test",
  dev = true,
  requirements = {
    "vim-dispatch",
    "vimux"
  },
  config = function(_, _)
    vim.cmd([[ let test#strategy = 'dispatch' ]])
  end,
  keys = {
    {
      "<leader>t",
      function()
        vim.cmd([[TestFile]])
      end,
      desc = "[t]est file",
    },
    {
      "<leader>T",
      function()
        vim.cmd([[TestSuite]])
      end,
      desc = "[T]est project",
    },
  },
}
