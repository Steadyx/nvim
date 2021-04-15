return function()
    local opts = {noremap = true, silent = true}

    vim.api.nvim_set_keymap(
        'n', '<C-e>', ':NvimTreeToggle<CR>', opts
    )
end
