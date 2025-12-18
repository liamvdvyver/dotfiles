return {
  dir = "~/git/disasm_nvim",
  lazy = false,
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>o", "<cmd>DisasmLine<CR>", { desc = "View current line in [o]bjdump" } },
    { "<leader>O", "<cmd>Disasm! ", { desc = "Open [o]bjdump" } },
  }
}
