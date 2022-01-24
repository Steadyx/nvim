return function()
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_set_keymap

    map('n', '<Leader>dd', ':call vimspector#Launch()<CR>', opts)
    map('n', '<Leader>de', ':call vimspector#Reset()<CR>', opts)
    map('n', '<Leader>dc', ':call vimspector#Continue()<CR>', opts)
    map('n', '<Leader>dt', ':call vimspector#ToggleBreakpoint()<CR>', opts)
    map('n', '<Leader>dT', ':call vimspector#ClearBreakpoints()<CR>', opts)
    map('n', '<Leader>dh', ':call vimspector#StepOut()<CR>', opts)
    map('n', '<Leader>dl', ':call vimspector#StepInto()<CR>', opts)
    map('n', '<Leader>dj', ':call vimspector#StepOver()<CR>', opts)
end
