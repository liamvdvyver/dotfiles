vim.keymap.set("n", "<localleader>w", function()
  Run("'detex ' . expand('%') . ' | wc -w'")
end)
vim.o.spell = true
vim.o.conceallevel = 1
vim.cmd([[set formatoptions -=t]])
