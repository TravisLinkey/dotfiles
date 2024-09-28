vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.o.splitright = true

-- Custom functions
vim.keymap.set('n', '<leader>j', ':JavaScriptCode<CR>')
vim.keymap.set('n', '<leader>p', ':PythonCode<CR>')
vim.keymap.set('n', '<c-i>', ':IAM<CR>')
vim.keymap.set('n', '<c-t>', ':Tag<CR>')
vim.keymap.set('n', '<c-o>', ':New<CR>')
vim.keymap.set('n', '<c-c>', ':Leetcode<CR>')
vim.keymap.set('n', '<c-m>', ':TelescopeMoveFile<CR>')

-- Navigate vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Naviate tabs
vim.keymap.set("n", "<c-w>t", ":tabnew<CR>")
vim.keymap.set("n", "<c-w>n", ":+tabnext<CR>")
vim.keymap.set("n", "<c-w>p", ":-tabnext<CR>")

-- Split windows
vim.keymap.set("n", "<leader>%", ":vsplit<CR>")
vim.keymap.set("n", '<leader>"', ":split<CR>")

-- Terminals
vim.keymap.set("n", '<c-w>%', ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", '<c-w>"', ":ToggleTerm direction=horizontal<CR>")
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:CFloatTerm<CR>', {noremap = true, silent = true})

-- Window width 
vim.keymap.set("n", "<leader>>", ":vertical resize +70<CR>")
vim.keymap.set("n", '<leader><', ":vertical resize -70<CR>")


-- Goto in vertical split window
vim.keymap.set('n', '<leader>]', '<cmd>lua vim.lsp.buf.definition()<CR>')



vim.wo.number = true
vim.opt.relativenumber = true
