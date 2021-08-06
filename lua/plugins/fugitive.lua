return function()
    local opts = { noremap, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>gh', ':diffget //3<CR>', opts)
    vim.api.nvim_set_keymap('n', '<Leader>gu', ':diffget //2<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gs', ':G<CR>', opts)
end
