return {
  "AckslD/swenv.nvim",
  lazy = true,
  ft = "python",
  dependencies = {
    {
      "ahmedkhalf/project.nvim",
      enabled = false,
      opts = {},
      config = function(_, opts)
        require("project_nvim").setup(opts)
      end,
    },
  },
  opts = {
    get_venvs = function(venvs_path)
      return require("swenv.api").get_venvs(venvs_path)
    end,
    venvs_path = vim.fn.expand("~/.conda/envs"),
    post_set_venv = function()
      vim.cmd("LspRestart")
    end,
  },
  keys = {
    {
      "<localleader>e",
      function()
        require("swenv.api").pick_venv()
      end,
      { "Choose v[e]nv" },
    },
    {
      "<localleader>E",
      function()
        require("swenv.api").get_current_venv()
      end,
      { "Show current v[e]nv" },
    },
  },
  config = function(_, opts)
    require("swenv").setup(opts)
    require("swenv.api").auto_venv()
  end,
}
