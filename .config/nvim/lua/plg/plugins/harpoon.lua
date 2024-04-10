
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = { "nvim-lua/plenary.nvim" },
  opts = {},
  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon:setup(opts)

    vim.keymap.set("n", "<Leader>m", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "View project [m]arks" })
    vim.keymap.set("n", "<Leader>M", function()
      harpoon:list():add()
    end, { desc = "Add project [M]arks" })
    vim.keymap.set("n", "gh", function()
      harpoon:list():select(1)
    end, { desc = "Open primary file" })
    vim.keymap.set("n", "gj", function()
      harpoon:list():select(2)
    end, { desc = "Open secondary file" })
    vim.keymap.set("n", "gk", function()
      harpoon:list():select(3)
    end, { desc = "Open tertiary file" })
  end,
}
