return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      -- Use vim-markdown's syntax (and conceal for **bold** / *italic*) instead of TS for markdown
      disable = { "markdown" },
    },
    indent = { enable = true },
    ensure_installed = {
      "hcl",
      "terraform",
      "markdown",
      "python",
      "elixir",
      "heex",
      "eex",
    },
  },
}
