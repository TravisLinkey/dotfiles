vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")

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

-- Terminals
vim.keymap.set("n", '<c-w>%', ":ToggleTerm direction=vertical<CR>")
vim.keymap.set("n", '<c-w>"', ":ToggleTerm direction=horizontal<CR>")
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>:CFloatTerm<CR>', {noremap = true, silent = true})

-- Goto in vertical split window
vim.keymap.set('n', '<leader>]', ':vsplit | lua vim.lsp.buf.definition()<CR>')

-- vim functions
vim.keymap.set('n', '<c-t>', ':Note<CR>')
vim.keymap.set('n', '<c-o>', ':New<CR>')


vim.wo.number = true
vim.opt.relativenumber = true
