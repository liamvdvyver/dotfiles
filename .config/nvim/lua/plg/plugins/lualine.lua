local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "kyazdani42/nvim-web-devicons", name = "nvim-web-devicons-lualine" },
    { "WhoIsSethDaniel/lualine-lsp-progress.nvim", enabled = false },
  },
  opts = {
    options = {
      theme = "catppuccin",
      section_separators = "",
      component_separators = "",
    },
    sections = {
      lualine_b = {
        { "b:gitsigns_head", icon = "" },
        { "diff", source = diff_source },
        { "diagnostics", sources = { "nvim_lsp" } },
      },
      lualine_c = {
        "filename",
        "lsp_progress",
      },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
        { "swenv", icon = "v", color = { fg = "" } },
      },
    },
  },
}
