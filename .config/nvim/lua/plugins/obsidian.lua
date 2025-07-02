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
      folder = "4 - Templates"
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
    require("obsidian").setup(opts)
    
    -- Add custom checkbox toggle mapping that works with completion plugin
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        -- Ensure buffer is modifiable
        vim.bo.modifiable = true
        vim.bo.readonly = false
        
        -- Map Enter to toggle checkbox when cursor is on a checkbox line
        vim.keymap.set("n", "<CR>", function()
          local line = vim.api.nvim_get_current_line()
          -- Check if the line contains a checkbox (more specific pattern)
          if line:match("^%s*%-%s*%[%s?%]") or line:match("^%s*%-%s*%[x%]") or 
             line:match("^%s*%*%s*%[%s?%]") or line:match("^%s*%*%s*%[x%]") or
             line:match("^%s*%+%s*%[%s?%]") or line:match("^%s*%+%s*%[x%]") then
            -- Toggle checkbox
            if vim.bo.modifiable then
              require("obsidian").util.toggle_checkbox()
            else
              vim.notify("Buffer is not modifiable", vim.log.levels.WARN)
            end
          else
            -- Normal Enter behavior
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
          end
        end, { buffer = true, noremap = true })
        
        -- Alternative mapping for checkbox toggle
        vim.keymap.set("n", "<leader>ch", function()
          if vim.bo.modifiable then
            require("obsidian").util.toggle_checkbox()
          else
            vim.notify("Buffer is not modifiable", vim.log.levels.WARN)
          end
        end, { buffer = true, noremap = true })
      end,
    })
  end,
}
