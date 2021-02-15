return function(client, bufnr)
    if not pcall(require, 'vimp') then
        vim.cmd [[ echom 'Cannot load vimp' ]]
        return
    end

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local noremap = vimp.nnoremap
    local opts = {noremap = true, silent = true}

    vim.fn.nvim_set_keymap('n', '<c-p>', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
    vim.fn.nvim_set_keymap('n', 'gb', "<cmd>lua require('telescope.builtin').buffers{ show_all_buffers = true }<cr>", opts)
    vim.fn.nvim_set_keymap('n', 'gr', "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>", opts)
    vim.fn.nvim_set_keymap('n', 'g0', "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
    vim.fn.nvim_set_keymap('n', 'gp', "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)
    vim.fn.nvim_set_keymap('n', 'gW', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>", opts)
    vim.fn.nvim_set_keymap('n', 'gc', "<cmd>lua require'telescope.builtin'.git_branches{}<CR>", opts)

    require('telescope').setup {
        defaults = {
            prompt_position = "top",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal"
        }
    }
end
