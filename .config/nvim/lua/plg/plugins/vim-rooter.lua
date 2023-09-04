return {
  'airblade/vim-rooter',
  config = function()
    vim.g.rooter_patterns = {
      ".git",
      "=pkb",
    }
    vim.g.rooter_change_directory_for_non_project_files = "current" -- when non of the above patterns is found
    vim.g.rooter_cd_cmd =  "lcd"
    vim.g.rooter_silent_chdir = true
    vim.g.rooter_buftypes = {''}
  end
}
