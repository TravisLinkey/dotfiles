return {
  "TravisLinkey/nvim-tag-suggestions",
  enabled = false,
  tag = "v1.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "BufReadPre *.md",
  cmd = { "TagSuggestions", "TagSuggestionsAI", "TagSuggestionsDebug" },
  config = function()
    require("nvim-tag-suggestions").setup({
      -- Enable AI-powered suggestions (requires OPENAI_API_KEY environment variable)
      enable_ai = true,
      -- OpenAI API key from environment variable
      openai_api_key = os.getenv("OPENAI_API_KEY"),
      -- Other configuration options
      trigger_key = "<leader>ts",
      max_suggestions = 8,
      use_telescope = true,
    })
  end,
}
