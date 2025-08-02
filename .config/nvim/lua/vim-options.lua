vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.o.splitright = true

-- Function to ensure buffer is modifiable for obsidian operations
vim.api.nvim_create_user_command('EnsureModifiable', function()
  vim.bo.modifiable = true
  vim.bo.readonly = false
  vim.notify("Buffer is now modifiable", vim.log.levels.INFO)
end, {})

-- Command to move files (replacement for Ctrl+M)
vim.api.nvim_create_user_command('MoveFile', function()
  vim.cmd(':TelescopeMoveFile')
end, {})

-- Safe checkbox toggle function
-- vim.api.nvim_create_user_command('ToggleCheckbox', function()
--   -- Ensure buffer is modifiable
--   vim.bo.modifiable = true
--   vim.bo.readonly = false
  
--   -- Try to toggle checkbox safely
--   local success, result = pcall(function()
--     require("obsidian").util.toggle_checkbox()
--   end)
  
--   if not success then
--     vim.notify("Failed to toggle checkbox: " .. tostring(result), vim.log.levels.ERROR)
--   end
-- end, {})

-- Ensure markdown buffers are modifiable for obsidian.nvim
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.bo.modifiable = true
    vim.bo.readonly = false
  end,
})

-- Additional autocommand to ensure modifiability when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.md",
  callback = function()
    vim.bo.modifiable = true
    vim.bo.readonly = false
  end,
})

-- Add frontmatter on save for obsidian vault files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.md",
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    
    -- Only process files in the obsidian vault
    if bufname:match("Documents/Obsidian/Travis/obsidian") then
      vim.notify("Processing obsidian file: " .. bufname, vim.log.levels.INFO)
      
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local has_frontmatter = false
      
      -- Check if file already has frontmatter
      if #lines > 0 and lines[1] == "---" then
        for i = 2, #lines do
          if lines[i] == "---" then
            has_frontmatter = true
            break
          end
        end
      end
      
      -- Add frontmatter if it doesn't exist
      if not has_frontmatter then
        vim.notify("Adding frontmatter to: " .. bufname, vim.log.levels.INFO)
        
        -- Get the filename without extension for the ID
        local filename = vim.fn.fnamemodify(bufname, ":t:r")
        vim.notify("Filename for ID: " .. filename, vim.log.levels.INFO)
        
        local metadata = {
          "---",
          "id: " .. filename,
          "created: " .. os.date("%Y-%m-%d %H:%M:%S"),
          "modified: " .. os.date("%Y-%m-%d %H:%M:%S"),
          "tags: []",
          "aliases: []",
          "---",
          ""
        }
        
        vim.notify("Metadata lines: " .. vim.inspect(metadata), vim.log.levels.INFO)
        
        -- Insert metadata at the beginning
        local success = pcall(function()
          vim.api.nvim_buf_set_lines(0, 0, 0, false, metadata)
        end)
        
        if success then
          vim.notify("Frontmatter added successfully", vim.log.levels.INFO)
        else
          vim.notify("Failed to add frontmatter", vim.log.levels.ERROR)
        end
      else
        vim.notify("File already has frontmatter: " .. bufname, vim.log.levels.INFO)
      end
    end
  end,
})

-- Custom functions
vim.keymap.set('n', '<c-t>', ':ObsidianTemplate<CR>')
vim.keymap.set('n', '<c-o>', ':ObsidianNew<CR>')
vim.keymap.set('n', '<leader>mv', ':TelescopeMoveFile<CR>')

-- Toggle checkbox in markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Only set up checkbox toggle if it's a real markdown file (not neo-tree)
    local bufname = vim.api.nvim_buf_get_name(0)
    if vim.bo.buftype ~= "nofile" and not bufname:match("neo%-tree") then
      vim.keymap.set("n", "<leader>;", function()
        if vim.bo.modifiable then
          require("obsidian").util.toggle_checkbox()
        else
          vim.notify("Buffer is not modifiable", vim.log.levels.WARN)
        end
      end, { buffer = true, noremap = true })
    end
  end,
})

-- Navigate vim panes

-- Navigate vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Navigate tabs
vim.keymap.set("n", "<leader>c", ":tabnew<CR>")
vim.keymap.set("n", "<leader>n", ":tabnext<CR>")
vim.keymap.set("n", "<leader>p", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>rn", ":RenameBuffer<CR>", { noremap = true, silent = true })

-- Split windows
vim.keymap.set("n", "<leader>%", ":vsplit<CR>")
vim.keymap.set("n", '<leader>"', ":split<CR>")

-- Terminals
vim.keymap.set("n", '<c-w>%', ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", '<c-w>"', ":ToggleTerm direction=horizontal<CR>")
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:CFloatTerm<CR>', {noremap = true, silent = true})

-- Window width 
-- vim.keymap.set("n", "<leader>>", ":vertical resize +70<CR>")
-- vim.keymap.set("n", '<leader><', ":vertical resize -70<CR>")

vim.keymap.set("n", "<leader><Left>", ":vertical resize +30<CR>")
vim.keymap.set("n", '<leader><Right>', ":vertical resize -30<CR>")


-- Goto in vertical split window
vim.keymap.set('n', '<leader>]', '<cmd>lua vim.lsp.buf.definition()<CR>')


vim.wo.number = true
vim.opt.relativenumber = true

-- Enable syntax highlighting
vim.cmd("syntax on")

