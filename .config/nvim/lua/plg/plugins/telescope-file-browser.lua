return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "stevearc/oil.nvim",
  },
  lazy = true,
  event = "VeryLazy",
  config = function()
    local Path = require("plenary.path")
    local action_state = require("telescope.actions.state")

    -- Mapping don't work when definitng opts outside of config
    local opts = {
      extensions = {
        file_browser = {
          mappings = {
            ["i"] = {
              ["<C-Space>"] = function(prompt_bufnr)
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                local dir = Path:new(current_picker.finder.path)
                current_picker:close_windows()
                require("oil").open(dir.filename)
              end,
            },
          },
        },
      },
    }

    require("telescope").setup(opts)
    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<leader>n", function()
      require("telescope").extensions.file_browser.file_browser({ path = vim.fn.expand("%:p:h") })
    end, { desc = "Browse files" })
  end,
}
