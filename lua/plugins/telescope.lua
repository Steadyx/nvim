return function()
    local opts = { noremap = true, silent = true }

    require('telescope').setup {
        defaults = { layout_config = { prompt_position = "top" } }
    }

    vim.api.nvim_set_keymap('n', '<c-p>',
                            "<cmd>lua require('telescope.builtin').find_files()<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gb',
                            "<cmd>lua require('telescope.builtin').buffers{ show_all_buffers = true }<cr>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gr',
                            "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'g0',
                            "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gp',
                            "<cmd>lua require'telescope.builtin'.live_grep{}<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gW',
                            "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gc',
                            "<cmd>lua require'telescope.builtin'.git_branches{}<CR>",
                            opts)
    vim.api.nvim_set_keymap('n', 'gr',
                            "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>",
                            opts)

end
