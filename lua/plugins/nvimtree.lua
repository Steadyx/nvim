return function()
   vim.api.nvim_set_var('nvim_tree_width', 40)
   vim.api.nvim_set_var('nvim_tree_ignore ', { '.git', 'node_modules', '.cache' })
   vim.api.nvim_set_var('nvim_tree_gitignore ', 1)
   vim.api.nvim_set_var('nvim_tree_auto_open ', 1)
   vim.api.nvim_set_var('nvim_tree_auto_close ', 1)
   vim.api.nvim_set_var('nvim_tree_auto_ignore_ft ', { 'startify', 'dashboard'})
   vim.api.nvim_set_var('nvim_tree_quit_on_open ', 1)
   vim.api.nvim_set_var('nvim_tree_follow ', 1)
   vim.api.nvim_set_var('nvim_tree_indent_markers', 1)
   vim.api.nvim_set_var('nvim_tree_hide_dotfiles ', 0)
   vim.api.nvim_set_var('nvim_tree_git_hl', 1)
   vim.api.nvim_set_var('nvim_tree_root_folder_modifier ', ':~')
   vim.api.nvim_set_var('nvim_tree_tab_open ', 1)
   vim.api.nvim_set_var('nvim_tree_width_allow_resize', 1)
   vim.api.nvim_set_var('nvim_tree_disable_netrw ', 0)
   vim.api.nvim_set_var('nvim_tree_hijack_netrw ', 0)
   vim.api.nvim_set_var('nvim_tree_add_trailing', 1)
   vim.api.nvim_set_var('nvim_tree_group_empty', 1)
   vim.api.nvim_set_var('nvim_tree_lsp_diagnostics ', 1)

    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap(
        'n', '<C-e>', ':NvimTreeToggle<CR>', opts
    )
end
