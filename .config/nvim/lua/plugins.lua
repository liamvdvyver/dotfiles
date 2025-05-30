local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- local opts = { dev = { path = "~/git" } }

local base_dir = vim.fn.stdpath("config") .. "/lua/plg/"
local all_subdirs = vim.fn.glob(base_dir .. "*")

local specs = {}
for _, dir in ipairs(vim.fn.split(all_subdirs, '\n')) do
  local new_entry = {import = "plg." .. dir:gsub(base_dir, "")}
  table.insert(specs, new_entry)
end

require("lazy").setup(specs)
