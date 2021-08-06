return function()
    vim.cmd [[highlight QuickScopePrimary guifg=#18fc03 ctermfg=155 gui=underline cterm=underline]]
    vim.cmd [[highlight QuickScopeSecondary guifg=#fc0345 ctermfg=81 gui=underline cterm=underline]]

    vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    vim.g.qs_max_chars = 120
end
