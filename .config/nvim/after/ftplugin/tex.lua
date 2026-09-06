vim.keymap.set("n", "<localleader>w", function()
  local cmd = '!detex ' .. vim.fn.expand('%') .. ' | wc -w'
  vim.cmd(cmd)
end)
vim.keymap.set({"x", "v"}, "<localleader>w", function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local lines = vim.fn.getline(start_line, end_line)
  local text = table.concat(lines, "\n")

  local output = vim.fn.system("detex | wc -w", text)

  print(vim.trim(output))
end)
vim.o.spell = true
vim.o.conceallevel = 1
vim.cmd([[set formatoptions -=t]])
