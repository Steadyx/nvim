return function() 
 -- Change to proper lua when you figure it out
 vim.cmd [[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]]
 vim.cmd [[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
 vim.cmd[[set completeopt=menuone,noinsert,noselect]]
 vim.cmd[[set shortmess+=c]]
end
