return {
  "TravisLinkey/obsidian-hover.nvim",
  ft = "markdown",
  config = function()
    require("obsidian-hover").setup({
      vault_path = "~/Documents/Obsidian/Travis/obsidian",
    })
  end,
}

