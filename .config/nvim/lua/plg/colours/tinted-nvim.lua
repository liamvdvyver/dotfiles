return {
  "tinted-theming/tinted-nvim",
  priority = 1000,
  lazy = false,
  opts = {
    default_scheme = "base16-catppuccin-mocha",
    selector = {
      enabled = true, -- default `false`
    },
    apply_scheme_on_startup = true, -- default `true`

    -- Compile the scheme for faster startup.
    compile = true, -- default `false`
  },
  config = function(_, opts)
    require("tinted-nvim").setup(opts)
    require("tinted-nvim").load()
  end,
}
