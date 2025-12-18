return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  event = "BufReadPre",
  config = function(_, _)
    vim.o.termguicolors = true
    require("colorizer").setup()
  end,
}
