vim.o.completeopt = "menuone,noselect"
-- Set leader as space
local opts = {noremap = true, silent = true}
-- Save with <Leader> w
vim.api.nvim_set_keymap('n', '<Leader>w',':w<CR>' , opts)
-- Quit everything with <Leader> x
vim.api.nvim_set_keymap('n', '<Leader>x',':qa<CR>' , opts)
-- Quit without saving  <Leader> q
vim.api.nvim_set_keymap('n', '<Leader>z',':q!<CR>' , opts)

vim.cmd [[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]]
vim.cmd [[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]]
vim.cmd [[ set number relativenumber ]]
vim.cmd [[ set expandtab ]]
vim.cmd [[ set tabstop=2 ]]
vim.cmd [[ set shiftwidth=2 ]]
vim.cmd [[ set ignorecase ]]
vim.cmd [[ set smartcase ]]
vim.o.termguicolors = true

vim.api.nvim_set_keymap(
    'i', 'jj', '<Esc>', opts
)
