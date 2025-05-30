return {
  "iamcco/markdown-preview.nvim",
  lazy = true,
  ft = { "markdown" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  config = function()
    vim.g.mkdp_page_title = "「${name}」"
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.keymap.set("n", "<leader>wv", "<cmd>MarkdownPreviewToggle<CR>")
  end,
}
