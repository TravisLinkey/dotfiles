return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
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
      folder = "5 - Templates"
    },
    ui = {
      enable = false,
    },

    note_id_func = function(title)
      return title
    end,

    -- see below for full list of options 👇
  },

  config = function(_, opts)
    -- Initialize obsidian.nvim with provided options
    require("obsidian").setup(opts)

-- Add an autocommand to update Created On and Last Modified timestamps
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.md",
      callback = function()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        local created_timestamp = os.date("Created On: %Y-%m-%d %H:%M:%S")
        local modified_timestamp = os.date("Last Modified: %Y-%m-%d %H:%M:%S")
        local in_header = false
        local tags_line = nil
        local has_created = false
        local has_modified = false

        -- Detect header boundaries and find tags line
        for i, line in ipairs(lines) do
          if line:match("^---") then
            if not in_header then
              in_header = true
              break
            end
          elseif in_header and line:match("^tags:") then
            tags_line = i
          elseif in_header and line:match("^Created On:") then
            has_created = true
          elseif in_header and line:match("^Last Modified:") then
            lines[i] = modified_timestamp -- Update the existing Last Modified field
            has_modified = true
          end
        end

        -- Insert timestamps below tags:
        if in_header and tags_line then
          if not has_created then
            table.insert(lines, tags_line + 1, created_timestamp) -- Add 'Created On' directly below 'tags:'
          end
          if not has_modified then
            table.insert(lines, tags_line + 2, modified_timestamp) -- Add 'Last Modified' directly below 'Created On'
          end
          vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
        end
      end,
    })
  end,
}
