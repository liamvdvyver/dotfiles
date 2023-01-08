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
    opt = true, ft = {'tex', 'bib'},
    config = vim.cmd[[
      let g:tex_conceal="abdmg:"
      let g:latex_view_general_viewer = "zathura"
      let g:vimtex_view_method = "zathura"
    ]]
  }

  use {
    'jalvesaq/Nvim-R',
    opt = true, ft = {'r', 'rmd'},
    branch = 'stable',
    config = vim.cmd[[let R_assign = 0]]
  }

  -- git

  use 'airblade/vim-gitgutter'
  use {
    'tpope/vim-fugitive',
    opt = true, cmd = {'G'}
  }

  -- navigation

  use {
    'preservim/nerdtree',
    opt = true, cmd = {'NERDTreeToggle'},
    config = vim.cmd[[let NERDTreeShowHidden=1]],
    requires = {
      { 'ryanoasis/vim-devicons', opt = true },
      { 'Xuyuanp/nerdtree-git-plugin', opt = true },
      -- {'tiagofumo/vim-nerdtree-syntax-highlight'}
    }
  }

  use {
    'junegunn/fzf.vim',
    opt = true, cmd = {'Files', 'GFiles', 'Buffers', 'Rg'}
  }

  -- language/syntax

  use {
    'neoclide/coc.nvim', branch = 'release',
    opt = true, ft = {'python', 'tex', 'bib', 'r', 'rmd', 'sh'},
    run = ':CocInstall',
    config = function()
      if packer_plugins["coc.nvim"] and packer_plugins["coc.nvim"].loaded then
        vim.cmd[[
          source ~/.config/nvim/coc.vim
          " install languageserver R package for coc-r-lsp
          " install shellcheck and shfmt system packages for coc-diagnostic
          let g:coc_global_extensions = [
            \ 'coc-pyright',
            \ 'coc-vimtex',
            \ 'coc-r-lsp',
            \ 'coc-diagnostic',
            \ ]
        ]]
        return true
      end
    end
  }

  use {
    'chrisbra/Colorizer',
    opt = true, cmd = {'ColorToggle'}
  }

  use {
  'preservim/tagbar',
  opt = true, cmd = {'Tagbar', 'TagbarToggle'}
  }

  use 'tpope/vim-commentary'

  -- snippets

  use {
    'SirVer/ultisnips',
    requires = { 'honza/vim-snippets' },
    config = vim.cmd[[let g:UltiSnipsExpandTrigger = "<c-cr>"]]
  }

  -- airline

  use {
    'vim-airline/vim-airline',
    disable = 'true',
    requires = { 'vim-airline/vim-airline-themes', opt = true },
    config = vim.cmd[[let g:airline_powerline_fonts = 1]]
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          sections = { lualine_a = {'mode', 'branch'} }
        }
      }
    end,
  }

  -- colorschemes

  use 'lifepillar/vim-solarized8'
  use {'dracula/vim', as = 'dracula'}
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'
  use {'i0x0/onehalf-vim'}
  -- use {'sonph/onehalf', rtp = 'vim'}
  use {
    'ghifarit53/tokyonight-vim',
    config = vim.cmd[[let g:tokyonight_transparent_background = 0]]
  }
  use {'catppuccin/nvim', as = 'catppuccin'}

  -- other

  use 'christoomey/vim-tmux-navigator'
  use {
    'voldikss/vim-floaterm',
    opt = true, keys = {'<C-t>'},
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

