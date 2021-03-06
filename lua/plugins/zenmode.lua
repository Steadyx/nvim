return function()
    require('zen-mode').setup {
      plugins = {
       twilight = { enabled = true },
      }
    }

    local opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap(
        'n', '<Leader>c', "<cmd>lua require'zen-mode'.toggle({})<cr>", {}
    )
end
