return {
  'ThePrimeagen/harpoon',
  config = function()
    vim.keymap.set(
      "n",
      "<Leader>m", function() require("harpoon.ui").toggle_quick_menu() end,
      {desc = "View project [m]arks"}
    )
    vim.keymap.set(
      "n",
      "<Leader>M", function() require("harpoon.mark").add_file() end,
      {desc = "Add project [M]arks"}
    )
    -- FIX: This shit don't work
    vim.keymap.set(
      "n",
      "gh", function() require("harpoon.ui").nav_file(1) end,
      {desc = "Open primary file"}
    )
    vim.keymap.set(
      "n",
      "gj", function() require("harpoon.ui").nav_file(2) end,
      {desc = "Open secondary file"
      }
    )
    vim.keymap.set(
      "n",
      "gk", function() require("harpoon.ui").nav_file(3) end,
      {desc = "Open tertiary file"}
    )
  end
}
