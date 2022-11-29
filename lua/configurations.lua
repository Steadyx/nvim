vim.o.completeopt = "menuone,noselect"
-- Set leader as space
local opts = { noremap = true, silent = true }
-- Remap Leader to Space
vim.g.mapleader = " "
-- Save with <Leader> w
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
-- Quit everything with <Leader> x
vim.keymap.set("n", "<Leader>x", ":qa!<CR>", opts)
-- Quit without saving  <Leader> q
vim.keymap.set("n", "<Leader>z", ":q!<CR>", opts)
-- create a keymap for cdo quickfix, open floating window to rename
vim.keymap.set("n", "<Leader>rr", ":cdo s//", opts)
-- cfdo up to update files
vim.keymap.set("n", "<Leader>uu", ":cfdo up<CR>", opts)
-- open quickfix list
vim.keymap.set("n", "<Leader>qo", ":copen<CR>", opts)

vim.o.stl = " "
vim.o.wbr = vim.o.stl

vim.cmd([[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]])
vim.cmd([[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]])
vim.cmd([[ set number relativenumber ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set tabstop=2 ]])
vim.cmd([[ set shiftwidth=2 ]])
vim.cmd([[ set ignorecase ]])
vim.cmd([[ set smartcase ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ set wrap ]])
vim.cmd([[ set linebreak ]])
vim.cmd([[ set tw=80 ]])

vim.o.termguicolors = true

vim.keymap.set("i", "jj", "<Esc>", opts)
