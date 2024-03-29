return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ignore_install = { "latex" },
      ensure_installed = {
        "c",
        "lua",
        "rust",
        "python",
        "bash",
        "awk",
        "regex",
        "perl",
        -- "bibtex", "latex",
        "css",
        "html",
        "http",
        "r",
        "sql",
        "json",
        "yaml",
        "sxhkdrc",
        "vim",
        "markdown",
        "markdown_inline",
        "org",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "diff",
        "java",
        "haskell"
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "v<cr>",
          node_incremental = "]n",
          node_decremental = "[n",
          scope_incremental = "]s",
        },
      },
    })
  end,
}
