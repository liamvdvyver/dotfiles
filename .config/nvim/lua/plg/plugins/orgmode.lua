return {
  "nvim-orgmode/orgmode",
  enabled = false,
  lazy = true,
  event = "VeryLazy",
  opts = {
    org_default_notes_file = "~/Documents/org/refile.org",
    org_agenda_files = "~/Documents/org/*.org",
    mappings = {
      global = {
        -- org_agenda = '<leader>oA',
        -- org_capture = '<leader>X'
      },
      org = {
        org_meta_return = "<C-CR>",
      },
    },
  },
  config = function(_, opts)
    require("orgmode").setup_ts_grammar() -- FIX: Can't find parser, breaks plugin
    require("orgmode").setup(opts)
  end,
}
