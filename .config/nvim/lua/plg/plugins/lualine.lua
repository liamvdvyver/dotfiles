return {
  'nvim-lualine/lualine.nvim',
  dependencies = {'kyazdani42/nvim-web-devicons', name = 'nvim-web-devicons-lualine'},
  opts = {
    options = {
      theme = 'gruvbox',
      sections = {lualine_a = {'mode', 'branch'}},
      section_separators = '',
      component_separators = ''
    }
  }
}
