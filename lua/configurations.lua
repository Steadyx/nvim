if not pcall(
    require, 'vimp'
) then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
end

-- Set leader as space
vim.g.mapleader = " "
local opts = {noremap = true, silent = true}
vim.fn.nvim_set_keymap('n', '<SPACE>','<Nop>' , opts)

-- Save with <Leader> w
vim.fn.nvim_set_keymap('n', '<Leader>w',':w<CR>' , opts)
-- Quit everything with <Leader> x
vim.fn.nvim_set_keymap('n', '<Leader>x',':qa<CR>' , opts)
-- Quit without saving  <Leader> q
vim.fn.nvim_set_keymap('n', '<Leader>z',':q!<CR>' , opts)

vim.cmd [[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]]
vim.cmd [[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]]
vim.cmd [[ set number relativenumber ]]
vim.cmd [[ set expandtab ]]
vim.cmd [[ set tabstop=2 ]]
vim.cmd [[ set shiftwidth=2 ]]
vim.cmd [[ set ignorecase ]]
vim.cmd [[ set smartcase ]]
vim.o.termguicolors = true

vimp.inoremap(
    'jj', '<Esc>'
)

