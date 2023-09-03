local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

  -- IDE like/language specific {{{

  {
    'lervag/vimtex', -- Lazy loading breaks inverse search
    config = function() vim.cmd[[
      let g:latex_view_general_viewer = "zathura"
      let g:vimtex_view_method = "zathura"
      autocmd Filetype markdown call vimtex#init()
    ]] end
  },

  {
    'nvim-telescope/telescope-bibtex.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    -- after = {'telescope.nvim'},
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
  },

  {
    'jalvesaq/Nvim-R',
    -- opt = true, ft = {'r', 'rmd'},
    branch = 'master',
    config = function() vim.cmd[[
      let R_assign = 0
      let rout_follow_colorscheme = 1
    ]] end
  },

  {"untitled-ai/jupyter_ascending.vim"},

  -- }}}

  -- Notes {{{

  {
    'lervag/wiki.vim',
    config = function()
      vim.g.wiki_select_method = {
        pages = require("wiki.telescope").pages,
        tags = require("wiki.telescope").tags,
        toc = require("wiki.telescope").toc,
      }
      vim.cmd[[
        let g:wiki_root = '~/Documents/pkb/'
        let g:wiki_filetypes = ['md', 'org', 'tex']
        let g:wiki_link_extension = ''
        let g:wiki_export = {
        \ 'args' : '',
        \ 'from_format' : 'markdown',
        \ 'ext' : 'pdf',
        \ 'link_ext_replace': v:false,
        \ 'view' : v:true,
        \ 'output': fnamemodify(tempname(), ':h'),
        \}
        let g:wiki_tag_parsers = [
        \ g:wiki#tags#default_parser,
        \ { 'match': {x -> x =~# '^tags: '},
        \   'parse': {x -> split(matchstr(x, '^tags:\zs.*'), '[ ,]\+')},
        \   'make':  {t, x -> 'tags: ' . empty(t) ? '' : join(t, ', ')}}
        \]
      ]]
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = true, ft = {'markdown'},
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function() vim.cmd[[
      let g:mkdp_page_title = '「${name}」'
      let g:mkdp_theme = 'dark'
      let g:mkdp_auto_start = 0
      let g:mkdp_auto_close = 1
    ]] end
  },

  {
    'img-paste-devs/img-paste.vim',
    lazy = true, ft = {'markdown'},
    config = function() vim.cmd[[
      autocmd FileType markdown nmap <buffer><silent> <localleader>p :call mdip#MarkdownClipboardImage()<CR>
    ]] end
  },

  {
    'mipmip/vim-scimark',
    lazy = true, ft = {'markdown'},
    config = function() vim.cmd[[let g:scimCommand = 'sc-im']] end
  },

  -- }}}

  -- Git {{{

  {
    'tpope/vim-fugitive',
    lazy = true, cmd = {'G'}
  },

  {
  'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },

  -- }}}

  -- Navigation {{{

  {
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
  },

  -- {
  --   'preservim/nerdtree',
  --   -- opt = true, cmd = {'NERDTreeToggle'},
  --   config = vim.cmd[[let NERDTreeShowHidden=1]],
  --   dependencies = {
  --     { 'Xuyuanp/nerdtree-git-plugin', opt = true },
  --     -- {'tiagofumo/vim-nerdtree-syntax-highlight'}
  --   }
  -- },

  -- {'ryanoasis/vim-devicons', after = "nerdtree"},
  -- {'ryanoasis/vim-devicons'},

  {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.0',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
    }
  },

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup({})
    end
  },

  {
    'akinsho/bufferline.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons', name = 'nvim-web-devicons-bufferline'},
    config = function()
      require("bufferline").setup{
        highlights = {
            fill = {
                bg = {
                    attribute = "bg",
                    highlight = "Normal"
                }
            }
        }
      }
    end
  },

  {'ThePrimeagen/harpoon'},

  --- }}}

  -- Language/Syntax {{{

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
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
      -- {'jalvesaq/cmp-nvim-r'},
      {dir = '~/git/cmp-nvim-r/', dev = true},
      {'onsails/lspkind.nvim'},

      -- Snippets
      {
        'L3MON4D3/LuaSnip',
        dependencies = 'rafamadriz/friendly-snippets'
      },
      -- Snippet Collection (Optional)
      {
        'rafamadriz/friendly-snippets',
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end
      },
    }
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      require("dapui").setup()
    end
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    -- after = {"mason.nvim"},
    dependencies = {"mason.nvim"},
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "bash" },
        handlers = {}
      })
    end
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },

  {
    'chrisbra/Colorizer',
    lazy = true, cmd = {'ColorToggle'}
  },

  {
  'preservim/tagbar',
  lazy = true, cmd = {'Tagbar', 'TagbarToggle'}
  },

  {
    'nvim-treesitter/nvim-treesitter',
      build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
  },

  {'nvim-treesitter/playground'},

  'tpope/vim-commentary',

  --- }}}

  -- Lualine {{{

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', name = 'nvim-web-devicons-lualine', lazy = true },
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
  },

  --- }}}

  -- Colorschemes {{{

  {'lifepillar/vim-solarized8', lazy = false},
  {'dracula/vim', name = 'dracula', lazy = false},
  {'morhetz/gruvbox', lazy = false},
  {'arcticicestudio/nord-vim', lazy = false},
  {'i0x0/onehalf-vim', lazy = false},
  -- {'sonph/onehalf', rtp = 'vim', lazy = false},
  {
    'ghifarit53/tokyonight-vim',
    config = function() vim.cmd[[let g:tokyonight_transparent_background = 0]] end,
  lazy = false},
  {'catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 100},

  --- }}}

  -- Other {{{

  'christoomey/vim-tmux-navigator',
  {
    'voldikss/vim-floaterm',
    lazy = true, keys = {'<C-t>'},
    config = function() vim.cmd[[let g:floaterm_keymap_toggle = "<C-t>"]] end
  },
  'jiangmiao/auto-pairs',
  'tpope/vim-surround',
  {
    'mbbill/undotree',
    lazy = true, cmd = { 'UndotreeToggle' }
  },

  {
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
    end,
  },

  --- }}}

  -- Ideally this should be moved
}

require("lazy").setup(plugins, _)

  -- require('cmp_nvim_r').setup({
  --   filetypes = {'r', 'rmd', 'quarto'}
  -- })

