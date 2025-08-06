return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Use ft = "markdown" to ensure it loads for all markdown files
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

    -- disable_frontmatter = false,

    -- -- Configure frontmatter behavior
    -- note_frontmatter_func = function(note)
    --   -- This function is called when saving notes
    --   if note.metadata ~= nil then
    --     return note.metadata
    --   end
      
    --   -- Get filename from current buffer
    --   local bufname = vim.api.nvim_buf_get_name(0)
    --   local filename = vim.fn.fnamemodify(bufname, ":t:r")
      
    --   -- Return default frontmatter if none exists
    --   return {
    --     id = filename,
    --     created = os.date("%Y-%m-%d %H:%M:%S"),
    --     modified = os.date("%Y-%m-%d %H:%M:%S"),
    --     tags = {},
    --     aliases = {},
    --   }
    -- end,


     -- Optional, boolean or a function that takes a filename and returns a boolean.
  -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
  note_frontmatter_func = function(note)
    vim.notify("Frontmatter function called for: " .. tostring(note.path), vim.log.levels.INFO)
    
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    -- Try to preserve order by building metadata carefully
    local out = {}
    
    -- First, check if we need to preserve existing created/modified times
    local existing_created = nil
    local existing_modified = nil
    
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      existing_created = note.metadata.created
      existing_modified = note.metadata.modified
    end
    
    -- Build the frontmatter in desired order
    local frontmatter = {
      id = note.id,
      created = existing_created or os.date("%Y-%m-%d %H:%M:%S"),
      modified = os.date("%Y-%m-%d %H:%M:%S"),
      aliases = note.aliases,
      tags = note.tags
    }
    
    -- Add any other existing metadata fields
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        if k ~= "id" and k ~= "created" and k ~= "modified" and k ~= "aliases" and k ~= "tags" then
          frontmatter[k] = v
        end
      end
    end

    vim.notify("Frontmatter output: " .. vim.inspect(frontmatter), vim.log.levels.INFO)
    return frontmatter
  end,

    -- see below for full list of options 👇
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
