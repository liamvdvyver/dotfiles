return {
  'nvim-telescope/telescope.nvim', -- tag = '0.1.0',
  dependencies = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
  },
  config = function ()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>fl', function() builtin.find_files({ hidden = true }) end, { desc = 'Fuzzy [f]ind fules in [l]ocal directory' })
    vim.keymap.set('n', '<leader>fp', builtin.git_files,                 {desc = 'Fuzzy [f]ind files in git [p]roject'})
    vim.keymap.set('n', '<leader>fb', builtin.buffers,                   {desc = 'Fuzzy [f]ind [b]uffers'})
    vim.keymap.set('n', '<leader>/', function() builtin.current_buffer_fuzzy_find({ sorting_strategy = "ascending" }) end, { desc = 'Fuzzy find in current buffer' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,                 {desc = 'Fuzzy [f]ind [h]elp tags'})
    vim.keymap.set('n', '<leader>fm', builtin.keymaps,                   {desc = 'Fuzzy [f]ind key[m]aps'})
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles,                  {desc = 'Fuzzy [f]ind [old] files'})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,                 {desc = '[g]rep through files in local directory'})
    vim.keymap.set('n', '<leader>8',  builtin.grep_string,               {desc = 'grep word under cursor in working directory'})
    vim.keymap.set(
      'n', '<leader>f.',
      function() builtin.find_files({ search_dirs = {'~/.local/state/nvim/swap/'}}) end,
      {desc = 'Fuzzy [f]ind [s]wap files'}
    )
  end
}
