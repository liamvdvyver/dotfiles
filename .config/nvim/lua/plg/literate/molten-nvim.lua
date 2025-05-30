return {
  "benlubas/molten-nvim",
  -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  dependencies = {

    {
      "quarto-dev/quarto-nvim",
      dependencies = {
        "jmbuhr/otter.nvim",
        "nvim-treesitter/nvim-treesitter",
      },
    },
  },
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12

    -- FROM: https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md

    -- automatically import output chunks from a jupyter notebook
    -- tries to find a kernel that matches the kernel in the jupyter notebook
    -- falls back to a kernel that matches the name of the active venv (if any)
    local imb = function(e) -- init molten buffer
      vim.schedule(function()
        local kernels = vim.fn.MoltenAvailableKernels()
        local try_kernel_name = function()
          local metadata = vim.json.decode(io.open(e.file, "r"):read("a"))["metadata"]
          return metadata.kernelspec.name
        end
        local ok, kernel_name = pcall(try_kernel_name)
        if not ok or not vim.tbl_contains(kernels, kernel_name) then
          kernel_name = nil
          local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
          if venv ~= nil then
            kernel_name = string.match(venv, "/.+/(.+)")
          end
        end
        if kernel_name ~= nil and vim.tbl_contains(kernels, kernel_name) then
          vim.cmd(("MoltenInit %s"):format(kernel_name))
        end
        vim.cmd("MoltenImportOutput")
      end)
    end

    -- automatically import output chunks from a jupyter notebook
    vim.api.nvim_create_autocmd("BufAdd", {
      pattern = { "*.ipynb" },
      callback = imb,
    })

    -- we have to do this as well so that we catch files opened like nvim ./hi.ipynb
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.ipynb" },
      callback = function(e)
        if vim.api.nvim_get_vvar("vim_did_enter") ~= 1 then
          imb(e)
        end
      end,
    })

    -- automatically export output chunks to a jupyter notebook on write
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.ipynb" },
      callback = function()
        if require("molten.status").initialized() == "Molten" then
          vim.cmd("MoltenExportOutput!")
        end
      end,
    })

    vim.keymap.set(
      "n",
      "<localleader>e",
      ":MoltenEvaluateOperator<CR>",
      { silent = true, desc = "run operator selection" }
    )
    vim.keymap.set("n", "<leader>jj", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
    vim.keymap.set("n", "<leader>jc", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
    vim.keymap.set("n", "<leader>jv", ":MoltenEnterOutput<CR>", { silent = true, desc = "re-evaluate cell" })
    vim.keymap.set(
      "v",
      "<leader>j",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      { silent = true, desc = "evaluate visual selection" }
    )
  end,
}
