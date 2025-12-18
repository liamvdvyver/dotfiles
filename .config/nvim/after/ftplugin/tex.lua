vim.keymap.set("n", "<localleader>w", function()
  local cmd = '!detex ' .. vim.fn.expand('%') .. ' | wc -w'
  vim.cmd(cmd)
end)
vim.o.spell = true
vim.o.conceallevel = 1
vim.cmd([[set formatoptions -=t]])
