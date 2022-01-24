return function()
    local opts = { noremap = true, silent = true }

    require('telescope').setup {
        defaults = {
            vimgrep_arguments = {
                'rg', '--color=never', '--no-heading', '--with-filename',
                '--line-number', '--column', '--smart-case'
            },
            prompt_prefix = "> ",
            selection_caret = "> ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                horizontal = { mirror = false },
                vertical = { mirror = true }
            },
            file_sorter = require'telescope.sorters'.get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            borderchars = {
                '─', '│', '─', '│', '╭', '╮', '╯', '╰'
            },
            color_devicons = true,
            use_less = true,
            path_display = {},
            set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new,

            -- Developer configurations: Not meant for general override
            buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
        }
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

    vim.api.nvim_set_keymap('n', 'gk',
                            "<cmd>lua require'telescope.builtin'.keymaps{}<CR>",
                            opts)
end
