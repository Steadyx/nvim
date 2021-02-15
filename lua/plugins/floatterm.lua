return function ()
   vim.fn.nvim_set_keymap('n', '<Leader>i', '<CMD>lua require"FTerm".toggle()<CR>', { noremap = true, silent = true })
   vim.fn.nvim_set_keymap('t', '<Leader>i', '<C-\\><C-n><CMD>lua require"FTerm".toggle()<CR>', { noremap = true, silent = true })
end
