return {
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      -- Disable problematic features that cause automatic list insertion
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_follow_anchor = 0
      vim.g.vim_markdown_auto_extension = 0
      vim.g.vim_markdown_edit_url_in = 0

      -- Disable other features that might interfere with obsidian.nvim
      vim.g.vim_markdown_math = 0
      vim.g.vim_markdown_frontmatter = 0
      vim.g.vim_markdown_strikethrough = 0
      vim.g.vim_markdown_autowrite = 0

      -- Basic markdown settings
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_override_foldtext = 0
      vim.g.vim_markdown_folding_level = 6
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_no_extensions_in_markdown = 1
      -- Conceal ** and * so bold/italic show as formatted text instead of raw markers
      vim.g.vim_markdown_conceal = 1
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_folding_style_pythonic = 1
    end
  },
  {
    "mzlogin/vim-markdown-toc",
    ft = "markdown",
    config = function()
      -- Configure markdown TOC
      vim.g.vmt_auto_update_on_save = 0
      vim.g.vmt_dont_insert_fence = 1
    end
  }
}
