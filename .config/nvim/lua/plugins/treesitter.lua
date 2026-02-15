return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = { enable = true },
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
