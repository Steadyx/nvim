return function()
  if not pcall(require, 'vimp') then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
  end

  vimp.nnoremap('<c-p>', "<cmd>lua require('telescope.builtin').find_files()<CR>")
  vimp.nnoremap({'silent'}, 'gb', "<cmd>lua require('telescope.builtin').buffers{ show_all_buffers = true }<cr>")
  vimp.nnoremap({'silent'}, 'gr', "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>")
  vimp.nnoremap({'silent'}, 'g0', "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>")
  vimp.nnoremap({'silent'}, 'gp', "<cmd>lua require'telescope.builtin'.live_grep{}<CR>")
  vimp.nnoremap({'silent'}, 'gW', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>")
  vimp.nnoremap({'silent'}, 'gc', "<cmd>lua require'telescope.builtin'.git_branches{}<CR>")
  vimp.nnoremap({'silent'}, 'gs', "<cmd>lua require'telescope.builtin'.git_status{}<CR>")

  require('telescope').setup{
    defaults = {
      prompt_position = "top",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
    }
  }
end
