return {
  "mfussenegger/nvim-jdtls",
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "java",
  opts = {
    cmd = { vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls") },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    init_options = {
      bundles = vim.split(vim.fn.glob("$HOME/.local/share/nvim/mason/packages/java-*/extension/server/*.jar", 1), "\n"),
    },
  },
  config = function(_, opts)
    require("jdtls").start_or_attach(opts)
  end,
}
