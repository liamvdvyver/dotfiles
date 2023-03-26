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
      autocmd Filetype markdown call vimtex#init()
    ]]
  }

  use{
    'nvim-telescope/telescope-bibtex.nvim',
    requires = {'nvim-telescope/telescope.nvim'},
    after = {'telescope.nvim'},
    config = function()
      require("telescope").setup {
       extensions = {
         bibtex = {
           -- context = true,
           -- context_fallback = false
           global_files = {'~/Documents/zotero/bib.bib'},
         }
       }
     }
     require("telescope").load_extension("bibtex")
    end,
  }

  use {
    'jalvesaq/Nvim-R',
    opt = true, ft = {'r', 'rmd'},
    branch = 'stable',
    config = vim.cmd[[let R_assign = 0]]
  }

  -- notes

  use {
    'lervag/wiki.vim',
    config = vim.cmd[[
      let g:wiki_root = '~/Documents/pkb/'
      let g:wiki_filetypes = ['md', 'org']
      let g:wiki_link_extension = ''
      let g:wiki_export = {
      \ 'args' : '',
      \ 'from_format' : 'markdown',
      \ 'ext' : 'pdf',
      \ 'link_ext_replace': v:false,
      \ 'view' : v:true,
      \ 'output': fnamemodify(tempname(), ':h'),
      \}
    ]]
  }

  use {
    "iamcco/markdown-preview.nvim",
    opt = true, ft = {'markdown'},
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = vim.cmd[[
      let g:mkdp_page_title = '「${name}」'
      let g:mkdp_theme = 'dark'
      let g:mkdp_auto_start = 0
      let g:mkdp_auto_close = 1
    ]]
  }

  use {
    'img-paste-devs/img-paste.vim',
    opt = true, ft = {'markdown'},
    config = vim.cmd[[
      autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
    ]]
  }

  use {
    'mipmip/vim-scimark',
    opt = true, ft = {'markdown'},
    config = vim.cmd[[let g:scimCommand = 'sc-im']]
  }

  -- git

  use {
    'airblade/vim-gitgutter',
    config = vim.cmd[[let g:gitgutter_map_keys = 0]]
  }

  use {
    'tpope/vim-fugitive',
    opt = true, cmd = {'G'}
  }

  -- navigation

  use {
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
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.0',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    }
  }

  use{
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({})
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{
        -- highlights = {
        --     fill = {
        --         bg = {
        --             attribute = "bg",
        --             highlight = "Normal"
        --         }
        --     }
        -- }
      }
    end
  }

  -- language/syntax

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }

  use {
    'chrisbra/Colorizer',
    opt = true, cmd = {'ColorToggle'}
  }

  use {
  'preservim/tagbar',
  opt = true, cmd = {'Tagbar', 'TagbarToggle'}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
  }

  use 'tpope/vim-commentary'

  -- airline

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
          sections = { lualine_a = {'mode', 'branch'} },
          section_separators = '',
          component_separators = ''
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
  use {
    'mbbill/undotree',
    opt = true, cmd = { 'UndotreeToggle' }
  }

  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup{
        org_default_notes_file = '~/Documents/org/refile.org',
      org_agenda_files = '~/Documents/org/*.org',
        mappings = {
          global = {
            -- org_agenda = '<leader>oA',
            -- org_capture = '<leader>X'
          },
          org = {
            org_meta_return = '<C-CR>',
          }
        }
      }
      require("cmp").setup { sources = { { name = 'nvim_lsp' } } }
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

