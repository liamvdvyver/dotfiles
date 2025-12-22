return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    -- { "nvim-treesitter/nvim-treesitter-textobjects" }
  },
  config = function()

    local parsers = {
      "c",
      "lua",
      "luadoc",
      "rust",
      "python",
      "bash",
      "awk",
      "regex",
      "perl",
      "bibtex",
      "latex",
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
      -- "org",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "diff",
      "java",
      "haskell",
      "typescript",
      "javascript",
    }

    require("nvim-treesitter").install(parsers)

    -- shoutout Sylvan
    local filetypes = vim.iter(parsers):map(vim.treesitter.language.get_filetypes):flatten():totable()

    -- Enable treesitter for all installed languages
    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function(ev)
        vim.treesitter.start(ev.buf)
      end,
    })

    --   indent = { enable = true },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = "vn",
    --       node_incremental = "<C-n>",
    --       node_decremental = "<C-p>",
    --       -- scope_incremental = "s",
    --     },
    --   },
    --   textobjects = {
    --     move = {
    --       enable = true,
    --       set_jumps = false, -- you can change this if you want.
    --       goto_next_start = {
    --         --- ... other keymaps
    --         ["]C"] = { query = "@code_cell.inner", desc = "next code block" },
    --       },
    --       goto_previous_start = {
    --         --- ... other keymaps
    --         ["[C"] = { query = "@code_cell.inner", desc = "previous code block" },
    --       },
    --     },
    --     select = {
    --       enable = true,
    --
    --       -- Automatically jump forward to textobj, similar to targets.vim
    --       lookahead = true,
    --
    --       keymaps = {
    --         -- You can use the capture groups defined in textobjects.scm
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function.inner",
    --         ["ac"] = "@class.outer",
    --         -- You can optionally set descriptions to the mappings (used in the desc parameter of
    --         -- nvim_buf_set_keymap) which plugins like which-key display
    --         ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    --         -- You can also use captures from other query groups like `locals.scm`
    --         ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    --         ["iC"] = { query = "@fenced_code_block.inner", desc = "in block" },
    --         ["aC"] = { query = "@code_cell.outer", desc = "around block" },
    --       },
    --       -- You can choose the select mode (default is charwise 'v')
    --       --
    --       -- Can also be a function which gets passed a table with the keys
    --       -- * query_string: eg '@function.inner'
    --       -- * method: eg 'v' or 'o'
    --       -- and should return the mode ('v', 'V', or '<c-v>') or a table
    --       -- mapping query_strings to modes.
    --       selection_modes = {
    --         ["@parameter.outer"] = "v", -- charwise
    --         ["@function.outer"] = "V", -- linewise
    --         ["@class.outer"] = "<c-v>", -- blockwise
    --       },
    --       -- If you set this to `true` (default is `false`) then any textobject is
    --       -- extended to include preceding or succeeding whitespace. Succeeding
    --       -- whitespace has priority in order to act similarly to eg the built-in
    --       -- `ap`.
    --       --
    --       -- Can also be a function which gets passed a table with the keys
    --       -- * query_string: eg '@function.inner'
    --       -- * selection_mode: eg 'v'
    --       -- and should return true or false
    --       include_surrounding_whitespace = false,
    --     },
    --     swap = {
    --       -- Swap only works with code blocks that are under the same
    --       -- markdown header
    --       enable = true,
    --       swap_next = {
    --         --- ... other keymap
    --         ["<leader>sbl"] = "@code_cell.outer",
    --       },
    --       swap_previous = {
    --         --- ... other keymap
    --         ["<leader>sbh"] = "@code_cell.outer",
    --       },
    --     },
    --   },
    -- })
  end,
}
