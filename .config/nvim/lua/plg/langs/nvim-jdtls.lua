return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "java",
  keys = {
    {"<localleader>tp", function() require("jdtls").pick_test() end, desc = "[t]est [p]icker"},
    {"<localleader>tm", function() require("jdtls").test_nearest_method() end, desc = "[t]est nearest [m]ethod"},
    {"<localleader>tc", function() require("jdtls").test_class() end, desc = "[t]est [c]lass"},
    {"<localleader>tg", function() require("jdtls.tests").generate() end, desc = "[t]est [c]lass"},
    {"<localleader>to", function() require("jdtls.tests").goto_subjects() end, desc = "go[t]o [t]ests"},
  },
  opts = {
    cmd = { vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls") },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    init_options = {
      bundles = vim.split(vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-*/extension/server/*.jar", 1), "\n"),
    },
  },
  config = function(_, opts)
    -- opts.init_options.bundles = vim.tbl_extend(
    --   "force",
    --   opts.init_options.bundles,
    --   vim.split(vim.fn.glob("$HOME/Downloads/test/extension/server/*.jar", 1), "\n")
    -- )
    require("jdtls").start_or_attach(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "java" },
      callback = function()
        require("jdtls").start_or_attach(opts)
      end,
      -- group = generalSettingsGroup,
    })
  end,
}
