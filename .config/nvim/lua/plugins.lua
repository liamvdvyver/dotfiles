local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- IDE like/language specific

  use {
    'lervag/vimtex',
    config = vim.cmd[[
      let g:tex_conceal="abdmg:"
      let g:latex_view_general_viewer = "zathura"
      let g:vimtex_view_method = "zathura"
    ]]
  }

  use {
    'jalvesaq/Nvim-R',
    branch = 'stable',
    config = vim.cmd[[let R_assign = 0]]
  }

  -- git

  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- navigation
  use {'preservim/nerdtree', config = vim.cmd[[let NERDTreeShowHidden=1]]}
  use 'ryanoasis/vim-devicons'
  -- use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'junegunn/fzf.vim'
  -- language/syntax
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    config = vim.cmd[[
      source ~/.config/nvim/coc.vim
      " install languageserver R package for coc-r-lsp
      " install shellcheck and shfmt system packages for coc-diagnostic
      let g:coc_global_extensions = [
        \ 'coc-pyright',
        \ 'coc-vimtex',
        \ 'coc-r-lsp',
        \ 'coc-diagnostic',
        \ ]
    ]],
    run = ':CocInstall'
  }
  use 'mboughaba/i3config.vim'
  use 'chrisbra/Colorizer'
  use 'preservim/tagbar'
  use 'tpope/vim-commentary'
  -- snippets
  use {
    'SirVer/ultisnips',
    config = vim.cmd[[let g:UltiSnipsExpandTrigger = "<c-cr>"]]
  }
  use 'honza/vim-snippets'
  -- airline
  use {
    'vim-airline/vim-airline',
    config = vim.cmd[[let g:airline_powerline_fonts = 1]]
  }
  use 'vim-airline/vim-airline-themes'
  -- colorschemes
  use 'altercation/vim-colors-solarized'
  use 'lifepillar/vim-solarized8'
  use 'dracula/vim'
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'
  use 'rakr/vim-one'
  use 'sonph/onehalf'
  use {
    'ghifarit53/tokyonight-vim',
    config = vim.cmd[[let g:tokyonight_transparent_background = 0]]
  }
  use 'lourenci/github-colors'
  use {'catppuccin/nvim', as = 'catppuccin'}
  -- other
  use 'christoomey/vim-tmux-navigator'
  use {
    'voldikss/vim-floaterm',
    config = vim.cmd[[let g:floaterm_keymap_toggle = "<C-t>"]]
  }
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

