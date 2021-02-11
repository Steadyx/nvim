if not pcall(
    require, 'vimp'
) then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
end
vim.cmd [[ let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum" ]]
vim.cmd [[ let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum" ]]

vim.o.termguicolors = true

vim.cmd [[ set number relativenumber ]]

vimp.inoremap(
    'jj', '<Esc>'
)

