return {
  "pwntester/octo.nvim",
  requires = {
    dependencies = {
      { "nvim-tree/nvim-web-devicons", name = "tree-nvim-web-devicons" },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  opts = {
    suppress_missing_scope = {
      projects_v2 = true,
    },
  },
}
