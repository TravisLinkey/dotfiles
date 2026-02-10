vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.o.splitright = true

-- Command to move files (replacement for Ctrl+M)
vim.api.nvim_create_user_command('MoveFile', function()
  vim.cmd(':TelescopeMoveFile')
end, {})

-- Custom functions
vim.keymap.set('n', '<c-t>', ':ObsidianTemplate<CR>')
vim.keymap.set('n', '<c-o>', ':ObsidianNew<CR>')
vim.keymap.set('n', '<leader>mv', ':TelescopeMoveFile<CR>')
vim.keymap.set('n', '<leader>ts', function()
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  vim.api.nvim_put({ timestamp }, 'l', true, true)
end, { desc = "Insert timestamp" })

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
vim.keymap.set("n", "<leader><Up>", ":horizontal resize +10<CR>")
vim.keymap.set("n", '<leader><Down>', ":horizontal resize -10<CR>")

vim.keymap.set("n", "<leader><Left>", ":vertical resize +10<CR>")
vim.keymap.set("n", '<leader><Right>', ":vertical resize -10<CR>")


-- Goto in vertical split window - smart mapping for LSP and Obsidian links
vim.keymap.set('n', '<leader>]', function()
  -- Check if we're in a markdown file and on an Obsidian link
  if vim.bo.filetype == 'markdown' and require('obsidian.util').cursor_on_markdown_link() then
    -- Follow Obsidian link in vertical split
    vim.cmd('vsplit')
    vim.cmd('ObsidianFollowLink')
  else
    -- Use LSP definition for other file types
    vim.lsp.buf.definition()
  end
end, { desc = "Go to definition or follow Obsidian link" })

-- Toggle checkbox functionality
vim.keymap.set('n', '<leader>r', function()
  local line = vim.api.nvim_get_current_line()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
  
  -- Check if line already has a checkbox
  local checkbox_pattern = '^%s*%-%s*%[%s*%]%s*'
  local checked_pattern = '^%s*%-%s*%[%s*[xX]%s*%]%s*'
  
  if line:match(checked_pattern) then
    -- Toggle checked to unchecked
    local new_line = line:gsub('%-%s*%[%s*[xX]%s*%]', '- [ ]')
    vim.api.nvim_set_current_line(new_line)
  elseif line:match(checkbox_pattern) then
    -- Toggle unchecked to checked
    local new_line = line:gsub('%-%s*%[%s*%]', '- [x]')
    vim.api.nvim_set_current_line(new_line)
  else
    -- Add checkbox to beginning of line
    local indent = line:match('^(%s*)')
    local new_line = indent .. '- [ ] ' .. line:gsub('^%s*', '')
    vim.api.nvim_set_current_line(new_line)
  end
  
  -- Restore cursor position
  vim.api.nvim_win_set_cursor(0, {vim.api.nvim_win_get_cursor(0)[1], cursor_col})
end, { noremap = true, silent = true })


vim.wo.number = true
vim.opt.relativenumber = true

-- Enable syntax highlighting
vim.cmd("syntax on")

