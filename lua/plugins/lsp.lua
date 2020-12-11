return function() 
  if not pcall(require, 'vimp') then
    vim.cmd [[ echom 'Cannot load vimp' ]]
    return
  end

  vimp.nnoremap({'silent'}, '<c-]>', "<cmd>lua vim.lsp.buf.definition()<CR>")
  vimp.nnoremap({'silent'}, 'K', "<cmd>lua vim.lsp.buf.hover()<CR>")
  vimp.nnoremap({'silent'}, '<c-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  vimp.nnoremap({'silent'}, 'gy', "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  vimp.nnoremap({'silent'}, 'gd', "<cmd>lua vim.lsp.buf.declaration()<CR>")

  require'lspconfig'.rust_analyzer.setup{}
  require'lspconfig'.vuels.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.intelephense.setup{}
	
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
    },
    -- Disable a feature
    update_in_insert = true,
  })
end 
