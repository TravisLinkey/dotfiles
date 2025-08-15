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

    -- Configure frontmatter behavior
    note_frontmatter_func = function(note)
      -- Get filename from current buffer
      local bufname = vim.api.nvim_buf_get_name(0)
      local filename = vim.fn.fnamemodify(bufname, ":t:r")
      
      -- Always return complete frontmatter structure
      local frontmatter = {
        id = filename,
        created = os.date("%Y-%m-%d %H:%M:%S"),
        modified = os.date("%Y-%m-%d %H:%M:%S"),
        tags = {},
        aliases = {},
      }
      
      -- If note already has metadata, merge it with our defaults
      if note.metadata ~= nil then
        for key, value in pairs(note.metadata) do
          if frontmatter[key] == nil then
            frontmatter[key] = value
          end
        end
        -- Always update modified timestamp
        frontmatter.modified = os.date("%Y-%m-%d %H:%M:%S")
      end
      
      return frontmatter
    end,

    -- Disable problematic features that cause buffer errors
    disable_checkbox = true,
    
    -- Disable other features you don't use
    disable_workspace = true,
    disable_templates = true,

    -- see below for full list of options 👇
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
