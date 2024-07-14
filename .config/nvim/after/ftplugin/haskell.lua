vim.keymap.set("n", "<localleader>t", function()
  Run("'doctest ' .bufname('%')")
end, { desc = "Escape" })

vim.keymap.set("n", "<localleader>r", function()
  Run("'cabal v2-build'")
end, { desc = "Escape" })

vim.keymap.set("n", "<localleader>cx", function()
  Run("'cabal v2-run'")
end, { desc = "Escape" })

vim.keymap.set("n", "<localleader>cr", function()
  Run("'cabal v2-repl'")
end, { desc = "Escape" })

vim.keymap.set("n", "<localleader>ct", function()
  Run("'cabal v2-test'")
end, { desc = "Escape" })

if Cwd_matches("*.cabal") then
    vim.o.makeprg = "cabal v2-build"
elseif Cwd_matches("*akefile") then
    vim.o.makeprg = "make"
else
    vim.o.makeprg = "ghc -Wall"
end
