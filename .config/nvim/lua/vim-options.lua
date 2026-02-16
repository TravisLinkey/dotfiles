vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.o.splitright = true
-- Allow concealed text (e.g. markdown **bold**) to show as formatted; 2 = show replacement
vim.opt.conceallevel = 2

-- Default zoom/size when opening Neovim (GUI only; terminal uses terminal font size)
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
-- Neovide: lower scale = smaller UI; has no effect in terminal or other GUIs
vim.g.neovide_scale_factor = 0.85

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

-- Goto in new tab - same as <leader>c (tabnew) but opens the referenced file (Obsidian link or LSP definition)
-- Use <Char-125> for } so the mapping is reliably recognized
vim.keymap.set('n', '<leader><Char-125>', function()
  if vim.bo.filetype == 'markdown' and require('obsidian.util').cursor_on_markdown_link() then
    local cur_tab = vim.api.nvim_get_current_tabpage()
    local cur_buf = vim.api.nvim_get_current_buf()
    vim.cmd('tabnew')
    local new_tab = vim.api.nvim_get_current_tabpage()
    vim.cmd('tabprevious')
    vim.cmd('ObsidianFollowLink')
    local linked_path = vim.api.nvim_buf_get_name(0)
    vim.api.nvim_set_current_tabpage(new_tab)
    vim.cmd('e ' .. vim.fn.fnameescape(linked_path))
    vim.api.nvim_set_current_tabpage(cur_tab)
    local winid = vim.api.nvim_tabpage_get_win(cur_tab)
    vim.api.nvim_win_set_buf(winid, cur_buf)
    vim.api.nvim_set_current_tabpage(new_tab)
  else
    vim.cmd('tabnew')
    vim.lsp.buf.definition()
  end
end, { desc = "Go to definition or follow Obsidian link in new tab" })

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

