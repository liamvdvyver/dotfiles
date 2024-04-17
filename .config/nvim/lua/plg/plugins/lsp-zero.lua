return {
  "VonHeikemen/lsp-zero.nvim",
  -- lazy = true, event = "VeryLazy", -- HACK: This is ~50ms slower but using "VeryLazy" breaks start screen
  lazy = false,
  dependencies = {
    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "mfussenegger/nvim-ansible",
    { "rmagatti/goto-preview", opts = { default_mappings = true }, enabled = false },
  },

  config = function()
    local lsp = require("lsp-zero")
    lsp.extend_lspconfig()
    lsp.extend_cmp = 0 -- This messes with autopairs if not disabled
    local builtin = require("telescope.builtin")

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "texlab",
        -- "r_language_server",
        "marksman",
        "efm",
        "clangd",
        "ansiblels",
        "hls",
        "jdtls",
        "tsserver",
      },
      handlers = { lsp.default_setup },
    })

    require("lspconfig").lua_ls.setup({})

    local function filter_formatters(client)
      local format_servers = { efm = true, clangd = true }
      return not not format_servers[client.name]
    end

    lsp.on_attach(function()
      vim.keymap.set("n", "<leader>r", function()
        vim.lsp.buf.rename()
      end, { desc = "[r]ename under cursor" })
      vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float()
      end, { desc = "Open diagnostics" })
      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[g]oto references" })
      vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "[g]oto implementations" })
      vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[g]oto definition" })
      vim.keymap.set("n", "go", builtin.lsp_type_definitions, { desc = "[g]oto type definition" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Fuzzy [f]ind [d]iagnostics" })
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Fuzzy [f]ind [s]ymbols in document" })
      vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols, { desc = "Fuzzy [f]ind symbols in [w]orkspace" })
      vim.keymap.set("n", "<leader>F", function()
        vim.lsp.buf.format({ filter = filter_formatters })
      end, { desc = "[F]ormat buffer" })
      vim.keymap.set("v", "<leader>F", function()
        vim.lsp.buf.format({ filter = filter_formatters })
      end, { desc = "[F]ormat buffer" })
      vim.keymap.set("n", "ga", function()
        vim.lsp.buf.code_action()
      end, { desc = "Code [a]ctions" })
      vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Open documentation" })
      vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Open signature help" })
      vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "[g]oto declaration" })
      vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
    end)
  end,
}
