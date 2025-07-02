return {
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      -- Configure vim-markdown for better checkbox support
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_override_foldtext = 0
      vim.g.vim_markdown_folding_level = 6
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_autowrite = 1
      vim.g.vim_markdown_new_list_item_indent = 2
      vim.g.vim_markdown_no_extensions_in_markdown = 1
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      
      -- Disable checkbox conceal specifically
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      
      -- Additional settings to prevent checkbox rendering issues
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_folding_style_pythonic = 1
      
      -- Ensure buffer is modifiable for obsidian.nvim compatibility
      vim.g.vim_markdown_edit_url_in = 'tab'
      vim.g.vim_markdown_follow_anchor = 1
      
      -- Disable features that might interfere with obsidian.nvim
      vim.g.vim_markdown_auto_insert_bullets = 0
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_strikethrough = 0
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