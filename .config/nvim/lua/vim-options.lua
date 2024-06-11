vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false
vim.o.splitright = true

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Split windows
vim.keymap.set("n", "<leader>%", ":vsplit<CR>")
vim.keymap.set("n", '<leader>"', ":split<CR>")

-- Goto in vertical split window
vim.keymap.set('n', '<leader>]', ':vsplit | lua vim.lsp.buf.definition()<CR>')

vim.wo.number = true
vim.opt.relativenumber = true
