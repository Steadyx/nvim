return function()
  if not pcall(require, 'vimp') then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
  end

  vimp.nnoremap('<c-p>', "<cmd>lua require('telescope.builtin').find_files()<CR>")
  vimp.nnoremap({'silent'}, 'gb', "<cmd>lua require('telescope.builtin').buffers()<CR>")
  vimp.nnoremap({'silent'}, 'gr', "<cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>")
  vimp.nnoremap({'silent'}, 'g0', "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>")
  vimp.nnoremap({'silent'}, 'gp', "<cmd>lua require'telescope.builtin'.live_grep{}<CR>")
  vimp.nnoremap({'silent'}, 'gW', "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>")
  vimp.nnoremap({'silent'}, 'gc', "<cmd>lua require'telescope.builtin'.git_branches{}<CR>")
  vimp.nnoremap({'silent'}, 'gs', "<cmd>lua require'telescope.builtin'.git_status{}<CR>")

  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_position = "top",
      prompt_prefix = ">",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      file_sorter =  require'telescope.sorters'.get_fzy_sorter,
      file_ignore_patterns = {},
      generic_sorter =  require'telescope.sorters'.fuzzy_with_index_bias,
      shorten_path = true,
      winblend = 0,
      width = 0.75,
      preview_cutoff = 120,
      results_height = 1,
      results_width = 0.8,
      border = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' },
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
  }
end
