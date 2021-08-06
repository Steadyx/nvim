return function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<Leader>h',
                            "<cmd>lua require'hop'.hint_words()<cr>", {})
end
