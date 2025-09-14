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

    -- Disable automatic frontmatter generation to avoid conflicts
    -- We'll handle frontmatter manually in the autocmd
    disable_frontmatter = true,

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
    
    -- Function to manage frontmatter on save
    local function manage_frontmatter()
      local buf = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local current_time = os.date("%Y-%m-%d %H:%M:%S")
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t:r")
      
      -- Check if file has frontmatter
      if #lines > 0 and lines[1] == "---" then
        local frontmatter_end = nil
        for i = 2, #lines do
          if lines[i] == "---" then
            frontmatter_end = i
            break
          end
        end
        
        if frontmatter_end then
          local modified_updated = false
          local created_exists = false
          local id_updated = false
          
          -- Update or add modified field, check for created field, update id field
          for i = 2, frontmatter_end - 1 do
            if lines[i]:match("^modified:") then
              lines[i] = "modified: " .. current_time
              modified_updated = true
            elseif lines[i]:match("^created:") then
              created_exists = true
            elseif lines[i]:match("^id:") then
              lines[i] = "id: " .. filename
              id_updated = true
            end
          end
          
          -- If id field doesn't exist, add it
          if not id_updated then
            table.insert(lines, frontmatter_end, "id: " .. filename)
          end
          
          -- If modified field doesn't exist, add it
          if not modified_updated then
            table.insert(lines, frontmatter_end, "modified: " .. current_time)
          end
          
          -- If created field doesn't exist, add it
          if not created_exists then
            table.insert(lines, frontmatter_end, "created: " .. current_time)
          end
          
          -- Write the updated lines back to the buffer
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        end
      else
        -- No frontmatter exists, create it
        local frontmatter = {
          "---",
          "id: " .. filename,
          "created: " .. current_time,
          "modified: " .. current_time,
          "aliases: []",
          "tags: []",
          "---",
          ""
        }
        
        -- Insert frontmatter at the beginning
        for i, line in ipairs(frontmatter) do
          table.insert(lines, i, line)
        end
        
        -- Write the updated lines back to the buffer
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      end
    end
    
    -- Set up autocmd to update frontmatter on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.md",
      callback = manage_frontmatter,
    })
  end,
}
