return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    { 'kyazdani42/nvim-web-devicons', name = 'nvim-web-devicons-lualine' },
    { 'WhoIsSethDaniel/lualine-lsp-progress.nvim' },
  },
  opts = {
    options = {
      theme = 'gruvbox',
      section_separators = '',
      component_separators = ''
    },
    sections = {
      lualine_b = {
        "branch", "diff",
        { "diagnostics", sources = { "nvim_lsp" } }
      },
      lualine_c = {
        'filename', 'lsp_progress'
      },
      lualine_x = {
        'encoding', 'fileformat', 'filetype',
        { "swenv", icon = "v", color = { fg = "" } } }
    },
  }
}
