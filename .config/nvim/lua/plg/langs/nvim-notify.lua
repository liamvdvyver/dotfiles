return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    vim.notify = require("notify")
  end,
  keys = {
    {
      "<leader>l",
      function()
        vim.notify.dismiss({ pending = true, silent = true })
        vim.cmd([[noh]])
      end,
      desc = "c[l]ear highlights/notifications",
    },
  },
}
