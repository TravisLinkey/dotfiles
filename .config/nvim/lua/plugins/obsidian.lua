return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Only load for files in your obsidian vault, not all markdown files
  event = {
    "BufReadPre ~/Documents/Obsidian/Travis/obsidian/**/*.md",
    "BufNewFile ~/Documents/Obsidian/Travis/obsidian/**/*.md",
  },
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

    -- Configure frontmatter behavior
    note_frontmatter_func = function(note)
      -- This function is called when saving notes
      if note.metadata ~= nil then
        return note.metadata
      end
      
      -- Return default frontmatter if none exists
      return {
        created = os.date("%Y-%m-%d %H:%M:%S"),
        modified = os.date("%Y-%m-%d %H:%M:%S"),
        tags = {},
      }
    end,

    -- see below for full list of options 👇
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
