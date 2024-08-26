return {
  "nvim-telescope/telescope-bibtex.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = true,
  keys = { {
    "<leader>fz",
    "<cmd>Telescope bibtex<CR>",
    desc = "Fuzzy [f]ind bibtex ([z]otero) references",
  } },
  -- after = {'telescope.nvim'},
  opts = {
    extensions = {
      bibtex = {
        -- context = true,
        -- context_fallback = false
        global_files = { "~/Documents/zotero/bib.bib" },
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("bibtex")
  end,
}
