return function ()
  local opts = { noremap, silent = true }
  vim.fn.nvim_set_keymap('n', '<Leader>gh', ':diffget //3<CR>', opts)
  vim.fn.nvim_set_keymap('n', '<Leader>gu', ':diffget //2<CR>', opts)
  vim.fn.nvim_set_keymap('n', 'gs', ':G<CR>', opts)
end
