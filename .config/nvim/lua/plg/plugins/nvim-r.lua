return {
  'jalvesaq/Nvim-R',
  branch = 'master',
  lazy = true, ft = {'r', 'rmd', 'quarto'},
  opts = {filetypes = {'r', 'rmd', 'quarto'}},
  config = function(_, opts)
    require('cmp_nvim_r').setup(opts)
    vim.g.R_assign = 0
    vim.g.rout_follow_colorscheme = 1
  end
}
