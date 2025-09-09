return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Load on markdown files but be conservative about when
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian/Travis/obsidian",
      }
    },
    templates = {
      folder = "4 - Templates"
    },
    ui = {
      enable = false,
    },

    note_id_func = function(title)
      return title
    end,

    -- Enable frontmatter management for automatic generation
    disable_frontmatter = false,

    -- -- Configure frontmatter behavior
    -- note_frontmatter_func = function(note)
    --   -- Get filename from current buffer
    --   local bufname = vim.api.nvim_buf_get_name(0)
    --   local filename = vim.fn.fnamemodify(bufname, ":t:r")
      
    --   -- Start with default frontmatter structure
    --   local frontmatter = {
    --     id = filename,
    --     created = os.date("%Y-%m-%d %H:%M:%S"),
    --     modified = os.date("%Y-%m-%d %H:%M:%S"),
    --     aliases = {},
    --   }
      
    --   -- If note already has metadata, preserve existing values
    --   if note.metadata ~= nil then
    --     for key, value in pairs(note.metadata) do
    --       frontmatter[key] = value
    --     end
    --     -- Always update modified timestamp
    --     frontmatter.modified = os.date("%Y-%m-%d %H:%M:%S")
    --   end
      
    --   -- Only add empty tags if they don't already exist
    --   if frontmatter.tags == nil then
    --     frontmatter.tags = {}
    --   end
      
    --   return frontmatter
    -- end,

    -- Disable problematic features that cause buffer errors
    disable_checkbox = true,
    
    -- Disable other features you don't use
    disable_workspace = true,
    disable_templates = true,
    
    -- Disable all checkbox-related commands and mappings
    mappings = {},

    -- see below for full list of options 👇
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    
    -- Override the ObsidianToggleCheckbox command to disable it
    vim.api.nvim_create_user_command('ObsidianToggleCheckbox', function()
      vim.notify("Checkbox functionality is disabled", vim.log.levels.WARN)
    end, {})
  end,
}
