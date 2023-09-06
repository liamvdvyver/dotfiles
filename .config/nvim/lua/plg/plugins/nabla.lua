return {
 'jbyuki/nabla.nvim',
  lazy = true,
  keys = {{
    "<leader>we",
    function() require('nabla').popup() end,
    desc = "preview [e]quation"
  }}
}
